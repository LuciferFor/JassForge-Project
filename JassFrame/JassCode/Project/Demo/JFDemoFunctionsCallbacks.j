//! zinc

library JFDemoFunctionsCallbacks requires JFDemoCommon {

    // 两个函数指针类型分别覆盖有返回字符串和整数转换的调用形态。
    type JFD_ScoreFormatter extends function(string, integer) -> string;
    type JFD_IntTransform extends function(integer) -> integer;

    private integer JFD_CallbackHitCount = 0;

    // 方法上的 & 参数也会回写调用点的简单变量。
    struct JFD_RefMethodBox {
        integer delta = 0;

        public method AddTo(integer &value) {
            value += this.delta;
        }
    }

    // 默认参数只在调用点省略实参时补齐，生成代码里仍是普通参数调用。
    public function JFD_AddWithDefault(integer base, integer bonus = 10) -> integer {
        return base + bonus;
    }

    // & 参数只覆盖简单变量实参，字段、数组项等非法写法放在禁用示例里。
    private function JFD_BumpByRef(integer &value, integer delta) {
        value += delta;
    }

    // 给普通函数指针和 sys::function 共用，顺手覆盖默认参数。
    private function JFD_FormatScore(string label, integer score = 8) -> string {
        return label + "=" + I2S(score);
    }

    // 传统 code 引用要求目标函数无参无返回。
    private function JFD_NamedCodeTarget() {
        JFD_CallbackHitCount += 1;
    }

    // TriggerAddCondition 会把 boolean 回调自动包成 Condition。
    private function JFD_ConditionNamedTarget() -> boolean {
        return true;
    }

    // 默认参数里的 lambda 不能捕获外部变量，这里特意使用空闭包。
    private function JFD_DefaultCodeIsProvided(code cb = function() {
    }) -> boolean {
        if (cb) {
            return true;
        }

        return false;
    }

    // 强类型函数指针可以直接接收 lambda，并通过 evaluate 调用。
    private function JFD_LambdaCaptureScore() -> integer {
        JFD_IntTransform transform = function(integer value) -> integer {
            return value + 5;
        };

        return transform.evaluate(7);
    }

    // 普通函数指针按签名匹配，和具体函数名没有绑定关系。
    private function JFD_FunctionPointerText() -> string {
        JFD_ScoreFormatter formatter = JFD_FormatScore;
        JFD_IntTransform transform = function(integer value) -> integer {
            return value * 2;
        };

        return formatter.evaluate("积分", transform.evaluate(6));
    }

    // sys::function 绑定的是具体全局函数，适合需要精确引用目标的场景。
    private function JFD_SysFunctionDefaultText() -> string {
        sys::function<JFD_FormatScore> formatter = JFD_FormatScore;

        return formatter("默认参数");
    }

    // 条件回调测试只创建临时 trigger，验证完立即销毁。
    private function JFD_CheckTriggerConditionWrap() -> boolean {
        trigger t = CreateTrigger();
        triggercondition namedCondition = TriggerAddCondition(t, function JFD_ConditionNamedTarget);
        triggercondition lambdaCondition = TriggerAddCondition(t, function() -> boolean {
            return true;
        });
        boolean ok = namedCondition != null and lambdaCondition != null;

        DestroyTrigger(t);
        t = null;
        namedCondition = null;
        lambdaCondition = null;
        return ok;
    }

    // TimerStart 和 ForGroup 都会用到 JASS 回调，这里验证闭包能带着局部变量一起生成。
    private function JFD_RunClosureCallbacks() {
        timer delay = CreateTimer();
        group units = CreateGroup();
        string timerText = "TimerStart闭包捕获局部变量";
        string groupText = "ForGroup闭包捕获外层变量";
        integer reward = 25;

        TimerStart(delay, 0.00, false, function() {
            BJDebugMsg("[闭包回调] " + timerText + "，奖励=" + I2S(reward));
            DestroyTimer(delay);
        });

        GroupEnumUnitsOfPlayer(units, Player(0), null);
        ForGroup(units, function() {
            BJDebugMsg("[闭包回调] " + groupText + "，单位句柄=" + I2S(GetHandleId(GetEnumUnit())) + "，奖励=" + I2S(reward));
        });

        DestroyGroup(units);
        delay = null;
        units = null;
    }

    // 本主题按调用方式分组：普通函数、引用参数、函数指针、code和闭包。
    public function JFD_RunFunctionsCallbacksDemo() {
        integer score = JFD_AddWithDefault(5);
        JFD_RefMethodBox box = JFD_RefMethodBox.create();
        code namedCode = function JFD_NamedCodeTarget;

        box.delta = 4;
        JFD_BumpByRef(score, 3);
        box.AddTo(score);

        JFD_BeginTheme("函数与回调");
        JFD_ExpectInteger("普通函数与默认参数", JFD_AddWithDefault(5), 15);
        JFD_ExpectInteger("&引用参数函数和方法会回写简单变量", score, 22);
        JFD_ExpectString("函数指针类型按签名evaluate", JFD_FunctionPointerText(), "积分=12");
        JFD_ExpectString("sys::function精确绑定并保留默认参数", JFD_SysFunctionDefaultText(), "默认参数=8");
        JFD_ExpectInteger("lambda可作为强类型函数指针", JFD_LambdaCaptureScore(), 12);
        JFD_ExpectBoolean("code默认参数可使用无捕获lambda", JFD_DefaultCodeIsProvided(), true);
        JFD_ExpectBoolean("TriggerAddCondition可自动包装函数引用和lambda", JFD_CheckTriggerConditionWrap(), true);
        JFD_ExpectBoolean("传统code函数引用可赋值", namedCode ? true : false, true);
        JFD_RunClosureCallbacks();
        JFD_RecordCompileCase("TimerStart与ForGroup闭包", "回调注册完成，闭包内容会在运行时输出");
        JFD_EndTheme("函数与回调");

        box.destroy();
        namedCode = null;
    }
}

//! endzinc
