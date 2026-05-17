#define JFD_PRE_VALUE 17
#define JFD_PRE_ADD(a, b) ((a) + (b))
// 续行宏保持一个简单乘法，方便从最终分数里看出宏已经展开。
#define JFD_PRE_MULTI(a, b) \
    ((a) * (b))

// 条件编译只留下一个固定值，用来和函数宏结果相加。
#if defined(JFD_PRE_VALUE) && JFD_PRE_VALUE
#define JFD_COND_VALUE 5
#else
#define JFD_COND_VALUE -100
#endif

// 未定义标记走 ifndef 分支，覆盖 defined 的另一种常见写法。
#ifndef JFD_UNKNOWN_FLAG
#define JFD_IFNDEF_TEXT "ifndef分支生效"
#endif

//! zinc

//@ priority 20 1
library JFDemoPreprocessorAnnotations requires JFDemoCommon {

    // data-encode 适合数值全局或字段，这里只验证普通 integer 全局。
    //@ data-encode
    public integer JFD_EncodedGlobal = 6;

    // nodiscard 在当前实现里主要参与告警标记，函数本身仍可正常调用。
    //@ nodiscard
    private function JFD_NodiscardMarked() -> integer {
        return 6;
    }

    // desync 注解只做静态标记，不在这个示例里制造危险调用。
    //@ desync safe
    private function JFD_DesyncSafeMarked() {
    }

    // execstring-func 用来告诉编译器这个入口可能被字符串执行引用。
    //@ execstring-func
    public function JFD_ExecStringEntryForDemo() {
    }

    // print-log 回调需要接收编译器传入的日志字符串。
    //@ print-log
    private function JFD_PrintLogMarked(string message) {
    }

    // 宏计算结果固定为 17 + 2 * 3 + 5。
    private function JFD_PreprocessorScore() -> integer {
        return JFD_PRE_ADD(JFD_PRE_VALUE, JFD_PRE_MULTI(2, 3)) + JFD_COND_VALUE;
    }

    // raw string 内部的宏名、#endif、逗号和括号都应保持原样。
    private function JFD_RawStringPreprocessorText() -> string {
        return R"(raw string里的 #endif、JFD_PRE_VALUE、逗号,括号() 都不参与预处理)";
    }

    // sprintf 使用字面量格式串，覆盖编译器对格式符数量的正向检查。
    private function JFD_SprintfText() -> string {
        return sprintf("编号=%d 名称=%s", 7, "测试");
    }

    // 本主题只跑可安全执行的注解和预处理示例，危险或错误写法放到禁用示例里。
    public function JFD_RunPreprocessorAnnotationsDemo() {
        JFD_BeginTheme("预处理与注解");
        JFD_ExpectInteger("对象宏、函数宏、反斜杠续行宏、条件编译", JFD_PreprocessorScore(), 28);
        JFD_ExpectString("ifndef分支宏文本", JFD_IFNDEF_TEXT, "ifndef分支生效");
        JFD_ExpectString("raw string内部不被宏和条件编译干扰", JFD_RawStringPreprocessorText(), "raw string里的 #endif、JFD_PRE_VALUE、逗号,括号() 都不参与预处理");
        JFD_ExpectInteger("nodiscard注解标记函数仍可正常调用", JFD_NodiscardMarked(), 6);
        JFD_ExpectInteger("data-encode注解标记全局变量仍可正常读写", JFD_EncodedGlobal, 6);
        JFD_ExpectString("sprintf正向格式检查", JFD_SprintfText(), "编号=7 名称=测试");
        JFD_RecordCompileCase("desync safe注解", "安全同步标记挂在一个空函数上");
        JFD_RecordCompileCase("execstring-func注解", "字符串执行入口保留为public函数");
        JFD_RecordCompileCase("priority注解", "本库启动优先级由注解交给编译器排序");
        JFD_RecordCompileCase("print-log注解", "日志回调接收编译器传入的字符串");
        JFD_EndTheme("预处理与注解");
    }
}

//! endzinc

#undef JFD_PRE_VALUE
#undef JFD_PRE_ADD
#undef JFD_PRE_MULTI
#undef JFD_COND_VALUE
#undef JFD_IFNDEF_TEXT
