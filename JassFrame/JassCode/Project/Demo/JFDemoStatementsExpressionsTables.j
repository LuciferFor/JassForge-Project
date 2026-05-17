library JFDemoVjassControl
    // vJASS 控制流仍然使用 then/endif/endloop，这里给 Zinc 侧做对照。
    function JFD_VjassIfScore takes boolean ok returns integer
        if ok then
            return 7
        elseif not ok then
            return 3
        else
            return 0
        endif
    endfunction

    function JFD_VjassLoopSum takes integer max returns integer
        local integer i = 0
        local integer sum = 0

        loop
            exitwhen i >= max
            set i = i + 1
            set sum = sum + i
        endloop

        return sum
    endfunction
endlibrary

//! zinc

library JFDemoStatementsExpressionsTables requires JFDemoCommon, JFDemoVjassControl {

    // 这两个全局变量只给 _G() 反射访问使用。
    public integer JFD_GlobalScoreForG = 0;
    public integer JFD_GlobalArrayForG[] = { 4, 5 };

    // hashtable 双下标读写会根据 key 类型自动选择 StringHash 或 GetHandleId。
    public hashtable JFD_ExprTable = InitHashtable();

    private function JFD_NoopForCondition() {
    }

    // Zinc 控制流集中覆盖 nullable 条件、while、loop、for、continue 和 break。
    private function JFD_ZincControlScore() -> integer {
        integer score = 0;
        integer i = 0;
        string nullableText = "有值";
        code nullableCode = function JFD_NoopForCondition;

        if (nullableText) {
            score += 10;
        } else {
            score -= 100;
        }

        if (nullableCode) {
            score += 20;
        }

        while (i < 3) {
            i += 1;
            score += i;
        }

        loop {
            score += 2;
            exitwhen score >= 40;
        }

        for (integer n = 0; n < 5; n += 1) {
            if (n == 1) {
                continue;
            }

            if (n == 4) {
                break;
            }

            score += n;
        }

        nullableCode = null;
        return score;
    }

    // 用一个稳定分数覆盖十六进制、FourCC、取模、逻辑运算和复合赋值。
    private function JFD_LiteralAndOperatorScore() -> integer {
        integer a = 0x1F;
        integer b = 7 % 4;
        integer raw = 'A';
        boolean ok = (a == 31) && (b == 3) && raw != 0;
        integer value = 1;

        value += 2;
        value *= 3;
        value -= 1;
        value /= 2;
        value++;

        return (ok ? 100 : 0) + value + (not false ? 10 : 0);
    }

    // static_cast 适合安全转换；旧式 cast 这里用于 hashtable 读取结果。
    private function JFD_CastScore() -> integer {
        real staticReal = static_cast<real>(3);
        integer oldCast = (integer)JFD_ExprTable["转换"]["整数"];

        return R2I(staticReal) + oldCast;
    }

    // 同时覆盖 string key、handle key 和 _G() 对普通全局/数组全局的访问。
    private function JFD_TableAndGlobalReflectionScore() -> integer {
        JFD_ExprTable["玩家一"]["分数"] = 22;
        JFD_ExprTable[Player(0)]["句柄键"] = 5;
        _G("JFD_GlobalScoreForG") = 33;
        _G("JFD_GlobalArrayForG")[1] = 44;

        return (integer)JFD_ExprTable["玩家一"]["分数"] + (integer)JFD_ExprTable[Player(0)]["句柄键"] + _G("JFD_GlobalScoreForG") + _G("JFD_GlobalArrayForG")[1];
    }

    // 本主题把语句、表达式、强类型检查和表访问放在一起跑。
    public function JFD_RunStatementsExpressionsTablesDemo() {
        string rawText = R"(原始字符串：路径 C:\MapDemo\war3map.j 不需要双反斜杠，#endif 不参与预处理)";

        JFD_ExprTable["转换"]["整数"] = 9;

        JFD_BeginTheme("语句表达式与表");
        JFD_ExpectInteger("vJASS if/elseif/else语句", JFD_VjassIfScore(true), 7);
        JFD_ExpectInteger("vJASS loop/exitwhen语句", JFD_VjassLoopSum(4), 10);
        JFD_ExpectInteger("Zinc if/while/loop/for/break/continue", JFD_ZincControlScore(), 45);
        JFD_ExpectString("raw string保留反斜杠和预处理文本", rawText, "原始字符串：路径 C:\\MapDemo\\war3map.j 不需要双反斜杠，#endif 不参与预处理");
        JFD_ExpectInteger("字面量、算术、逻辑、复合赋值", JFD_LiteralAndOperatorScore(), 115);
        JFD_ExpectInteger("static_cast与传统cast", JFD_CastScore(), 12);
        JFD_ExpectInteger("hashtable双下标与_G全局反射", JFD_TableAndGlobalReflectionScore(), 104);
        JFD_RecordCompileCase("条件表达式禁止赋值", "禁用示例里保留了条件里写赋值的错误写法");
        JFD_EndTheme("语句表达式与表");
    }
}

//! endzinc
