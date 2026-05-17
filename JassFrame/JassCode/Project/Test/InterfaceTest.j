//! zinc

library InterfaceTest {

    private {
        constant string INTERFACE_TEST_CASE_PREFIX = "[InterfaceTest][CASE] ";
        constant string INTERFACE_TEST_PASS_PREFIX = "[InterfaceTest][PASS] ";
        constant string INTERFACE_TEST_FAIL_PREFIX = "[InterfaceTest][FAIL] ";
        constant string INTERFACE_TEST_SUMMARY_PREFIX = "[InterfaceTest][SUMMARY] ";
        constant integer INTERFACE_TEST_PHASE_COUNT = 4;
        constant integer INTERFACE_TEST_PLANNED_CASE_COUNT = 8;
        constant integer INTERFACE_TEST_PLANNED_MAX_SCORE = 92;
    }

    // 统一的测试用例接口。
    // 这组方法专门用于验证 interface 多态派发是否正常：
    // 1. 调度器只拿到接口类型时，是否还能正确调用到具体 struct 的实现。
    // 2. 同一个对象被当成 ITestCase 视角传递后，返回值是否仍然稳定。
    interface ITestCase {
        method GetName() -> string;
        method GetExpectedValue() -> integer;
        method GetScore() -> integer;
        method RunCase() -> integer;
    }

    // 统一的追踪接口。
    // 这里保持纯接口签名，不带默认实现，确保 interface 回归聚焦在多态派发本身。
    interface ITraceable {
        method GetPhaseName() -> string;
        method BuildTrace() -> string;
        method GetTraceLevel() -> integer;
    }

    // 统一的结果判定接口。
    // 同样保持纯接口签名，让结果判定也走明确的 implements 路径。
    interface IResultPolicy {
        method IsSuccess(integer actualValue, integer expectedValue) -> boolean;
        method BuildSummary(string caseName, integer actualValue, integer expectedValue) -> string;
        method GetPolicyWeight() -> integer;
    }

    // 计数模块。
    // 这个 module 用来验证：
    // 1. module 字段是否会正确注入到 struct。
    // 2. 注入的方法是否能直接读写 struct 上的状态。
    // 3. 同一 module 被多个 struct 混入后，实例状态是否彼此隔离。
    module CounterModule {
        integer counterValue;

        // 复位计数器，确保每次回归都是从干净状态开始。
        method ResetCounter() {
            this.counterValue = 0;
        }

        // 增加计数并返回累计值。
        // 之所以返回累计值而不是增量，是为了更容易从日志里看出状态是否串台。
        method TouchCounter(const integer delta) -> integer {
            this.counterValue = this.counterValue + delta;
            return this.counterValue;
        }

        // 读取当前累计值，供 trace 和断言汇总使用。
        method ReadTouchCount() -> integer {
            return this.counterValue;
        }
    }

    // 命名模块。
    // 这个 module 负责拼装字符串快照，便于验证 module 中的字符串字段和方法注入。
    module NamingModule {
        string namePrefix;
        integer nameSeed;

        // 写入名字前缀和种子。
        // 这个状态会被多个 case 重复覆盖，用来验证 module 字段写入是否稳定。
        method ConfigureName(const string prefix, const integer seed) {
            this.namePrefix = prefix;
            this.nameSeed = seed;
        }

        // 构造一个稳定字符串，便于日志比对和长度计算。
        method BuildModuleName() -> string {
            return this.namePrefix + "-" + I2S(this.nameSeed);
        }

        // 返回命名种子，方便在 trace 里确认 module 字段读取正常。
        method ReadNameSeed() -> integer {
            return this.nameSeed;
        }
    }

    // 阶段模块。
    // 这个 module 用来验证多个 module 叠加到同一 struct 后，额外字段和方法仍然可用。
    module PhaseModule {
        integer phaseToken;

        // 复位阶段 token，避免多次运行时残留上次状态。
        method ResetPhaseToken() {
            this.phaseToken = 0;
        }

        // 直接设置基础 token，方便测试“先赋值再累加”的行为。
        method SetPhaseToken(const integer token) {
            this.phaseToken = token;
        }

        // 累加阶段 token 并返回结果。
        // 这个返回值会直接参与公式计算，用来暴露 module 方法分发或字段注入问题。
        method MixPhase(const integer extra) -> integer {
            this.phaseToken = this.phaseToken + extra;
            return this.phaseToken;
        }

        // 读取当前 token，供 trace 日志使用。
        method ReadPhaseToken() -> integer {
            return this.phaseToken;
        }
    }

    // stub 基类。
    // 这里刻意把默认行为放在父类里，再让子类选择覆写或不覆写，
    // 用来验证 stub method 的两个关键路径：
    // 1. 父类视角读取未覆写子类时，是否命中默认实现。
    // 2. 父类视角读取已覆写子类时，是否命中子类实现。
    struct StubCaseBase {
        integer baseSeed;
        string baseLabel;

        // 初始化 stub 基类的统一输入。
        // 所有子类都通过同一入口写入基础状态，便于横向比较默认 stub 和覆写 stub 的差异。
        method SetupStubBase(const integer seed, const string label) {
            this.baseSeed = seed;
            this.baseLabel = label;
        }

        // 默认的 stub 字符串实现。
        // 未覆写的子类应该直接返回这个版本，日志里可以据此判断默认分发是否正常。
        public stub method GetStubLabel() -> string {
            return this.baseLabel + ":STUB-DEFAULT";
        }

        // 默认的 stub 数值实现。
        // 子类如果不覆写，这个默认值会直接参与最终断言公式。
        public stub method GetStubBonus() -> integer {
            return this.baseSeed + 1;
        }
    }

    // 统一拼接数值类断言摘要。
    // 每个 case 的 policy 最终都会走到这里，保证日志格式一致，便于你跑图后直接筛选。
    private function BuildNumberSummary(const string caseName, const integer actualValue, const integer expectedValue, const integer traceLevel, const integer policyWeight) -> string {
        return "case=" + caseName + ", expected=" + I2S(expectedValue) + ", actual=" + I2S(actualValue) + ", traceLevel=" + I2S(traceLevel) + ", policyWeight=" + I2S(policyWeight);
    }

    // 统一拼接字符串类断言摘要。
    // stub 专项检查会用这个格式，方便区分“值不对”还是“分发错了”。
    private function BuildStringSummary(const string caseName, const string actualValue, const string expectedValue) -> string {
        return "case=" + caseName + ", expected=" + expectedValue + ", actual=" + actualValue;
    }

    // 从 ITestCase 视角读取用例名称。
    // 这层函数存在的意义，是强行让编译器走一次接口参数派发路径，而不是直接用具体 struct。
    private function ReadCaseName(ITestCase testCase) -> string {
        return testCase.GetName();
    }

    // 从 ITestCase 视角读取预期值。
    // 这样可以验证接口参数不只是能调用一个方法，而是能稳定读取整套契约。
    private function ReadExpectedValue(ITestCase testCase) -> integer {
        return testCase.GetExpectedValue();
    }

    // 从 ITestCase 视角读取分数配置。
    // 这个值参与汇总分数，能额外验证接口返回整数是否正常。
    private function ReadCaseScore(ITestCase testCase) -> integer {
        return testCase.GetScore();
    }

    // 从 ITestCase 视角执行主逻辑。
    // 这里是 interface 回归的核心路径之一：调度器只知道接口类型，但仍应命中具体实现。
    private function RunCaseByInterface(ITestCase testCase) -> integer {
        return testCase.RunCase();
    }

    // 从 ITraceable 视角读取阶段名。
    // 这个值会被和外部 phaseName 一起打印，用来判断多接口组合是否读到了正确实现。
    private function ReadTracePhase(ITraceable traceable) -> string {
        return traceable.GetPhaseName();
    }

    // 从 ITraceable 视角读取 trace 级别。
    // 这里既覆盖普通接口整数返回，也覆盖不同子类返回值是否会稳定分发。
    private function ReadTraceLevel(ITraceable traceable) -> integer {
        return traceable.GetTraceLevel();
    }

    // 从 ITraceable 视角读取完整 trace 文本。
    // 这样可以在统一调度器里采集日志，而不是每个 case 自己直接打散日志。
    private function BuildTraceByInterface(ITraceable traceable) -> string {
        return traceable.BuildTrace();
    }

    // 从 IResultPolicy 视角做成功判定。
    // 这个路径用于验证第三个接口在统一调度链中的派发结果。
    private function EvaluateByPolicy(IResultPolicy policy, const integer actualValue, const integer expectedValue) -> boolean {
        return policy.IsSuccess(actualValue, expectedValue);
    }

    // 从 IResultPolicy 视角生成摘要。
    // 这样日志摘要也受接口派发控制，更容易看出 implements 是否完整接通。
    private function BuildPolicySummary(IResultPolicy policy, const string caseName, const integer actualValue, const integer expectedValue) -> string {
        return policy.BuildSummary(caseName, actualValue, expectedValue);
    }

    // 从 IResultPolicy 视角读取权重。
    // 不同 policy 权重都会参与日志，便于观察 IResultPolicy 视角是否命中了正确实现。
    private function ReadPolicyWeight(IResultPolicy policy) -> integer {
        return policy.GetPolicyWeight();
    }

    // 从父类视角读取 stub 字符串。
    // 这条函数专门用于 stub 回退阶段，确保调用站在父类类型上而不是具体子类上。
    private function ReadStubLabelFromBase(StubCaseBase baseCase) -> string {
        return baseCase.GetStubLabel();
    }

    // 从父类视角读取 stub 数值。
    // 如果这里拿到的值不对，基本就能直接指向 stub 覆写或动态派发实现有问题。
    private function ReadStubBonusFromBase(StubCaseBase baseCase) -> integer {
        return baseCase.GetStubBonus();
    }

    // 通过三个接口共同构造一个组合值。
    // HybridImplementsCase 会走这条路径，用来验证同一个对象在多个接口视角下协同工作是否正常。
    private function BuildInterfaceEnvelope(ITestCase testCase, ITraceable traceable, IResultPolicy policy) -> integer {
        return ReadCaseScore(testCase) + ReadTraceLevel(traceable) + ReadPolicyWeight(policy);
    }

    // 纯 module 工作者。
    // 这个 struct 不参与统一 case 调度，只负责在模块专项测试里制造“同一 module 的不同实例”。
    struct ModuleWorker {
        implement CounterModule;
        implement NamingModule;

        // 创建一个只混入 module 的轻量实例。
        // 之所以单独保留这个 struct，是为了把“module 共享代码”和“case 业务逻辑”分离开来。
        static method Create(const string prefix, const integer seed) -> ModuleWorker {
            ModuleWorker worker = ModuleWorker.allocate();
            worker.ResetCounter();
            worker.ConfigureName(prefix, seed);
            return worker;
        }

        // 回收 worker。
        // 虽然这里只在初始化时跑一次，但仍然显式释放，避免后续扩充回归时养成资源泄漏习惯。
        method Destroy() {
            ModuleWorker.deallocate(this);
        }
    }

    // 默认 stub 用例。
    // 这个 struct 故意不覆写 stub 方法，并使用最基础的接口实现，
    // 用来验证“默认行为链路”是否完全可用。
    struct DefaultStubCase extends StubCaseBase implements ITestCase, ITraceable, IResultPolicy {
        implement CounterModule;
        implement NamingModule;

        integer lastActualValue;
        integer lastCounterValue;
        integer lastNameLength;
        string lastModuleName;
        string lastStubLabel;

        // 创建默认 stub 用例。
        // 初始化时就写入固定输入，确保后续日志里的 expected/actual 可以稳定复现。
        static method Create() -> DefaultStubCase {
            DefaultStubCase caseData = DefaultStubCase.allocate();
            caseData.SetupStubBase(10, "DefaultStubCase");
            caseData.ResetCounter();
            caseData.ConfigureName("default", 3);
            caseData.lastActualValue = 0;
            caseData.lastCounterValue = 0;
            caseData.lastNameLength = 0;
            caseData.lastModuleName = "";
            caseData.lastStubLabel = "";
            return caseData;
        }

        // 回收默认 stub 用例实例。
        method Destroy() {
            DefaultStubCase.deallocate(this);
        }

        // 返回稳定名称，供调度器和日志汇总使用。
        public method GetName() -> string {
            return "DefaultStubCase";
        }

        // 返回这个 case 所属阶段。
        // 调度器会把外部 phaseName 和这里的返回值同时打印，便于定位接口派发是否串线。
        public method GetPhaseName() -> string {
            return "接口分发";
        }

        // 返回 trace 级别。
        // 这里显式返回固定值，让接口回归能观察普通接口方法的整数派发是否稳定。
        public method GetTraceLevel() -> integer {
            return 11;
        }

        // 返回预期值。
        // 42 的构成来自 module 状态、stub 默认值、接口返回值和模块字符串长度。
        public method GetExpectedValue() -> integer {
            return 42;
        }

        // 返回通过时应计入的分数。
        public method GetScore() -> integer {
            return 10;
        }

        // 返回 policy 权重。
        // 这个值会通过 IResultPolicy 视角读取，继续覆盖 implements 路径。
        public method GetPolicyWeight() -> integer {
            return 5;
        }

        // 执行默认 stub 场景。
        // 这个公式同时覆盖：
        // 1. CounterModule 的字段读写
        // 2. NamingModule 的字符串构造
        // 3. 父类 stub 默认实现
        // 4. ITraceable / IResultPolicy 的普通接口派发
        public method RunCase() -> integer {
            integer actualValue = 0;

            this.ResetCounter();
            this.ConfigureName("default", 3);
            this.lastModuleName = this.BuildModuleName();
            this.lastNameLength = StringLength(this.lastModuleName);
            this.lastCounterValue = this.TouchCounter(2);
            this.lastCounterValue = this.TouchCounter(4);
            this.lastStubLabel = ReadStubLabelFromBase(this);

            actualValue = this.lastCounterValue + ReadStubBonusFromBase(this) + this.GetTraceLevel() + this.GetPolicyWeight() + this.lastNameLength;
            this.lastActualValue = actualValue;
            return actualValue;
        }

        // 生成 trace。
        // trace 里故意带上 stub 标签、module 名称和计数值，方便你从日志里肉眼判断哪一段出了问题。
        public method BuildTrace() -> string {
            return "phase=" + this.GetPhaseName() + ", stubLabel=" + this.lastStubLabel + ", moduleName=" + this.lastModuleName + ", counter=" + I2S(this.lastCounterValue) + ", nameLength=" + I2S(this.lastNameLength);
        }

        // 数值判定策略。
        // 这里保持最严格的相等判断，这样一旦编译器分发出错，日志就会直接红线暴露。
        public method IsSuccess(integer actualValue, integer expectedValue) -> boolean {
            return actualValue == expectedValue;
        }

        // 构造统一摘要。
        // 摘要里把 traceLevel 和 policyWeight 也带上，便于观察接口派发是否走对了。
        public method BuildSummary(string caseName, integer actualValue, integer expectedValue) -> string {
            return BuildNumberSummary(caseName, actualValue, expectedValue, this.GetTraceLevel(), this.GetPolicyWeight());
        }
    }

    // 覆写 stub 用例。
    // 这个 struct 会覆写父类 stub，也会返回一组不同于默认用例的接口值，
    // 用来验证“同一对象上的多种覆写”是否都能命中正确实现。
    struct OverrideStubCase extends StubCaseBase implements ITestCase, ITraceable, IResultPolicy {
        implement CounterModule;
        implement NamingModule;
        implement PhaseModule;

        integer lastActualValue;
        integer lastCounterValue;
        integer lastPhaseToken;
        integer lastNameLength;
        string lastModuleName;
        string lastStubLabel;

        // 创建覆写 stub 用例。
        // 初始化里同时准备 module 和 stub 的基础输入，方便后续验证多模块叠加后的状态。
        static method Create() -> OverrideStubCase {
            OverrideStubCase caseData = OverrideStubCase.allocate();
            caseData.SetupStubBase(20, "OverrideStubCase");
            caseData.ResetCounter();
            caseData.ResetPhaseToken();
            caseData.ConfigureName("override", 7);
            caseData.lastActualValue = 0;
            caseData.lastCounterValue = 0;
            caseData.lastPhaseToken = 0;
            caseData.lastNameLength = 0;
            caseData.lastModuleName = "";
            caseData.lastStubLabel = "";
            return caseData;
        }

        // 回收覆写 stub 用例实例。
        method Destroy() {
            OverrideStubCase.deallocate(this);
        }

        // 覆写 stub 字符串。
        // stub 回退阶段会通过父类视角读取它，用来验证动态派发是否命中子类实现。
        public method GetStubLabel() -> string {
            return this.baseLabel + ":STUB-OVERRIDE";
        }

        // 覆写 stub 数值。
        // 这个值直接参与最终断言，能够把“编译通过但派发错误”的问题也暴露出来。
        public method GetStubBonus() -> integer {
            return this.baseSeed + 5;
        }

        // 返回更高的 trace 级别，便于和默认用例拉开差异。
        public method GetTraceLevel() -> integer {
            return 21;
        }

        // 返回不同的 policy 权重，便于验证 IResultPolicy 的独立派发。
        public method GetPolicyWeight() -> integer {
            return 9;
        }

        // 返回稳定名称，供调度器和摘要使用。
        public method GetName() -> string {
            return "OverrideStubCase";
        }

        // 返回所属阶段。
        public method GetPhaseName() -> string {
            return "接口分发";
        }

        // 返回预期值。
        // 84 由覆写 stub 数值、接口返回值、PhaseModule 结果、CounterModule 状态和名称长度组成。
        public method GetExpectedValue() -> integer {
            return 84;
        }

        // 返回通过时应计入的分数。
        public method GetScore() -> integer {
            return 12;
        }

        // 执行覆写 stub 场景。
        // 这个 case 重点验证：同一个对象在多 module、多接口和 stub 覆写同时存在时，
        // 公式结果是否仍然稳定可预测。
        public method RunCase() -> integer {
            integer actualValue = 0;

            this.ResetCounter();
            this.ResetPhaseToken();
            this.ConfigureName("override", 7);
            this.lastModuleName = this.BuildModuleName();
            this.lastNameLength = StringLength(this.lastModuleName);
            this.lastCounterValue = this.TouchCounter(5);
            this.SetPhaseToken(8);
            this.lastPhaseToken = this.MixPhase(6);
            this.lastStubLabel = ReadStubLabelFromBase(this);

            actualValue = ReadStubBonusFromBase(this) + this.GetTraceLevel() + this.GetPolicyWeight() + this.lastPhaseToken + this.lastCounterValue + this.lastNameLength;
            this.lastActualValue = actualValue;
            return actualValue;
        }

        // 生成覆写 stub 场景的 trace。
        public method BuildTrace() -> string {
            return "phase=" + this.GetPhaseName() + ", stubLabel=" + this.lastStubLabel + ", moduleName=" + this.lastModuleName + ", counter=" + I2S(this.lastCounterValue) + ", phaseToken=" + I2S(this.lastPhaseToken) + ", nameLength=" + I2S(this.lastNameLength);
        }

        // 数值判定策略。
        public method IsSuccess(integer actualValue, integer expectedValue) -> boolean {
            return actualValue == expectedValue;
        }

        // 构造统一摘要。
        public method BuildSummary(string caseName, integer actualValue, integer expectedValue) -> string {
            return BuildNumberSummary(caseName, actualValue, expectedValue, this.GetTraceLevel(), this.GetPolicyWeight());
        }
    }

    // 模块隔离用例。
    // 这个 struct 的主目标不是测试 stub，而是测试多个 module 实例之间是否互不串扰。
    struct ModuleIsolationCase extends StubCaseBase implements ITestCase, ITraceable, IResultPolicy {
        implement CounterModule;
        implement PhaseModule;

        integer lastActualValue;
        integer leftCounterValue;
        integer rightCounterValue;
        integer selfCounterValue;
        integer lastPhaseToken;
        string leftModuleName;
        string rightModuleName;
        string lastStubLabel;

        // 创建模块隔离用例。
        // 这里保留 stub 基类，是为了让 trace 里也能看到继承链是否稳定，并且方便统一结构。
        static method Create() -> ModuleIsolationCase {
            ModuleIsolationCase caseData = ModuleIsolationCase.allocate();
            caseData.SetupStubBase(60, "ModuleIsolationCase");
            caseData.ResetCounter();
            caseData.ResetPhaseToken();
            caseData.lastActualValue = 0;
            caseData.leftCounterValue = 0;
            caseData.rightCounterValue = 0;
            caseData.selfCounterValue = 0;
            caseData.lastPhaseToken = 0;
            caseData.leftModuleName = "";
            caseData.rightModuleName = "";
            caseData.lastStubLabel = "";
            return caseData;
        }

        // 回收模块隔离用例实例。
        method Destroy() {
            ModuleIsolationCase.deallocate(this);
        }

        // 返回稳定名称。
        public method GetName() -> string {
            return "ModuleIsolationCase";
        }

        // 返回所属阶段。
        public method GetPhaseName() -> string {
            return "模块混入";
        }

        // 返回 trace 级别。
        // 这里保持和默认 stub 用例一致，方便对比接口方法本身是否稳定，而不是比较常量不同。
        public method GetTraceLevel() -> integer {
            return 11;
        }

        // 返回预期值。
        // 616 = 左实例 5 * 100 + 右实例 4 * 10 + 本体 8 + 名字长度 6 + 7 + 阶段 token 55。
        public method GetExpectedValue() -> integer {
            return 616;
        }

        // 返回通过时应计入的分数。
        public method GetScore() -> integer {
            return 18;
        }

        // 返回 policy 权重。
        public method GetPolicyWeight() -> integer {
            return 5;
        }

        // 执行模块隔离场景。
        // 这里显式创建两个只混入 module 的 worker，再与当前 case 本体一起比较，
        // 用来观察同一个 module 被多个对象使用时，状态是否发生串写。
        public method RunCase() -> integer {
            ModuleWorker leftWorker = ModuleWorker.Create("left", 1);
            ModuleWorker rightWorker = ModuleWorker.Create("right", 2);
            integer actualValue = 0;

            this.ResetCounter();
            this.ResetPhaseToken();
            this.selfCounterValue = this.TouchCounter(8);
            this.SetPhaseToken(50);

            this.leftCounterValue = leftWorker.TouchCounter(3);
            this.leftCounterValue = leftWorker.TouchCounter(2);
            this.rightCounterValue = rightWorker.TouchCounter(4);
            this.leftModuleName = leftWorker.BuildModuleName();
            this.rightModuleName = rightWorker.BuildModuleName();
            this.lastPhaseToken = this.MixPhase(5);
            this.lastStubLabel = ReadStubLabelFromBase(this);

            actualValue = this.leftCounterValue * 100 + this.rightCounterValue * 10 + this.selfCounterValue + StringLength(this.leftModuleName) + StringLength(this.rightModuleName) + this.lastPhaseToken;
            this.lastActualValue = actualValue;

            leftWorker.Destroy();
            rightWorker.Destroy();
            return actualValue;
        }

        // 生成模块隔离 trace。
        // 日志里同时打印三个计数源，方便直接观察是否存在 module 状态串扰。
        public method BuildTrace() -> string {
            return "phase=" + this.GetPhaseName() + ", stubLabel=" + this.lastStubLabel + ", leftCounter=" + I2S(this.leftCounterValue) + ", rightCounter=" + I2S(this.rightCounterValue) + ", selfCounter=" + I2S(this.selfCounterValue) + ", leftName=" + this.leftModuleName + ", rightName=" + this.rightModuleName + ", phaseToken=" + I2S(this.lastPhaseToken);
        }

        // 数值判定策略。
        public method IsSuccess(integer actualValue, integer expectedValue) -> boolean {
            return actualValue == expectedValue;
        }

        // 构造统一摘要。
        public method BuildSummary(string caseName, integer actualValue, integer expectedValue) -> string {
            return BuildNumberSummary(caseName, actualValue, expectedValue, this.GetTraceLevel(), this.GetPolicyWeight());
        }
    }

    // implements 组合用例。
    // 这个 struct 同时实现三组接口、三组 module，并覆写 stub，
    // 是整个回归中心里“组合复杂度”最高的对象。
    struct HybridImplementsCase extends StubCaseBase implements ITestCase, ITraceable, IResultPolicy {
        implement CounterModule;
        implement NamingModule;
        implement PhaseModule;

        integer lastActualValue;
        integer lastCounterValue;
        integer lastPhaseToken;
        integer lastInterfaceEnvelope;
        string lastModuleName;
        string lastStubLabel;

        // 创建 implements 组合用例。
        static method Create() -> HybridImplementsCase {
            HybridImplementsCase caseData = HybridImplementsCase.allocate();
            caseData.SetupStubBase(30, "HybridImplementsCase");
            caseData.ResetCounter();
            caseData.ResetPhaseToken();
            caseData.ConfigureName("hybrid", 9);
            caseData.lastActualValue = 0;
            caseData.lastCounterValue = 0;
            caseData.lastPhaseToken = 0;
            caseData.lastInterfaceEnvelope = 0;
            caseData.lastModuleName = "";
            caseData.lastStubLabel = "";
            return caseData;
        }

        // 回收 implements 组合用例实例。
        method Destroy() {
            HybridImplementsCase.deallocate(this);
        }

        // 覆写 stub 字符串。
        public method GetStubLabel() -> string {
            return this.baseLabel + ":HYBRID-STUB";
        }

        // 覆写 stub 数值。
        public method GetStubBonus() -> integer {
            return this.baseSeed + 7;
        }

        // 返回不同于其它 case 的 trace 级别。
        public method GetTraceLevel() -> integer {
            return 17;
        }

        // 返回不同于其它 case 的 policy 权重。
        public method GetPolicyWeight() -> integer {
            return 13;
        }

        // 返回稳定名称。
        public method GetName() -> string {
            return "HybridImplementsCase";
        }

        // 返回所属阶段。
        public method GetPhaseName() -> string {
            return "implements组合";
        }

        // 返回预期值。
        // 144 = Counter 7 + Phase 42 + stub 37 + 名称长度 8 + 接口组合包 50。
        public method GetExpectedValue() -> integer {
            return 144;
        }

        // 返回通过时应计入的分数。
        public method GetScore() -> integer {
            return 20;
        }

        // 执行 implements 组合场景。
        // 这个 case 会调用 BuildInterfaceEnvelope(this, this, this)，
        // 强制编译器把同一个对象同时当成三个不同接口来分发。
        public method RunCase() -> integer {
            integer actualValue = 0;

            this.ResetCounter();
            this.ResetPhaseToken();
            this.ConfigureName("hybrid", 9);
            this.lastModuleName = this.BuildModuleName();
            this.lastCounterValue = this.TouchCounter(4);
            this.lastCounterValue = this.TouchCounter(3);
            this.SetPhaseToken(40);
            this.lastPhaseToken = this.MixPhase(2);
            this.lastStubLabel = ReadStubLabelFromBase(this);
            this.lastInterfaceEnvelope = BuildInterfaceEnvelope(this, this, this);

            actualValue = this.lastCounterValue + this.lastPhaseToken + ReadStubBonusFromBase(this) + StringLength(this.lastModuleName) + this.lastInterfaceEnvelope;
            this.lastActualValue = actualValue;
            return actualValue;
        }

        // 生成 implements 组合 trace。
        public method BuildTrace() -> string {
            return "phase=" + this.GetPhaseName() + ", stubLabel=" + this.lastStubLabel + ", moduleName=" + this.lastModuleName + ", counter=" + I2S(this.lastCounterValue) + ", phaseToken=" + I2S(this.lastPhaseToken) + ", interfaceEnvelope=" + I2S(this.lastInterfaceEnvelope);
        }

        // 数值判定策略。
        public method IsSuccess(integer actualValue, integer expectedValue) -> boolean {
            return actualValue == expectedValue;
        }

        // 构造统一摘要。
        public method BuildSummary(string caseName, integer actualValue, integer expectedValue) -> string {
            return BuildNumberSummary(caseName, actualValue, expectedValue, this.GetTraceLevel(), this.GetPolicyWeight());
        }
    }

    // 回归中心。
    // 这个 struct 负责统一执行所有 case、打印结构化日志、累计分数，
    // 让整个测试在一份文件里就能自举完成。
    struct RegressionCenter {
        integer phaseIndex;
        integer recordedCaseCount;
        integer passedCaseCount;
        integer failedCaseCount;
        integer earnedScore;

        // 创建回归中心。
        // 所有统计字段都在这里显式归零，避免后续扩展阶段时出现脏状态。
        static method Create() -> RegressionCenter {
            RegressionCenter center = RegressionCenter.allocate();
            center.phaseIndex = 0;
            center.recordedCaseCount = 0;
            center.passedCaseCount = 0;
            center.failedCaseCount = 0;
            center.earnedScore = 0;
            return center;
        }

        // 回收回归中心实例。
        method Destroy() {
            RegressionCenter.deallocate(this);
        }

        // 开启一个阶段。
        // 这里会打印当前阶段序号，帮助你在日志文件里快速定位四大块测试。
        method BeginPhase(const string phaseName) {
            this.phaseIndex = this.phaseIndex + 1;
            BJDebugMsg(INTERFACE_TEST_CASE_PREFIX + "phaseStart=" + I2S(this.phaseIndex) + "/" + I2S(INTERFACE_TEST_PHASE_COUNT) + ", phase=" + phaseName + ", recordedCases=" + I2S(this.recordedCaseCount));
        }

        // 记录一个数值型检查结果。
        // 所有接口型 case 和 stub 数值专项最终都会汇总到这里，统一打印 pass/fail 结构。
        method RecordIntegerCheck(const string phaseName, const string caseName, const integer actualValue, const integer expectedValue, const integer score, const string trace, const string summary, const integer traceLevel, const integer policyWeight, const boolean passed) -> boolean {
            this.recordedCaseCount = this.recordedCaseCount + 1;
            BJDebugMsg(INTERFACE_TEST_CASE_PREFIX + "phase=" + phaseName + ", case=" + caseName + ", traceLevel=" + I2S(traceLevel) + ", policyWeight=" + I2S(policyWeight) + ", score=" + I2S(score));
            BJDebugMsg(INTERFACE_TEST_CASE_PREFIX + "trace=" + trace);

            if (passed) {
                this.passedCaseCount = this.passedCaseCount + 1;
                this.earnedScore = this.earnedScore + score;
                BJDebugMsg(INTERFACE_TEST_PASS_PREFIX + summary + ", awardedScore=" + I2S(score));
            } else {
                this.failedCaseCount = this.failedCaseCount + 1;
                BJDebugMsg(INTERFACE_TEST_FAIL_PREFIX + summary + ", awardedScore=0");
            }
            return passed;
        }

        // 记录一个字符串型检查结果。
        // stub 字符串覆写回退专门走这里，方便把“值错误”和“派发错误”区分开。
        method RecordStringCheck(const string phaseName, const string caseName, const string actualValue, const string expectedValue, const integer score, const string trace) -> boolean {
            boolean passed = actualValue == expectedValue;
            string summary = BuildStringSummary(caseName, actualValue, expectedValue);

            this.recordedCaseCount = this.recordedCaseCount + 1;
            BJDebugMsg(INTERFACE_TEST_CASE_PREFIX + "phase=" + phaseName + ", case=" + caseName + ", score=" + I2S(score));
            BJDebugMsg(INTERFACE_TEST_CASE_PREFIX + "trace=" + trace);

            if (passed) {
                this.passedCaseCount = this.passedCaseCount + 1;
                this.earnedScore = this.earnedScore + score;
                BJDebugMsg(INTERFACE_TEST_PASS_PREFIX + summary + ", awardedScore=" + I2S(score));
            } else {
                this.failedCaseCount = this.failedCaseCount + 1;
                BJDebugMsg(INTERFACE_TEST_FAIL_PREFIX + summary + ", awardedScore=0");
            }
            return passed;
        }

        // 统一执行接口型 case。
        // 这条方法是整个“interface + implements”回归的核心入口：
        // 它会把同一个对象分别当成 ITestCase / ITraceable / IResultPolicy 来调度。
        method ExecuteCase(const string phaseName, ITestCase testCase, ITraceable traceable, IResultPolicy policy) -> boolean {
            string caseName = ReadCaseName(testCase);
            integer actualValue = RunCaseByInterface(testCase);
            integer expectedValue = ReadExpectedValue(testCase);
            integer score = ReadCaseScore(testCase);
            integer traceLevel = ReadTraceLevel(traceable);
            integer policyWeight = ReadPolicyWeight(policy);
            string trace = "tracePhase=" + ReadTracePhase(traceable) + ", " + BuildTraceByInterface(traceable);
            string summary = BuildPolicySummary(policy, caseName, actualValue, expectedValue);
            boolean passed = EvaluateByPolicy(policy, actualValue, expectedValue);

            return this.RecordIntegerCheck(phaseName, caseName, actualValue, expectedValue, score, trace, summary, traceLevel, policyWeight, passed);
        }

        // 打印最终汇总。
        // 这里会把计划 case 数、实际 case 数、通过数、失败数和总分一次性写入日志。
        method Finish() {
            BJDebugMsg(INTERFACE_TEST_SUMMARY_PREFIX + "plannedCases=" + I2S(INTERFACE_TEST_PLANNED_CASE_COUNT) + ", recordedCases=" + I2S(this.recordedCaseCount) + ", plannedMaxScore=" + I2S(INTERFACE_TEST_PLANNED_MAX_SCORE) + ", earnedScore=" + I2S(this.earnedScore) + ", passed=" + I2S(this.passedCaseCount) + ", failed=" + I2S(this.failedCaseCount) + ", finishedPhases=" + I2S(this.phaseIndex) + "/" + I2S(INTERFACE_TEST_PHASE_COUNT));
        }
    }

    // 运行接口分发阶段。
    // 这一阶段重点验证：同一个具体对象在三个接口视角下是否都能正确调用到自己的实现。
    private function RunInterfaceDispatchPhase(RegressionCenter center) {
        DefaultStubCase defaultCase = DefaultStubCase.create();
        OverrideStubCase overrideCase = OverrideStubCase.create();
        boolean phasePassed = true;

        defaultCase.baseSeed = 10;
        defaultCase.baseLabel = "DefaultStubCase";
        defaultCase.counterValue = 0;
        defaultCase.namePrefix = "default";
        defaultCase.nameSeed = 3;
        defaultCase.lastActualValue = 0;
        defaultCase.lastCounterValue = 0;
        defaultCase.lastNameLength = 0;
        defaultCase.lastModuleName = "";
        defaultCase.lastStubLabel = "";

        overrideCase.baseSeed = 20;
        overrideCase.baseLabel = "OverrideStubCase";
        overrideCase.counterValue = 0;
        overrideCase.phaseToken = 0;
        overrideCase.namePrefix = "override";
        overrideCase.nameSeed = 7;
        overrideCase.lastActualValue = 0;
        overrideCase.lastCounterValue = 0;
        overrideCase.lastPhaseToken = 0;
        overrideCase.lastNameLength = 0;
        overrideCase.lastModuleName = "";
        overrideCase.lastStubLabel = "";

        center.BeginPhase("接口分发");
        phasePassed = center.ExecuteCase("接口分发", defaultCase, defaultCase, defaultCase) && phasePassed;
        phasePassed = center.ExecuteCase("接口分发", overrideCase, overrideCase, overrideCase) && phasePassed;
        BJDebugMsg(INTERFACE_TEST_CASE_PREFIX + "phaseDone=接口分发, passed=" + (phasePassed ? "true" : "false"));

        defaultCase.Destroy();
        overrideCase.Destroy();
    }

    // 运行 module 混入阶段。
    // 这一阶段重点验证：module 字段注入、方法注入，以及多个实例是否互不串扰。
    private function RunModulePhase(RegressionCenter center) {
        ModuleIsolationCase moduleCase = ModuleIsolationCase.create();
        boolean phasePassed = true;

        moduleCase.baseSeed = 60;
        moduleCase.baseLabel = "ModuleIsolationCase";
        moduleCase.counterValue = 0;
        moduleCase.phaseToken = 0;
        moduleCase.lastActualValue = 0;
        moduleCase.leftCounterValue = 0;
        moduleCase.rightCounterValue = 0;
        moduleCase.selfCounterValue = 0;
        moduleCase.lastPhaseToken = 0;
        moduleCase.leftModuleName = "";
        moduleCase.rightModuleName = "";
        moduleCase.lastStubLabel = "";

        center.BeginPhase("模块混入");
        phasePassed = center.ExecuteCase("模块混入", moduleCase, moduleCase, moduleCase) && phasePassed;
        BJDebugMsg(INTERFACE_TEST_CASE_PREFIX + "phaseDone=模块混入, passed=" + (phasePassed ? "true" : "false"));

        moduleCase.Destroy();
    }

    // 运行 stub 回退阶段。
    // 这一阶段专门站在父类 StubCaseBase 视角读取子类方法，验证默认实现和覆写实现是否都能命中。
    private function RunStubPhase(RegressionCenter center) {
        DefaultStubCase defaultCase = DefaultStubCase.create();
        OverrideStubCase overrideCase = OverrideStubCase.create();
        integer defaultBonus = 0;
        integer overrideBonus = 0;
        boolean phasePassed = true;

        defaultCase.baseSeed = 10;
        defaultCase.baseLabel = "DefaultStubCase";
        defaultCase.counterValue = 0;
        defaultCase.namePrefix = "default";
        defaultCase.nameSeed = 3;
        defaultCase.lastActualValue = 0;
        defaultCase.lastCounterValue = 0;
        defaultCase.lastNameLength = 0;
        defaultCase.lastModuleName = "";
        defaultCase.lastStubLabel = "";

        overrideCase.baseSeed = 20;
        overrideCase.baseLabel = "OverrideStubCase";
        overrideCase.counterValue = 0;
        overrideCase.phaseToken = 0;
        overrideCase.namePrefix = "override";
        overrideCase.nameSeed = 7;
        overrideCase.lastActualValue = 0;
        overrideCase.lastCounterValue = 0;
        overrideCase.lastPhaseToken = 0;
        overrideCase.lastNameLength = 0;
        overrideCase.lastModuleName = "";
        overrideCase.lastStubLabel = "";

        defaultBonus = ReadStubBonusFromBase(defaultCase);
        overrideBonus = ReadStubBonusFromBase(overrideCase);

        center.BeginPhase("stub回退");
        phasePassed = center.RecordStringCheck("stub回退", "BaseView.DefaultStubLabel", ReadStubLabelFromBase(defaultCase), "DefaultStubCase:STUB-DEFAULT", 8, "通过父类视角读取未覆写 stub 字符串，预期命中默认实现。") && phasePassed;
        phasePassed = center.RecordStringCheck("stub回退", "BaseView.OverrideStubLabel", ReadStubLabelFromBase(overrideCase), "OverrideStubCase:STUB-OVERRIDE", 8, "通过父类视角读取已覆写 stub 字符串，预期命中子类实现。") && phasePassed;
        phasePassed = center.RecordIntegerCheck("stub回退", "BaseView.DefaultStubBonus", defaultBonus, 11, 8, "通过父类视角读取默认 stub 数值，预期为 baseSeed + 1。", BuildNumberSummary("BaseView.DefaultStubBonus", defaultBonus, 11, 0, 0), 0, 0, defaultBonus == 11) && phasePassed;
        phasePassed = center.RecordIntegerCheck("stub回退", "BaseView.OverrideStubBonus", overrideBonus, 25, 8, "通过父类视角读取覆写 stub 数值，预期为 baseSeed + 5。", BuildNumberSummary("BaseView.OverrideStubBonus", overrideBonus, 25, 0, 0), 0, 0, overrideBonus == 25) && phasePassed;
        BJDebugMsg(INTERFACE_TEST_CASE_PREFIX + "phaseDone=stub回退, passed=" + (phasePassed ? "true" : "false"));

        defaultCase.Destroy();
        overrideCase.Destroy();
    }

    // 运行 implements 组合阶段。
    // 这一阶段重点验证：同一个对象同时实现多个接口和多个 module 后，统一调度是否仍然稳定。
    private function RunImplementsPhase(RegressionCenter center) {
        HybridImplementsCase hybridCase = HybridImplementsCase.create();
        boolean phasePassed = true;

        hybridCase.baseSeed = 30;
        hybridCase.baseLabel = "HybridImplementsCase";
        hybridCase.counterValue = 0;
        hybridCase.phaseToken = 0;
        hybridCase.namePrefix = "hybrid";
        hybridCase.nameSeed = 9;
        hybridCase.lastActualValue = 0;
        hybridCase.lastCounterValue = 0;
        hybridCase.lastPhaseToken = 0;
        hybridCase.lastInterfaceEnvelope = 0;
        hybridCase.lastModuleName = "";
        hybridCase.lastStubLabel = "";

        center.BeginPhase("implements组合");
        phasePassed = center.ExecuteCase("implements组合", hybridCase, hybridCase, hybridCase) && phasePassed;
        BJDebugMsg(INTERFACE_TEST_CASE_PREFIX + "phaseDone=implements组合, passed=" + (phasePassed ? "true" : "false"));

        hybridCase.Destroy();
    }

    // 统一入口。
    // onInit 只做一件事：调用这个入口，让整套编译器特性回归在开局自动执行并输出汇总日志。
    public function RunInterfaceRegression() {
        RegressionCenter center = RegressionCenter.create();

        center.phaseIndex = 0;
        center.recordedCaseCount = 0;
        center.passedCaseCount = 0;
        center.failedCaseCount = 0;
        center.earnedScore = 0;

        BJDebugMsg(INTERFACE_TEST_CASE_PREFIX + "startup plannedPhases=" + I2S(INTERFACE_TEST_PHASE_COUNT) + ", plannedCases=" + I2S(INTERFACE_TEST_PLANNED_CASE_COUNT) + ", plannedMaxScore=" + I2S(INTERFACE_TEST_PLANNED_MAX_SCORE));
        BJDebugMsg(INTERFACE_TEST_CASE_PREFIX + "startup regressionTarget=interface/module/stub/implements");

        RunInterfaceDispatchPhase(center);
        RunModulePhase(center);
        RunStubPhase(center);
        RunImplementsPhase(center);

        center.Finish();
        center.Destroy();
    }

    // 由 JassForgeDemoMain 统一调用，避免接口专项测试在开局重复执行。

}

//! endzinc
