//! zinc

library JFDemoCommon {

    private {
        // 全局统计用于最后的总汇总；主题统计会在每个模块开始时清零。
        integer JFD_TotalCases = 0;
        integer JFD_TotalPassed = 0;
        integer JFD_TotalFailed = 0;
        integer JFD_ThemeCases = 0;
        integer JFD_ThemePassed = 0;
        integer JFD_ThemeFailed = 0;
        string JFD_CurrentTheme = "";
    }

    // JASS 没有直接把 boolean 拼进字符串的语法，日志统一走这个小工具。
    public function JFD_BoolText(boolean value) -> string {
        return value ? "true" : "false";
    }

    // 地图开局时先清空上一轮残留，方便多次测试时直接看本轮结果。
    public function JFD_ResetDemoSummary() {
        JFD_TotalCases = 0;
        JFD_TotalPassed = 0;
        JFD_TotalFailed = 0;
        JFD_ThemeCases = 0;
        JFD_ThemePassed = 0;
        JFD_ThemeFailed = 0;
        JFD_CurrentTheme = "";
        BJDebugMsg("===== JassForge 全特性中文示例测试开始 =====");
    }

    // 每个主题模块只关心自己的用例，公共库负责主题标题和计数归零。
    public function JFD_BeginTheme(string themeName) {
        JFD_CurrentTheme = themeName;
        JFD_ThemeCases = 0;
        JFD_ThemePassed = 0;
        JFD_ThemeFailed = 0;
        BJDebugMsg("[主题开始] " + themeName);
    }

    // 所有断言最终落到这里，保证日志格式一致，跑图时也便于筛选失败项。
    private function JFD_RecordResult(string caseName, string actualText, string expectedText, boolean passed, string kindText) -> boolean {
        JFD_TotalCases += 1;
        JFD_ThemeCases += 1;

        if (passed) {
            JFD_TotalPassed += 1;
            JFD_ThemePassed += 1;
            BJDebugMsg("[通过][" + JFD_CurrentTheme + "][" + kindText + "] " + caseName + "，预期=" + expectedText + "，实际=" + actualText);
        } else {
            JFD_TotalFailed += 1;
            JFD_ThemeFailed += 1;
            BJDebugMsg("[失败][" + JFD_CurrentTheme + "][" + kindText + "] " + caseName + "，预期=" + expectedText + "，实际=" + actualText);
        }

        return passed;
    }

    // 常用的整数断言，适合检查计数、容器长度和枚举底层值。
    public function JFD_ExpectInteger(string caseName, integer actualValue, integer expectedValue) -> boolean {
        return JFD_RecordResult(caseName, I2S(actualValue), I2S(expectedValue), actualValue == expectedValue, "整数");
    }

    // 字符串断言主要用于 raw string、枚举字符串值和反射字段。
    public function JFD_ExpectString(string caseName, string actualValue, string expectedValue) -> boolean {
        return JFD_RecordResult(caseName, actualValue, expectedValue, actualValue == expectedValue, "字符串");
    }

    // 布尔断言让日志里直接显示 true/false，不用读者再推断 0/1。
    public function JFD_ExpectBoolean(string caseName, boolean actualValue, boolean expectedValue) -> boolean {
        return JFD_RecordResult(caseName, JFD_BoolText(actualValue), JFD_BoolText(expectedValue), actualValue == expectedValue, "布尔");
    }

    // 实数输出统一放大一百倍，避开浮点文本格式在不同环境里的小差异。
    public function JFD_ExpectReal100(string caseName, real actualValue, real expectedValue) -> boolean {
        integer actualScaled = R2I(actualValue * 100.0 + 0.5);
        integer expectedScaled = R2I(expectedValue * 100.0 + 0.5);

        return JFD_RecordResult(caseName, I2S(actualScaled), I2S(expectedScaled), actualScaled == expectedScaled, "实数x100");
    }

    // 有些语法只要能稳定参与编译就算覆盖，运行时不额外制造副作用。
    public function JFD_RecordCompileCase(string caseName, string noteText) -> boolean {
        return JFD_RecordResult(caseName, noteText, "编译通过", true, "编译型");
    }

    // 主题结束时只打印当前主题的结果，总结果留给主入口统一打印。
    public function JFD_EndTheme(string themeName) {
        BJDebugMsg("[汇总][" + themeName + "] 用例=" + I2S(JFD_ThemeCases) + "，通过=" + I2S(JFD_ThemePassed) + "，失败=" + I2S(JFD_ThemeFailed));
    }

    // 全部主题和接口专项都跑完以后输出一行总账。
    public function JFD_PrintFinalSummary() {
        BJDebugMsg("[总汇总] 用例=" + I2S(JFD_TotalCases) + "，通过=" + I2S(JFD_TotalPassed) + "，失败=" + I2S(JFD_TotalFailed));
        BJDebugMsg("===== JassForge 全特性中文示例测试结束 =====");
    }
}

//! endzinc
