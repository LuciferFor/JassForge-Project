# =====================================================================
# 脚手架常改配置
# 说明：
# - 以 ".\" 开头的路径默认相对于本脚本所在目录，也就是 $ProjectDir。
# - 绝对路径通常和本机环境绑定，打包脚手架前请按使用者机器重新填写。
# - 一般只需要改本配置区；下方函数是共用流程，非必要不用改。
# =====================================================================

# 项目根目录：默认取当前脚本所在目录，通常不用改。
$ProjectDir = $PSScriptRoot

# JassForge 编译器路径：脚手架自带 jassforge.exe 时保持这个相对路径即可。
$JassForgeExe = ".\jassforge.exe"

# 地图脚本源码目录：编译器会从这里读取 JASS/Lua 等源码。
$MapSourceDir = ".\JassFrame\JassCode"

# 额外链接的 JASS 文件：通常放公共库、EXJapi 等 include 文件。
$LinkJassFile = ".\JassFrame\include\EXJapi.j"

# 导入资源目录：编译时通过 --import 参数传给 JassForge。
$ImportDir = ".\JassFrame\import"

# 主入口 JASS 文件：地图脚本入口，一般是 main.j。
$MainJassFile = ".\JassFrame\include\main.j"

# 编译输出的 war3map.j 文件路径。
$OutputJFile = ".\war3map.j"

# 待写入脚本和资源的地图文件路径。
$MapFile = ".\Map.w3x"

# 构建完成后复制地图到的位置；留空字符串可跳过复制。
$MapCopyTarget = "..\Map.w3x"

# YDWE 启动器路径：用于启动魔兽并加载地图，换机器时通常需要修改。
$YdweExe = "E:\SynologyDrive\地图\作图工具\0_creator_WorldEdit_v1\bin\ydweconfig.exe"

# YDWE 自动搜索根目录：当上面的路径不存在时，会在这里递归查找 YDWEConfig.exe。
$YdweSearchRoot = "E:\SynologyDrive"

# 优先匹配的 YDWE 目录关键字：找到多个启动器时优先使用包含该关键字的路径。
$PreferredYdweMatch = "0_creator_WorldEdit_v1"

# 备用匹配的 YDWE 目录关键字：优先匹配找不到时再使用它。
$FallbackYdweMatch = "4_we_WorldEdit v1.2.9c"

# YDWE 启动器文件名：用于自动搜索，不建议随意修改。
$YdweExecutableName = "YDWEConfig.exe"

# 计划任务启动时使用的 YDWE 路径，默认沿用 $YdweExe。
$ScheduledTaskYdweExe = $YdweExe

# Windows 计划任务名称：使用 ScheduledTask 模式启动魔兽时会临时创建。
$ScheduledTaskName = "YDWE_Runner"

# 计划任务临时批处理文件路径：用于绕过部分远程桌面/权限场景的启动限制。
$ScheduledTaskBat = "C:\Windows\Temp\launch_war3.bat"

# 魔兽进程镜像名：清理旧进程时 taskkill 使用。
$War3ProcessImage = "War3.exe"

# 魔兽进程名：检测魔兽是否仍在运行时使用，不带 .exe。
$War3ProcessName = "War3"

# 文件同步工具路径：用于把脚手架目录中的资源同步到魔兽导入目录。
$WatcherExe = ".\sync.exe"

# 文件同步工具进程名：用于检测 sync.exe 是否已启动。
$WatcherProcessName = "sync.exe"

# 最近一次地图编译退出码：脚本运行时写入，配置时不用改。
$LastMapBuildExitCode = 0

# 当前地图工作流退出码：脚本运行时写入，配置时不用改。
$MapWorkflowExitCode = 0

# 资源同步目录配置：Source 是项目内源目录，Target 是魔兽运行时读取的导入目录。
$WatcherSyncPairs = @(
    @{ Source = ".\JassFrame\Document"; Target = "E:\OpenClow\Warcraft III\war3mapimported\Document" },
    @{ Source = ".\JassFrame\Config"; Target = "E:\OpenClow\Warcraft III\war3mapimported\Config" }
)

# MPQ 导入路径：这些目录会通过 --mpq-import 打进地图包。
$MpqImportPaths = @(
)

# 默认编译参数：日常构建使用，偏向保留调试信息和警告检查。
$CompileFlagsDefault = @(
    "--rebuild"
)

# 运行测试编译参数：用于边构建边启动测试，可按需要开启混淆。
$CompileFlagsRun = @(
    "--rebuild"
)

# =====================================================================
# 共用流程：一般只需要改上面的配置。
# =====================================================================

function Initialize-BuildConsole {
    $script:OutputEncoding = [System.Text.Encoding]::UTF8
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
    [Console]::InputEncoding = [System.Text.Encoding]::UTF8
    chcp 65001 | Out-Null
}

function Resolve-ProjectPath {
    param([string]$Path)

    if ([string]::IsNullOrWhiteSpace($Path)) {
        return $null
    }

    if ([System.IO.Path]::IsPathRooted($Path)) {
        return $Path
    }

    return Join-Path $ProjectDir $Path
}

function Get-ShortPath {
    param([string]$LongPath)

    if ([string]::IsNullOrWhiteSpace($LongPath) -or -not (Test-Path -LiteralPath $LongPath)) {
        return $LongPath
    }

    try {
        $fso = New-Object -ComObject Scripting.FileSystemObject
        if (Test-Path -LiteralPath $LongPath -PathType Leaf) {
            return $fso.GetFile($LongPath).ShortPath
        }

        if (Test-Path -LiteralPath $LongPath -PathType Container) {
            return $fso.GetFolder($LongPath).ShortPath
        }
    }
    catch {
        return $LongPath
    }

    return $LongPath
}

function Resolve-YdweExecutablePath {
    $candidatePath = $YdweExe
    if (-not [string]::IsNullOrWhiteSpace($candidatePath) -and (Test-Path -LiteralPath $candidatePath -PathType Leaf)) {
        return Get-ShortPath -LongPath $candidatePath
    }

    if (-not (Test-Path -LiteralPath $YdweSearchRoot -PathType Container)) {
        return $candidatePath
    }

    $candidates = Get-ChildItem -Path $YdweSearchRoot -Filter $YdweExecutableName -Recurse -File -ErrorAction SilentlyContinue
    if (-not $candidates) {
        return $candidatePath
    }

    $preferredCandidate = $candidates | Where-Object { $_.FullName -like "*$PreferredYdweMatch*" } | Select-Object -First 1
    if ($preferredCandidate) {
        return Get-ShortPath -LongPath $preferredCandidate.FullName
    }

    $fallbackCandidate = $candidates | Where-Object { $_.FullName -like "*$FallbackYdweMatch*" } | Select-Object -First 1
    if ($fallbackCandidate) {
        return Get-ShortPath -LongPath $fallbackCandidate.FullName
    }

    return Get-ShortPath -LongPath $candidates[0].FullName
}

function Convert-ToProcessArgumentList {
    param([string[]]$InputArgs)

    $result = @()
    foreach ($arg in $InputArgs) {
        if ($null -eq $arg) {
            continue
        }

        if ($arg -match '[\s"]') {
            $result += '"' + $arg + '"'
        }
        else {
            $result += $arg
        }
    }

    return $result
}

function Get-WatcherArgumentList {
    $argumentList = @()
    foreach ($pair in $WatcherSyncPairs) {
        $argumentList += "-s"
        $argumentList += $pair.Source
        $argumentList += $pair.Target
    }

    return $argumentList
}

function Get-MpqImportArgumentList {
    $argumentList = @()
    foreach ($path in $MpqImportPaths) {
        $argumentList += "--mpq-import"
        $argumentList += $path
    }

    return $argumentList
}

function Stop-War3ProcessIfNeeded {
    Write-Host "--- Cleaning old War3 process ---" -ForegroundColor Yellow
    taskkill /f /im $War3ProcessImage /t 2>$null | Out-Null
}

function Test-War3ProcessRunning {
    return $null -ne (Get-Process -Name $War3ProcessName -ErrorAction SilentlyContinue | Select-Object -First 1)
}

function Assert-War3NotRunning {
    if (-not (Test-War3ProcessRunning)) {
        return $true
    }

    Write-Error "$War3ProcessImage is still running. Please close Warcraft III before running this workflow."
    $script:MapWorkflowExitCode = 2
    return $false
}

function Start-WatcherAutoStopMonitor {
    param([int]$WatcherPid)

    if ($WatcherPid -le 0) {
        return
    }

    Start-Job -ScriptBlock {
        param($watcherPid, $war3ProcessName)

        $war3Seen = $false
        for ($i = 0; $i -lt 900; $i++) {
            if (-not (Get-Process -Id $watcherPid -ErrorAction SilentlyContinue)) { return }
            if (Get-Process -Name $war3ProcessName -ErrorAction SilentlyContinue) {
                $war3Seen = $true
                break
            }
        }

        if (-not $war3Seen) { return }

        while ($true) {
            if (-not (Get-Process -Id $watcherPid -ErrorAction SilentlyContinue)) { return }
            if (-not (Get-Process -Name $war3ProcessName -ErrorAction SilentlyContinue)) { break }
        }

        Stop-Process -Id $watcherPid -Force -ErrorAction SilentlyContinue
    } -ArgumentList $WatcherPid, $War3ProcessName | Out-Null
}

function Get-ResolvedSyncWatcherExe {
    $resolvedPath = Resolve-ProjectPath $WatcherExe
    if (-not (Test-Path -LiteralPath $resolvedPath -PathType Leaf)) {
        return $null
    }

    return (Resolve-Path -LiteralPath $resolvedPath).Path
}

function Get-RunningSyncWatcher {
    param([string]$ResolvedExe)

    if ([string]::IsNullOrWhiteSpace($ResolvedExe)) {
        return $null
    }

    return (
        Get-CimInstance Win32_Process -Filter "Name='$WatcherProcessName'" -ErrorAction SilentlyContinue |
        Where-Object { $_.ExecutablePath -eq $ResolvedExe } |
        Select-Object -First 1
    )
}

function Start-SyncWatcher {
    param([string]$ResolvedExe)

    $startArgs = Convert-ToProcessArgumentList -InputArgs (Get-WatcherArgumentList)
    if (-not $startArgs -or @($startArgs).Count -eq 0) {
        Write-Host "[Watcher] Empty sync arguments, skip sync.exe" -ForegroundColor Yellow
        return $null
    }

    return Start-Process -FilePath $ResolvedExe -ArgumentList $startArgs -WorkingDirectory $ProjectDir -WindowStyle Hidden -PassThru
}

function Start-FileSyncWatcherIfNeeded {
    $resolvedExe = Get-ResolvedSyncWatcherExe
    if (-not $resolvedExe) {
        Write-Host "[Watcher] Missing executable: $WatcherExe" -ForegroundColor Yellow
        return
    }

    $watcherPid = 0
    $runningExe = Get-RunningSyncWatcher -ResolvedExe $resolvedExe

    if ($runningExe) {
        $watcherPid = [int]$runningExe.ProcessId
        Write-Host "[Watcher] sync.exe already running" -ForegroundColor DarkCyan
    }
    else {
        $proc = Start-SyncWatcher -ResolvedExe $resolvedExe
        if (-not $proc) {
            return
        }

        $watcherPid = [int]$proc.Id
        Write-Host "[Watcher] Started sync.exe" -ForegroundColor Green
    }

    if ($watcherPid -gt 0) {
        Start-WatcherAutoStopMonitor -WatcherPid $watcherPid
    }
}

function Invoke-MapBuild {
    param([string[]]$CompilerFlags = $CompileFlagsDefault)

    Write-Host "--- Building map ---" -ForegroundColor Cyan

    $compilerArgs = @()
    $compilerArgs += $MapSourceDir
    $compilerArgs += "--output"
    $compilerArgs += $OutputJFile
    $compilerArgs += "--link"
    $compilerArgs += $LinkJassFile
    $compilerArgs += "--import"
    $compilerArgs += $ImportDir
    $compilerArgs += "--main"
    $compilerArgs += $MainJassFile
    $compilerArgs += Get-MpqImportArgumentList
    $compilerArgs += "--map"
    $compilerArgs += $MapFile

    if ($CompilerFlags) {
        $compilerArgs += $CompilerFlags
    }

    & $JassForgeExe @compilerArgs
    $script:LastMapBuildExitCode = $LASTEXITCODE
}

function Copy-BuiltMap {
    if ([string]::IsNullOrWhiteSpace($MapCopyTarget)) {
        return
    }

    Copy-Item -Path $MapFile -Destination $MapCopyTarget -Force
}

function Start-War3Direct {
    param([string]$MapPath)

    $resolvedYdweExe = Resolve-YdweExecutablePath
    & $resolvedYdweExe -launchwar3 -loadfile $MapPath
}

function Start-War3ByScheduledTask {
    param([string]$MapPath)

    $resolvedYdweExe = Resolve-YdweExecutablePath
    $scheduledTaskMapPath = Get-ShortPath -LongPath $MapPath
    $ydweBin = Split-Path -Parent $resolvedYdweExe
    $batContent = @"
@echo off
cd /d "$ydweBin"
start "" "$resolvedYdweExe" -launchwar3 -loadfile "$scheduledTaskMapPath"
exit
"@

    $batContent | Out-File -FilePath $ScheduledTaskBat -Encoding Default

    Write-Host "Dispatching launch command through scheduled task..." -ForegroundColor Green
    schtasks /delete /tn $ScheduledTaskName /f 2>$null | Out-Null
    schtasks /create /tn $ScheduledTaskName /tr $ScheduledTaskBat /sc once /st 00:00 /it /rl HIGHEST /f | Out-Null
    schtasks /run /tn $ScheduledTaskName | Out-Null

    if ($LASTEXITCODE -eq 0) {
        Write-Host "Launch command sent. Please check the server desktop." -ForegroundColor Green
        schtasks /delete /tn $ScheduledTaskName /f 2>$null | Out-Null
    }
    else {
        Write-Host "Launch failed. Please make sure the server desktop is signed in." -ForegroundColor Red
    }
}

function Start-War3Test {
    param(
        [ValidateSet("Direct", "ScheduledTask")]
        [string]$LauncherMode = "Direct"
    )

    $mapPath = Resolve-ProjectPath $MapFile
    Write-Host "--- Starting YDWE ---" -ForegroundColor Cyan

    if ($LauncherMode -eq "ScheduledTask") {
        Start-War3ByScheduledTask -MapPath $mapPath
        return
    }

    Start-War3Direct -MapPath $mapPath
}

function Invoke-MapWorkflow {
    param(
        [bool]$CleanWar3 = $false,
        [bool]$LaunchWar3 = $false,
        [ValidateSet("Direct", "ScheduledTask")]
        [string]$LauncherMode = "Direct",
        [string[]]$CompilerFlags = $CompileFlagsDefault
    )

    Initialize-BuildConsole
    Push-Location -LiteralPath $ProjectDir

    try {
        $script:MapWorkflowExitCode = 0

        if ($CleanWar3) {
            # Stop-War3ProcessIfNeeded
        }

        if (-not (Assert-War3NotRunning)) {
            return
        }

        Start-FileSyncWatcherIfNeeded
        Invoke-MapBuild -CompilerFlags $CompilerFlags
        $buildExitCode = $script:LastMapBuildExitCode

        if ($buildExitCode -ne 0) {
            Write-Host "Build failed, exit code: $buildExitCode" -ForegroundColor Red
            $script:MapWorkflowExitCode = $buildExitCode
            return
        }

        Copy-BuiltMap

        if ($LaunchWar3) {
            Start-War3Test -LauncherMode $LauncherMode
        }

        $script:MapWorkflowExitCode = 0
    }
    finally {
        Pop-Location
    }
}
