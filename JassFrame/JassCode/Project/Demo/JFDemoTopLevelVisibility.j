library JFDemoVjassBridge
    // 这个文件故意先保留一段 vJASS，用来确认同一源码目录里可以混合两种语法。
    globals
        integer JFD_VjassGlobalValue = 5
    endglobals

    // 给 Zinc 侧调用的最小 vJASS 函数，验证跨语法风格调用不会丢符号。
    function JFD_VjassAdd takes integer a, integer b returns integer
        return a + b
    endfunction

    // hook 的目标函数保持空实现，避免运行时副作用影响其它用例。
    function JFD_HookTarget takes nothing returns nothing
    endfunction

    // hook handler 只改一个本库全局，便于从生成代码里确认 hook 包装已生成。
    function JFD_HookHandler takes nothing returns nothing
        set JFD_VjassGlobalValue = JFD_VjassGlobalValue + 1
    endfunction

    hook JFD_HookTarget JFD_HookHandler
endlibrary

scope JFDemoVjassScope initializer JFD_VjassScopeInit

    // scope 和 initializer 在 vJASS 项目里很常见，这里保留一个轻量例子。
    globals
        integer JFD_VjassScopeValue = 0
    endglobals

    function JFD_VjassScopeInit takes nothing returns nothing
        set JFD_VjassScopeValue = 9
    endfunction

endscope