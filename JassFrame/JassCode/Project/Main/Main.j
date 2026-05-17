//! zinc

//@ priority 100 1
library JassForgeDemoMain requires JFDemoCommon, JFDemoVjassBridge, JFDemoZTopLevelVisibility, JFDemoTypesVariables, JFDemoFunctionsCallbacks, JFDemoStructLifecycle, JFDemoEnumGenericContainers, JFDemoStatementsExpressionsTables, JFDemoPreprocessorAnnotations, InterfaceTest {

    // 总入口只负责调度，具体测试按语言特性拆到 Project/Demo 下。
    private function JFD_RunDemoEntry(string entryName, string title) {
        BJDebugMsg("[调度] 开始运行：" + title);
        ExecuteFunc(entryName);
    }

    function onInit() {
        ExecuteFunc("JFD_ResetDemoSummary");

        JFD_RunDemoEntry("JFD_RunTopLevelVisibilityDemo", "基础顶层与可见性");
        JFD_RunDemoEntry("JFD_RunTypesVariablesDemo", "类型与变量");
        JFD_RunDemoEntry("JFD_RunFunctionsCallbacksDemo", "函数与回调");
        JFD_RunDemoEntry("JFD_RunStructLifecycleDemo", "结构体生命周期");
        JFD_RunDemoEntry("JFD_RunEnumGenericContainersDemo", "枚举泛型与容器");
        JFD_RunDemoEntry("JFD_RunStatementsExpressionsTablesDemo", "语句表达式与表");
        JFD_RunDemoEntry("JFD_RunPreprocessorAnnotationsDemo", "预处理与注解");

        BJDebugMsg("[调度] 开始运行：interface/module/stub/implements专项");
        ExecuteFunc("RunInterfaceRegression");

        ExecuteFunc("JFD_PrintFinalSummary");
    }
}

//! endzinc
