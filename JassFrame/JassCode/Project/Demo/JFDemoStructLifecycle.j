//! zinc

library JFDemoStructLifecycle requires JFDemoCommon {

    // 基类只放一个字段，用来确认继承字段会进入实例和反射体系。
    struct JFD_BaseStats {
        integer baseValue = 2;
    }

    // 生命周期样例集中覆盖字段默认值、readonly、数组字段、构造析构和操作符。
    struct JFD_LifeStats extends JFD_BaseStats {
        integer hp = 100;
        real speed = 1.25;
        string name = "未命名";
        readonly integer rawId = 'Hpal';
        integer slots[3];
        static integer LiveCount = 0;
        static constant integer MaxHp = 999;

        // 构造函数负责写入运行时输入，并顺手初始化数组字段。
        JFD_LifeStats(string heroName, integer startHp) {
            this.name = heroName;
            this.hp = startHp;
            this.slots[0] = startHp;
            this.slots[1] = startHp + 1;
            this.slots[2] = startHp + 2;
            JFD_LifeStats.LiveCount += 1;
        }

        // 析构函数只维护计数并打印名称，方便观察 delete 和 let 的清理时机。
        ~JFD_LifeStats() {
            BJDebugMsg("[析构] 释放结构体对象：" + this.name);
            JFD_LifeStats.LiveCount -= 1;
        }

        // 带默认参数的方法用于验证方法参数补齐和普通显式传参。
        public method Describe(string prefix = "角色") -> string {
            return prefix + ":" + this.name + ":" + I2S(this.hp);
        }

        // 下标读写操作符把结构体里的固定数组包装成更自然的访问形式。
        public method operator [](integer index) -> integer {
            return this.slots[index];
        }

        public method operator []=(integer index, integer value) {
            this.slots[index] = value;
        }

        // 手动 allocate/deallocate 路径不走构造析构，这里显式写完必要字段。
        public static method ManualCreate(string heroName, integer startHp) -> JFD_LifeStats {
            JFD_LifeStats hero = JFD_LifeStats.allocate();

            hero.baseValue = 2;
            hero.hp = startHp;
            hero.speed = 1.25;
            hero.name = heroName;
            hero.slots[0] = startHp;
            hero.slots[1] = startHp + 1;
            hero.slots[2] = startHp + 2;
            return hero;
        }

        // 和 ManualCreate 配对，专门验证传统生命周期接口仍可使用。
        public method ManualDestroy() {
            JFD_LifeStats.deallocate(this);
        }
    }

    // let 对象在 return 前自动释放，用 LiveCount 的前后值来确认没有泄漏。
    private function JFD_LetScopeHp() -> integer {
        let JFD_LifeStats temp("let临时对象", 80);

        return temp.hp;
    }

    // new/delete 应当让 LiveCount 先加一再回到原值。
    private function JFD_NewDeleteLifecycleScore() -> integer {
        integer before = JFD_LifeStats.LiveCount;
        JFD_LifeStats hero = new JFD_LifeStats("new对象", 250);
        integer during = JFD_LifeStats.LiveCount;

        delete hero;
        return (during - before) * 10 + (JFD_LifeStats.LiveCount - before);
    }

    // 本主题把结构体的“声明能力”和“对象生命周期”放在同一组日志里观察。
    public function JFD_RunStructLifecycleDemo() {
        integer letBefore = JFD_LifeStats.LiveCount;
        integer letHp = JFD_LetScopeHp();
        integer letAfter = JFD_LifeStats.LiveCount;
        JFD_LifeStats hero = new JFD_LifeStats("测试英雄", 250);
        JFD_LifeStats manualHero = JFD_LifeStats.ManualCreate("手动对象", 33);
        integer reflectedHp = hero.at("hp");
        integer reflectedCount = JFD_LifeStats.size();
        integer sizeofCount = sizeof(JFD_LifeStats);

        hero[1] = 77;
        hero.at("hp") = reflectedHp + 50;

        JFD_BeginTheme("结构体生命周期");
        JFD_ExpectString("字段默认值与构造函数共同生效", hero.Describe(), "角色:测试英雄:300");
        JFD_ExpectInteger("继承字段参与实例访问", hero.baseValue, 2);
        JFD_ExpectInteger("readonly字段可以读取", hero.rawId, 'Hpal');
        JFD_ExpectInteger("static constant成员可读取", JFD_LifeStats.MaxHp, 999);
        JFD_ExpectInteger("固定长度数组字段与operator[]/[]=可用", hero[1], 77);
        JFD_ExpectString("方法显式参数可覆盖默认值", hero.Describe("单位"), "单位:测试英雄:300");
        JFD_ExpectInteger("new/delete触发构造析构并回收计数", JFD_NewDeleteLifecycleScore(), 10);
        JFD_ExpectInteger("let作用域对象return前会自动清理", letBefore * 100 + letHp + letAfter, 80);
        JFD_ExpectString("反射按字段名读取字符串字段", hero.at("name", string), "测试英雄");
        JFD_ExpectInteger("反射size与sizeof一致", reflectedCount, sizeofCount);
        JFD_ExpectString("反射type返回字段类型名", JFD_LifeStats.type(0), "integer");
        JFD_ExpectInteger("create/allocate/deallocate传统生命周期接口可用", manualHero.hp, 33);
        JFD_RecordCompileCase("readonly字段只读约束", "写入readonly字段的写法保存在禁用示例中");
        JFD_EndTheme("结构体生命周期");

        manualHero.ManualDestroy();
        delete hero;
    }
}

//! endzinc
