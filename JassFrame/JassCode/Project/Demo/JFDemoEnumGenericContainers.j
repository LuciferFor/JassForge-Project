//! zinc

library JFDemoEnumGenericContainers requires JFDemoCommon {

    // 枚举成员名加前缀，是为了避开当前编译器对枚举成员的全局重名保护。
    enum JFD_DemoMode: integer {
        JFD_ModeIdle = 0,
        JFD_ModeFarming = 1,
        JFD_ModeBoss = 2
    }

    // string 底层枚举用于确认枚举不只支持 integer。
    enum JFD_HeroAttr: string {
        STR = "力量",
        AGI = "敏捷"
    }

    // 单类型参数泛型，分别用 integer 和 string 实例化。
    struct JFD_Box<T> {
        T value;

        public method Assign(T newValue) {
            this.value = newValue;
        }

        public method Get() -> T {
            return this.value;
        }
    }

    // 双类型参数泛型，用来确认泛型实参数量和字段类型都能正确单态化。
    struct JFD_Pair<K, V> {
        K key;
        V value;

        public method Set(K newKey, V newValue) {
            this.key = newKey;
            this.value = newValue;
        }
    }

    // vector 覆盖排序、range-for、插入、删除、下标读写和清空。
    private function JFD_VectorScore() -> integer {
        sys::vector<integer> values = sys::vector<integer>.create();
        integer sum = 0;

        values.push_back(3);
        values.push_back(1);
        values.push_back(2);
        sys::sort(values);

        for (integer value : values) {
            sum = sum * 10 + value;
        }

        values.insert(1, 9);
        values.erase(1);
        values[2] = values.back() + values.front();
        sum = sum + values.at(2);
        values.pop_back();
        sum = sum + values.size();
        values.clear();
        sum = sum + (values.empty() ? 1000 : 0);

        values.destroy();
        return sum;
    }

    // 带比较器的 sys::sort 需要一个兼容 (T, T) -> boolean 的 lambda。
    private function JFD_VectorComparatorScore() -> integer {
        sys::vector<integer> values = sys::vector<integer>.create();
        integer score = 0;

        values.push_back(1);
        values.push_back(3);
        values.push_back(2);
        sys::sort(values, function(integer a, integer b) -> boolean {
            return a > b;
        });

        score = values.front() * 100 + values.at(1) * 10 + values.back();
        values.destroy();
        return score;
    }

    // stack 不参与 range-for，这里只测后进先出的常用 API。
    private function JFD_StackScore() -> integer {
        sys::stack<string> names = sys::stack<string>.create();
        integer score = 0;

        names.push("第一层");
        names.push("第二层");
        names.push("栈顶");
        score = names.size() * 10 + (names.top() == "栈顶" ? 3 : 0);
        names.pop();
        score = score + (names.top() == "第二层" ? 2 : 0);
        names.clear();
        score = score + (names.empty() ? 100 : 0);
        names.destroy();
        return score;
    }

    // queue 按先进先出读取 front/back，清空后 empty 应为 true。
    private function JFD_QueueScore() -> integer {
        sys::queue<integer> waves = sys::queue<integer>.create();
        integer score = 0;

        waves.push(10);
        waves.push(20);
        waves.push(30);
        score = waves.size() + waves.front() + waves.back();
        waves.pop();
        score = score + waves.front();
        waves.clear();
        score = score + (waves.empty() ? 100 : 0);
        waves.destroy();
        return score;
    }

    // map 的 range-for 遍历 key，再用下标读回 value。
    private function JFD_MapScore() -> integer {
        sys::map<string, integer> scores = sys::map<string, integer>.create();
        integer total = 0;

        scores.insert("战士", 100);
        scores["法师"] = 88;
        scores["猎人"] = 92;

        if (scores.contains("战士")) {
            total = total + scores["战士"] + scores.count("战士");
        }

        for (string key : scores) {
            total = total + scores[key];
        }

        total = total + (scores.at(0) != "" ? 1 : 0);
        scores.erase("法师");
        total = total + scores.size();
        scores.clear();
        total = total + (scores.empty() ? 1000 : 0);
        scores.destroy();
        return total;
    }

    // 本主题同时覆盖强类型枚举、用户泛型和内置泛型容器。
    public function JFD_RunEnumGenericContainersDemo() {
        JFD_DemoMode castedMode = static_cast<JFD_DemoMode>(2);
        JFD_Box<integer> intBox = JFD_Box<integer>.create();
        JFD_Box<string> stringBox = JFD_Box<string>.create();
        JFD_Pair<string, integer> pair = JFD_Pair<string, integer>.create();

        intBox.Assign(42);
        stringBox.Assign("泛型字符串");
        pair.Set("等级", 7);

        JFD_BeginTheme("枚举泛型与容器");
        JFD_ExpectBoolean("强类型枚举只能和同类型比较", castedMode == JFD_DemoMode.JFD_ModeBoss, true);
        JFD_ExpectString("字符串底层枚举必须限定名访问", (string)JFD_HeroAttr.STR, "力量");
        JFD_ExpectInteger("用户泛型结构体integer实例", intBox.Get(), 42);
        JFD_ExpectString("用户泛型结构体string实例", stringBox.Get(), "泛型字符串");
        JFD_ExpectString("多类型参数泛型结构体", pair.key + "=" + I2S(pair.value), "等级=7");
        JFD_ExpectInteger("sys::vector排序和range-for", JFD_VectorScore(), 1129);
        JFD_ExpectInteger("sys::sort自定义比较器", JFD_VectorComparatorScore(), 321);
        JFD_ExpectInteger("sys::stack基础API", JFD_StackScore(), 135);
        JFD_ExpectInteger("sys::queue基础API", JFD_QueueScore(), 163);
        JFD_ExpectInteger("sys::map下标、contains、count、range-for", JFD_MapScore(), 1384);
        JFD_RecordCompileCase("sys::stack和sys::queue遍历限制", "禁用示例里保留了不支持的range-for写法");
        JFD_EndTheme("枚举泛型与容器");

        intBox.destroy();
        stringBox.destroy();
        pair.destroy();
    }
}

//! endzinc
