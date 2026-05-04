. "$PSScriptRoot\makefile.common.ps1"

# 运行测试入口：先清理旧 War3，再编译并直接启动 YDWE。
$BuildOptions = @{
    CleanWar3    = $true
    LaunchWar3   = $true
    LauncherMode  = "Direct"
    CompilerFlags = $CompileFlagsRun
}

Invoke-MapWorkflow @BuildOptions
if ($script:MapWorkflowExitCode -ne 0) {
    exit $script:MapWorkflowExitCode
}
