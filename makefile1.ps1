. "$PSScriptRoot\makefile.common.ps1"

# 兼容入口：保留计划任务启动方式，适合需要把 YDWE 分发到交互桌面的场景。
$BuildOptions = @{
    CleanWar3    = $true
    LaunchWar3   = $true
    LauncherMode  = "ScheduledTask"
    CompilerFlags = $CompileFlagsLegacy
}

Invoke-MapWorkflow @BuildOptions
if ($script:MapWorkflowExitCode -ne 0) {
    exit $script:MapWorkflowExitCode
}
