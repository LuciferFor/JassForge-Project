. "$PSScriptRoot\makefile.common.ps1"

# 普通构建入口：同步资源、编译地图、复制 Map.w3x，不启动 War3。
$BuildOptions = @{
    CleanWar3    = $false
    LaunchWar3   = $false
    LauncherMode  = "Direct"
    CompilerFlags = $CompileFlagsDefault
}

Invoke-MapWorkflow @BuildOptions
if ($script:MapWorkflowExitCode -ne 0) {
    exit $script:MapWorkflowExitCode
}
