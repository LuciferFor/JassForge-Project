//! zinc

library JassForgeFeatureDemo {

    // -----------------------------------------------------------------
    // Demo 1：强类型枚举
    // 使用枚举时必须写 DemoMode.Boss 这种限定名，不能裸写 Boss。
    // -----------------------------------------------------------------
    enum DemoMode: integer {
        Idle = 0,
        Farming = 1,
        Boss = 2
    }

    // -----------------------------------------------------------------
    // Demo 2：函数指针类型
    // JassForge 可以声明带签名的函数指针，比传统 code 更强类型。
    // -----------------------------------------------------------------
    type ScoreFormatter extends function(string, integer) -> string;
    type IntTransform extends function(integer) -> integer;

    // -----------------------------------------------------------------
    // Demo 3：全局变量、数组初始化、hashtable
    // Zinc 全局数组可以直接写初始化列表。
    // -----------------------------------------------------------------
    integer DemoGlobalScore = 0;
    string DemoLabels[] = { "默认参数", "引用参数", "结构体反射" };
    hashtable DemoTable = InitHashtable();

    // -----------------------------------------------------------------
    // Demo 4：泛型结构体
    // 编译时会单态化，例如 Box<integer> 会生成一个具体实例类型。
    // -----------------------------------------------------------------
    struct Box<T> {
        T value;

        public method assign(T v) {
            this.value = v;
        }

        public method get() -> T {
            return this.value;
        }
    }

    // -----------------------------------------------------------------
    // Demo 5：构造、析构、默认字段、readonly、反射
    // new/delete/let 都会触发生命周期逻辑。
    // -----------------------------------------------------------------
    struct DemoStats {
        integer hp = 100;
        real speed = 1.00;
        string name = "未命名";
        readonly integer rawId = 'Hpal';
        DemoMode mode = DemoMode.Idle;

        DemoStats(string heroName, integer startHp) {
            this.name = heroName;
            this.hp = startHp;
        }

        ~DemoStats() {
            BJDebugMsg("[delete/let] 析构：" + this.name);
        }

        public method describe(string prefix = "角色") -> string {
            return prefix + " " + this.name + " hp=" + I2S(this.hp);
        }

        public static method fieldInfo() -> string {
            return "字段数=" + I2S(DemoStats.size()) + "，第2个字段类型=" + DemoStats.type(1);
        }
    }

    // -----------------------------------------------------------------
    // Demo 6：interpreter 分组
    // 生成 war3map.j 时会输出 interpreter-start / interpreter-end 注释。
    // -----------------------------------------------------------------
    interpreter "脚手架Demo/解释块" {
        function InterpreterHello() {
            BJDebugMsg("[interpreter] 通过解释块路径调用函数");
        }
    }

    function AddScore(integer base, integer bonus = 10) -> integer {
        return base + bonus;
    }

    function BumpScore(integer &score, integer delta) {
        score += delta;
    }

    function FormatScore(string label, integer score) -> string {
        return label + "=" + I2S(score);
    }

    function CountOnCall() -> integer {
        static integer count = 0;
        count += 1;
        return count;
    }

    function BoolText(boolean value) -> string {
        return value ? "true" : "false";
    }

    function DemoEnum(DemoMode mode) {
        if (mode == DemoMode.Boss) {
            BJDebugMsg("[enum] 当前模式：Boss");
        } else {
            BJDebugMsg("[enum] 当前模式不是 Boss");
        }
    }

    function DemoDefaultAndRef() {
        integer score = AddScore(5);

        BumpScore(score, 3);
        DemoGlobalScore = score;

        BJDebugMsg("[默认参数/&引用参数] " + I2S(score));
    }

    function DemoStaticLocal() {
        BJDebugMsg("[static局部变量] 第1次=" + I2S(CountOnCall()));
        BJDebugMsg("[static局部变量] 第2次=" + I2S(CountOnCall()));
    }

    function DemoFunctionPointerAndLambda() {
        ScoreFormatter formatter = FormatScore;
        IntTransform transform = function(integer value) -> integer {
            return value + 7;
        };

        BJDebugMsg("[函数指针/lambda] " + formatter.evaluate("积分", transform.evaluate(5)));
    }

    function DemoSysFunction() {
        sys::function<FormatScore> exactFormatter = FormatScore;

        BJDebugMsg("[sys::function<函数名>] " + exactFormatter("精确绑定", 77));
    }

    function DemoGenericStruct() {
        Box<integer> intBox = Box<integer>.create();
        Box<string> stringBox = Box<string>.create();

        intBox.assign(42);
        stringBox.assign("泛型字符串");

        BJDebugMsg("[泛型结构体] int=" + I2S(intBox.get()) + " string=" + stringBox.get());

        intBox.destroy();
        stringBox.destroy();
    }

    function DemoNewDeleteAndReflection() {
        DemoStats hero = new DemoStats("测试英雄", 250);
        integer hp = hero.at("hp");

        hero.at("hp") = hp + 50;

        BJDebugMsg("[new/delete] " + hero.describe());
        BJDebugMsg("[结构体反射] " + DemoStats.fieldInfo());
        BJDebugMsg("[结构体反射] name字段=" + hero.at("name", string));

        delete hero;
    }

    function DemoLetAutoCleanup() {
        let DemoStats temp("let临时对象", 80);

        BJDebugMsg("[let] " + temp.describe("自动清理对象"));
    }

    function DemoVectorAndRangeFor() {
        sys::vector<integer> values = sys::vector<integer>.create();

        values.push_back(3);
        values.push_back(1);
        values.push_back(2);
        sys::sort(values);

        for (integer value : values) {
            BJDebugMsg("[sys::vector/range-for] value=" + I2S(value));
        }

        values.destroy();
    }

    function DemoStack() {
        sys::stack<string> names = sys::stack<string>.create();

        names.push("第一层");
        names.push("第二层");
        names.push("栈顶");

        BJDebugMsg("[sys::stack] size=" + I2S(names.size()) + " top=" + names.top());

        names.pop();
        BJDebugMsg("[sys::stack] pop后top=" + names.top());

        names.clear();
        BJDebugMsg("[sys::stack] clear后empty=" + BoolText(names.empty()));

        names.destroy();
    }

    function DemoQueue() {
        sys::queue<integer> waves = sys::queue<integer>.create();

        waves.push(10);
        waves.push(20);
        waves.push(30);

        BJDebugMsg("[sys::queue] size=" + I2S(waves.size()) + " front=" + I2S(waves.front()) + " back=" + I2S(waves.back()));

        waves.pop();
        BJDebugMsg("[sys::queue] pop后front=" + I2S(waves.front()));

        waves.clear();
        BJDebugMsg("[sys::queue] clear后empty=" + BoolText(waves.empty()));

        waves.destroy();
    }

    function DemoMap() {
        sys::map<string, integer> scores = sys::map<string, integer>.create();

        scores.insert("战士", 100);
        scores["法师"] = 88;
        scores["猎人"] = 92;

        if (scores.contains("战士")) {
            BJDebugMsg("[sys::map] 战士=" + I2S(scores["战士"]) + " count=" + I2S(scores.count("战士")));
        }

        for (string key : scores) {
            BJDebugMsg("[sys::map/range-for] " + key + "=" + I2S(scores[key]));
        }

        BJDebugMsg("[sys::map] 第0个key=" + scores.at(0));

        scores.erase("法师");
        BJDebugMsg("[sys::map] 删除法师后size=" + I2S(scores.size()));

        scores.clear();
        BJDebugMsg("[sys::map] clear后empty=" + BoolText(scores.empty()));

        scores.destroy();
    }

    function DemoClosureCallbacks() {
        timer delay = CreateTimer();
        group units = CreateGroup();
        string timerText = "TimerStart 可以直接捕获局部变量";
        string groupText = "ForGroup 也可以直接捕获外层变量";
        integer reward = 25;

        // 不需要手动 Save 到 hashtable，也不需要 C2I/I2C 传参。
        TimerStart(delay, 0.00, false, function() {
            BJDebugMsg("[Timer闭包] " + timerText + " reward=" + I2S(reward));
            DestroyTimer(delay);
        });

        GroupEnumUnitsOfPlayer(units, Player(0), null);

        // callback 里照样能读取 groupText/reward，也能直接使用 GetEnumUnit()。
        ForGroup(units, function() {
            BJDebugMsg("[ForGroup闭包] " + groupText + " unitId=" + I2S(GetHandleId(GetEnumUnit())) + " reward=" + I2S(reward));
        });

        DestroyGroup(units);
        delay = null;
        units = null;
    }

    function DemoHashtableSugar() {
        DemoTable["player-1"]["score"] = DemoGlobalScore;

        BJDebugMsg("[hashtable双下标] score=" + I2S((integer)DemoTable["player-1"]["score"]));
    }

    function DemoArrayAndRawString() {
        string tips[] = {
            DemoLabels[0],
            DemoLabels[1],
            R"(原始字符串：路径 C:\MapDemo\war3map.j 不需要双反斜杠)"
        };

        BJDebugMsg("[数组初始化] " + tips[0] + " / " + tips[1]);
        BJDebugMsg("[raw string] " + tips[2]);
    }

    function DemoInterpreterCall() {
        interpreter.("脚手架Demo/解释块").InterpreterHello();
    }

    // 配套插件VSCode插件市场搜:JassForge
    function onInit() {
        BJDebugMsg("===== JassForge 编译器特性 Demo =====");

        DemoEnum(DemoMode.Boss);
        DemoDefaultAndRef();
        DemoStaticLocal();
        DemoFunctionPointerAndLambda();
        DemoSysFunction();
        DemoGenericStruct();
        DemoNewDeleteAndReflection();
        DemoLetAutoCleanup();
        DemoVectorAndRangeFor();
        DemoStack();
        DemoQueue();
        DemoMap();
        DemoClosureCallbacks();
        DemoHashtableSugar();
        DemoArrayAndRawString();
        DemoInterpreterCall();
    }
}

//! endzinc
