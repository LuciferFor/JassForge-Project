//! zinc

library JFDemoTypesVariables requires JFDemoCommon {

    // 普通 type 别名覆盖用户类型声明；运行时仍按 integer 处理。
    type JFD_HeroId extends integer;

    // 全局结构体数组会在 InitGlobals 阶段逐项构造，字段默认值也要一起生效。
    struct JFD_TaskInfo {
        integer seed;
        string label = "批量构造";

        JFD_TaskInfo(integer startSeed) {
            this.seed = startSeed;
        }

        public method Score() -> integer {
            return this.seed + StringLength(this.label);
        }

        public method Self() -> thistype {
            return this;
        }
    }

    public constant integer JFD_CONST_GLOBAL_VALUE = 40;
    public integer JFD_GlobalCount = 2;
    public real JFD_GlobalReal = 3.50;
    public boolean JFD_GlobalFlag = true;
    public string JFD_GlobalText = "全局字符串";
    public string JFD_GlobalLabels[] = { "全局数组", "初始化列表", "中文内容" };
    public hashtable JFD_TypeDemoTable = InitHashtable();
    public JFD_TaskInfo JFD_GlobalTasks[2] = new JFD_TaskInfo(30)[2];

    // code 类型需要一个无参无返回的命名函数作为引用目标。
    private function JFD_CodeNoop() {
    }

    // static 局部变量会降级成隐藏全局，并且多次调用保留状态。
    private function JFD_StaticLocalCounter() -> integer {
        static integer count = 0;

        count += 1;
        return count;
    }

    // 核心类型集中放在一个函数里，便于同时验证声明、空值和 code 条件判断。
    private function JFD_CheckCoreTypes() -> boolean {
        integer i = 1;
        real r = 2.00;
        boolean b = true;
        string s = "核心";
        handle h = null;
        code cb = function JFD_CodeNoop;
        hashtable ht = JFD_TypeDemoTable;
        boolean cbOk = false;

        if (cb) {
            cbOk = true;
        }

        return i == 1 and R2I(r) == 2 and b and s == "核心" and h == null and cbOk and ht != null;
    }

    // 这里不创建真实对象，只确认语义层认识这些 Warcraft 3 handle 类型。
    private function JFD_CheckWar3HandleTypes() -> boolean {
        unit u = null;
        timer tm = null;
        trigger tr = null;
        effect fx = null;
        rect rc = null;
        item it = null;
        destructable de = null;
        player pl = Player(0);
        force fo = null;
        group gr = null;
        region rg = null;
        sound so = null;
        widget wi = null;
        image im = null;
        eventid ev = null;
        dialog dg = null;
        button bt = null;
        boolexpr be = null;
        location lo = null;
        weathereffect we = null;

        return u == null and tm == null and tr == null and fx == null and rc == null and it == null and de == null and pl != null and fo == null and gr == null and rg == null and so == null and wi == null and im == null and ev == null and dg == null and bt == null and be == null and lo == null and we == null;
    }

    // Zinc 局部变量可以块内声明，也可以一次声明多个变量和数组初始化列表。
    private function JFD_LocalVariableScore() -> integer {
        const integer fixedValue = 4;
        integer a = 1, b = 2, c;
        string values[] = { "局部", "数组", "初始化" };
        string emptyValues[] = {};

        c = a + b + fixedValue + StringLength(values[0]) + StringLength(values[1]);
        return c;
    }

    // 本主题集中检查基础类型、全局/局部变量、static局部变量和批量构造。
    public function JFD_RunTypesVariablesDemo() {
        JFD_TaskInfo task = JFD_GlobalTasks[0];

        JFD_BeginTheme("类型与变量");
        JFD_ExpectBoolean("核心内建类型可声明和比较", JFD_CheckCoreTypes(), true);
        JFD_ExpectBoolean("Warcraft 3常用handle类型可声明", JFD_CheckWar3HandleTypes(), true);
        JFD_ExpectInteger("constant全局变量必须初始化", JFD_CONST_GLOBAL_VALUE, 40);
        JFD_ExpectString("Zinc全局数组初始化列表", JFD_GlobalLabels[0] + "/" + JFD_GlobalLabels[1], "全局数组/初始化列表");
        JFD_ExpectInteger("Zinc局部多变量与数组初始化", JFD_LocalVariableScore(), 11);
        JFD_ExpectInteger("static局部变量第一次调用", JFD_StaticLocalCounter(), 1);
        JFD_ExpectInteger("static局部变量第二次调用保留状态", JFD_StaticLocalCounter(), 2);
        JFD_ExpectInteger("全局结构体数组批量构造", task.Score(), 34);
        JFD_ExpectInteger("thistype方法返回当前实例", task.Self(), task);
        JFD_RecordCompileCase("普通type类型别名", "JFD_HeroId作为integer别名参与编译");
        JFD_RecordCompileCase("hashtable单变量声明", "hashtable保持单个全局变量，不写数组形式");
        JFD_EndTheme("类型与变量");
    }
}

//! endzinc
