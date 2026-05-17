//! zinc

library JFDemoZTopLevelVisibility requires JFDemoCommon, JFDemoVjassBridge {

    // public/private 块主要覆盖顶层全局声明的可见性分组。
    public {
        integer JFD_TopPublicBlockValue = 11;
    }

    private {
        integer JFD_TopPrivateBlockValue = 12;
    }

    // protected 当前更接近库内可见，这里只在本库内调用，不依赖跨库语义。
    protected function JFD_ProtectedTopValue() -> integer {
        return 13;
    }

    // interpreter 不引入新作用域，只给声明加一条可按路径调用的解释标签。
    interpreter "基础顶层与可见性" {
        function JFD_InterpreterValue() -> integer {
            return 21;
        }

        // 这个函数只用于 code 引用测试，证明解释路径也能降级成普通函数引用。
        function JFD_InterpreterCodeTarget() {
            JFD_TopPrivateBlockValue += 1;
        }

        // 嵌套解释块必须写完整路径，不能只写叶子标签。
        interpreter "嵌套解释块" {
            function JFD_NestedInterpreterText() -> string {
                return "嵌套解释块可调用";
            }
        }
    }

    private function JFD_PrivateTopValue() -> integer {
        return JFD_TopPrivateBlockValue;
    }

    // 本主题负责顶层结构、可见性、解释块、hook 和 native 的正向覆盖。
    public function JFD_RunTopLevelVisibilityDemo() {
        code interpreterCode = function interpreter.("基础顶层与可见性").JFD_InterpreterCodeTarget;

        JFD_BeginTheme("基础顶层与可见性");
        JFD_ExpectInteger("vJASS函数可以和Zinc库一起编译并调用", JFD_VjassAdd(2, 3), 5);
        JFD_ExpectInteger("public块里的全局变量可以读取", JFD_TopPublicBlockValue, 11);
        JFD_ExpectInteger("private块里的全局变量在同库内可读", JFD_PrivateTopValue(), 12);
        JFD_ExpectInteger("protected顶层函数在同库内可调用", JFD_ProtectedTopValue(), 13);
        JFD_ExpectInteger("interpreter路径调用命中指定函数", interpreter.("基础顶层与可见性").JFD_InterpreterValue(), 21);
        JFD_ExpectString("嵌套interpreter路径必须完整匹配", interpreter.("基础顶层与可见性").("嵌套解释块").JFD_NestedInterpreterText(), "嵌套解释块可调用");
        JFD_RecordCompileCase("hook顶层语法", "hook目标和handler同在vJASS桥接库中");
        JFD_RecordCompileCase("native传统签名", "native使用takes/returns传统写法");
        JFD_RecordCompileCase("vJASS scope与initializer", "scope初始化函数保持vJASS写法");
        JFD_RecordCompileCase("interpreter函数引用", "code变量绑定到解释块路径下的函数");
        JFD_EndTheme("基础顶层与可见性");

        interpreterCode = null;
    }
}

//! endzinc
