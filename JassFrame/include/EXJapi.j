function EXGetEventDamageData takes integer p1 returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

function EXSetEventDamage takes real p1 returns boolean
    call GetTriggeringTrigger()
    return false
endfunction

function EXSetUnitReal takes integer p1, integer p2, real p3 returns boolean
    call GetTriggeringTrigger()
    return false
endfunction

function EXSetUnitCollisionType takes boolean p1, unit p2, integer p3 returns nothing
    call GetTriggeringTrigger()
endfunction

function EXGetUnitReal takes integer p1, integer p2 returns real
    call GetTriggeringTrigger()
    return 0.0
endfunction

function EXGetUnitString takes integer p1, integer p2 returns string
    call GetTriggeringTrigger()
    return ""
endfunction

function EXSetUnitString takes integer p1, integer p2, string p3 returns boolean
    call GetTriggeringTrigger()
    return false
endfunction

function EXGetUnitInteger takes integer p1, integer p2 returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

function EXSetEffectSpeed takes effect p1, real p2 returns nothing
    call GetTriggeringTrigger()
endfunction

function EXEffectMatReset takes effect p1 returns nothing
    call GetTriggeringTrigger()
endfunction

function EXSetEffectXY takes effect p1, real p2, real p3 returns nothing
    call GetTriggeringTrigger()
endfunction

function EXGetEffectY takes effect p1 returns real
    call GetTriggeringTrigger()
    return 0.0
endfunction

function EXGetAbilityDataString takes ability p1, integer p2, integer p3 returns string
    call GetTriggeringTrigger()
    return ""
endfunction

function EXSetUnitMoveType takes unit p1, integer p2 returns nothing
    call GetTriggeringTrigger()
endfunction

function EXSetUnitFacing takes unit p1, real p2 returns nothing
    call GetTriggeringTrigger()
endfunction

function EXGetUnitAbility takes unit p1, integer p2 returns ability
    call GetTriggeringTrigger()
    return null
endfunction

function EXGetUnitAbilityByIndex takes unit p1, integer p2 returns ability
    call GetTriggeringTrigger()
    return null
endfunction

function EXGetAbilityId takes ability p1 returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

function EXGetAbilityState takes ability p1, integer p2 returns real
    call GetTriggeringTrigger()
    return 0.0
endfunction

function EXSetAbilityState takes ability p1, integer p2, real p3 returns boolean
    call GetTriggeringTrigger()
    return false
endfunction

function EXEffectMatRotateX takes effect p1, real p2 returns nothing
    call GetTriggeringTrigger()
endfunction

function EXGetAbilityDataReal takes ability p1, integer p2, integer p3 returns real
    call GetTriggeringTrigger()
    return 0.0
endfunction

function EXSetItemDataString takes integer p1, integer p2, string p3 returns boolean
    call GetTriggeringTrigger()
    return false
endfunction

function EXSetAbilityDataReal takes ability p1, integer p2, integer p3, real p4 returns boolean
    call GetTriggeringTrigger()
    return false
endfunction

function EXGetAbilityDataInteger takes ability p1, integer p2, integer p3 returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

function EXSetAbilityDataInteger takes ability p1, integer p2, integer p3, integer p4 returns boolean
    call GetTriggeringTrigger()
    return false
endfunction

function EXSetAbilityString takes integer p1, integer p2, integer p3, string p4 returns boolean
    call GetTriggeringTrigger()
    return false
endfunction

function EXSetAbilityDataString takes ability p1, integer p2, integer p3, string p4 returns boolean
    call GetTriggeringTrigger()
    return false
endfunction

function EXSetAbilityAEmeDataA takes ability p1, integer p2 returns boolean
    call GetTriggeringTrigger()
    return false
endfunction

function EXGetBuffDataString takes integer p1, integer p2 returns string
    call GetTriggeringTrigger()
    return ""
endfunction

function EXSetBuffDataString takes integer p1, integer p2, string p3 returns boolean
    call GetTriggeringTrigger()
    return false
endfunction

function EXGetAbilityString takes integer p1, integer p2, integer p3 returns string
    call GetTriggeringTrigger()
    return ""
endfunction

function EXGetItemDataString takes integer p1, integer p2 returns string
    call GetTriggeringTrigger()
    return ""
endfunction

function EXGetEffectX takes effect p1 returns real
    call GetTriggeringTrigger()
    return 0.0
endfunction

function SetUnitAbilityButtonPos takes unit u, integer abil, integer x, integer y returns boolean
    call GetTriggeringTrigger()
    return true
endfunction

// 获取聊天框是否显示
function GetChatState takes nothing returns boolean
    call GetTriggeringTrigger()
    return true
endfunction

// 异步执行函数（桩包装）
//@ desync danger-execstring 2
//@ execstring-func
function ExExecuteFunc takes string p1 returns nothing
    call GetTriggeringTrigger()
endfunction

function EXGetEffectZ takes effect p1 returns real
    call GetTriggeringTrigger()
    return 0.0
endfunction

function EXSetEffectSize takes effect p1, real p2 returns nothing
    call GetTriggeringTrigger()
endfunction

function EXGetEffectSize takes effect p1 returns real
    call GetTriggeringTrigger()
    return 0.0
endfunction

// 解除特效绑定
function UnBindEffect takes effect Effect returns nothing
    call GetTriggeringTrigger()
endfunction

// 设置特效高度
function EXSetEffectZ takes effect p1, real p2 returns nothing
    call GetTriggeringTrigger()
endfunction

function EXEffectMatRotateY takes effect p1, real p2 returns nothing
    call GetTriggeringTrigger()
endfunction

// 显示/隐藏frame
function FrameShow takes integer frame, boolean show returns nothing
    call GetTriggeringTrigger()
endfunction

function EXEffectMatRotateZ takes effect p1, real p2 returns nothing
    call GetTriggeringTrigger()
endfunction

function EXEffectMatScale takes effect p1, real p2, real p3, real p4 returns nothing
    call GetTriggeringTrigger()
endfunction

// JAPI眩晕
function EXPauseUnit takes unit p1, boolean p2 returns nothing
    call GetTriggeringTrigger()
endfunction

//单位添加眩晕
function YDWEUnitAddStun takes unit u returns nothing
    call EXPauseUnit(u, true)
endfunction

//单位删除眩晕
function YDWEUnitRemoveStun takes unit u returns nothing
    call EXPauseUnit(u, false)
endfunction

//判断是否是物理伤害
function YDWEIsEventPhysicalDamage takes nothing returns boolean
    return 0 != EXGetEventDamageData(1)
endfunction

//判断是否是攻击伤害
function YDWEIsEventAttackDamage takes nothing returns boolean
    return 0 != EXGetEventDamageData(2)
endfunction

//判断是否是范围伤害
function YDWEIsEventRangedDamage takes nothing returns boolean
    return 0 != EXGetEventDamageData(3)
endfunction

//判断伤害类型
function YDWEIsEventDamageType takes damagetype damageType returns boolean
    return damageType == ConvertDamageType(EXGetEventDamageData(4))
endfunction

//判断武器类型
function YDWEIsEventWeaponType takes weapontype weaponType returns boolean
    return weaponType == ConvertWeaponType(EXGetEventDamageData(5))
endfunction

//判断攻击类型
function YDWEIsEventAttackType takes attacktype attackType returns boolean
    return attackType == ConvertAttackType(EXGetEventDamageData(6))
endfunction

//设置伤害
//@ nodiscard 1
function YDWESetEventDamage takes real amount returns boolean
    return EXSetEventDamage(amount)
endfunction

//设置物品数据 (字符串) [JAPI]
function YDWESetItemDataString takes integer ItemTypeId, integer Type, string Value returns nothing
    call EXSetItemDataString(ItemTypeId, Type, Value)
endfunction

//获取物品数据 (字符串) [JAPI]
function YDWEGetItemDataString takes integer ItemTypeId, integer Type returns string
    return EXGetItemDataString(ItemTypeId, Type)
endfunction

//技能属性 [JAPI]
function YDWEGetUnitAbilityState takes unit u, integer abilcode, integer data_type returns real
    return EXGetAbilityState(EXGetUnitAbility(u, abilcode), data_type)
endfunction

//技能数据 (整数) [JAPI]
function YDWEGetUnitAbilityDataInteger takes unit u, integer abilcode, integer level, integer data_type returns integer
    return EXGetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, data_type)
endfunction

//技能数据 (实数) [JAPI]
function YDWEGetUnitAbilityDataReal takes unit u, integer abilcode, integer level, integer data_type returns real
    return EXGetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type)
endfunction

//技能数据 (字符串) [JAPI]
function YDWEGetUnitAbilityDataString takes unit u, integer abilcode, integer level, integer data_type returns string
    return EXGetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type)
endfunction

//设置技能属性 [JAPI]
function YDWESetUnitAbilityState takes unit u, integer abilcode, integer data_type, real value returns nothing
    call EXSetAbilityState(EXGetUnitAbility(u, abilcode), data_type, value)
endfunction

//设置技能数据 (整数) [JAPI]
function YDWESetUnitAbilityDataInteger takes unit u, integer abilcode, integer level, integer data_type, integer value returns nothing
    call EXSetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, data_type, value)
endfunction

//设置技能数据 (实数) [JAPI]
function YDWESetUnitAbilityDataReal takes unit u, integer abilcode, integer level, integer data_type, real value returns nothing
    call EXSetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type, value)
endfunction

//设置技能数据 (字符串)
function YDWESetUnitAbilityDataString takes unit u, integer abilcode, integer level, integer data_type, string value returns nothing
    call EXSetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type, value)
endfunction

//单位变身
function YDWEUnitTransform takes unit u, integer abilcode, integer targetid returns nothing
    call UnitAddAbility(u, abilcode)
    call YDWESetUnitAbilityDataInteger(u, abilcode, 1, 117, GetUnitTypeId(u))
    call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, abilcode), GetUnitTypeId(u))
    call UnitRemoveAbility(u, abilcode)
    call UnitAddAbility(u, abilcode)
    call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, abilcode), targetid)
    call UnitRemoveAbility(u, abilcode)
endfunction

function GetPluginVersion takes nothing returns string
    call GetTriggeringTrigger()
    return null
endfunction

// 清除所有的字符串缓存
function ReleaseAllString takes nothing returns nothing
    call GetTriggeringTrigger()
endfunction

// 删除指定字符串
function ReleaseString takes string str returns nothing
    call GetTriggeringTrigger()
endfunction

// 获取字符串数量
//@ desync danger 1
function GetCacheStringCount takes nothing returns integer
    local integer a = 0
    call GetTriggeringTrigger()
    return 0
endfunction

// 写入所有字符串到文件
//@ desync danger 1
function DumpAllString takes string filename returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

// 获取当前选中单位
//@ desync danger 1
function GetRealSelectUnit takes nothing returns unit
    call GetTriggeringTrigger()
    return null
endfunction

// 获取指向的单位
//@ desync danger 1
function GetTargetObject takes nothing returns unit
    call GetTriggeringTrigger()
    return null
endfunction

// 设置单位名字
function SetUnitName takes unit u, string name returns nothing
    call GetTriggeringTrigger()
endfunction

// 解锁FPS
function UnlockFps takes boolean is_unlock returns nothing
    call GetTriggeringTrigger()
endfunction

function GetFps takes nothing returns real
    call GetTriggeringTrigger()
    return 0
endfunction

// 设置单位大头像模型
function SetUnitPortrait takes unit u, string model returns nothing
    call GetTriggeringTrigger()
endfunction

// 设置宽屏
function EnableWideScreen takes boolean p1 returns nothing
    call GetTriggeringTrigger()
endfunction

// 设置黑边
function FrameEditBlackBorders takes real p1, real p2 returns nothing
    call GetTriggeringTrigger()
endfunction

// 隐藏控制台
function FrameHideInterface takes nothing returns nothing
    call GetTriggeringTrigger()
endfunction

// 执行脚本
function EXExecuteScript takes string p1 returns string
    call GetTriggeringTrigger()
    return ""
endfunction

// 解锁blp像素
function UnlockBlpSize takes boolean is_unlock returns nothing
    call GetTriggeringTrigger()
endfunction

// 隐藏单位跟物品 鼠标指向时显示的 UI 包括单位血条
function SetUnitPressUIVisible takes handle Handle, boolean is_show returns nothing
    call GetTriggeringTrigger()
endfunction

// 获取 simple类型控件的 父控件
function FrameGetSimpleParent takes integer SimpleFrame returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

// 设置 simple类型控件的 父控件
function FrameSetSimpleParent takes integer SimpleFrame, integer parentSimple returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

// 为Simple绑定 frame类型的子控件
// 可以将任意frame类型 绑定到 原生ui下面 返回值 可以解除绑定
// 返回的是一个 SetupFrame值
function FrameSimpleBindFrame takes integer SimpleFrame, integer Frame returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

// 解除绑定 解除后 frame跟simple 就不再关联
function FrameSimpleUnBindFrame takes integer SetupFrame returns nothing
    call GetTriggeringTrigger()
endfunction

// 修改 原生按钮图片 button 可以是 技能按钮 物品按钮 英雄按钮 农民按钮 框选按钮 buff按钮
function FrameSetOriginButtonTexture takes integer btn, string path returns nothing
    call GetTriggeringTrigger()
endfunction

// 获取 原生按钮图片 button 可以是 技能按钮 物品按钮 英雄按钮 农民按钮 框选按钮 buff按钮
function FrameGetOriginButtonTexture takes integer btn returns string
    call GetTriggeringTrigger()
    return ""
endfunction

// 获取 框选按钮 slot 从0 ~ 11
function FrameGetInfoSelectButton takes integer slot returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

// 获取 下方buff按钮 slot 从0 ~ 7
function FrameGetBuffButton takes integer slot returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

// 获取 农民按钮
function FrameGetUnitButton takes nothing returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

// 获取 技能右下角数字文本控件 button = 技能按钮  返回值 = SimpleString 类型控件
function FrameGetButtonSimpleString takes integer btn returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

// 获取 技能右下角控件  button = 技能按钮  返回值 = SimpleFrame 类型控件
function FrameGetButtonSimpleFrame takes integer btn returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

// 获取父控件
function FrameGetParent takes integer frame, integer last returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

// 设置控件视口
function FrameSetViewPort takes integer frame, boolean enable returns nothing
    call GetTriggeringTrigger()
endfunction

// 绑定特效到weight
function BindEffect takes integer Handle, string socket, effect Effect returns nothing
    call GetTriggeringTrigger()
endfunction

// 绑定特效到weight
function BindEffectLC takes integer Handle, string socket, effect Effect returns nothing
    call BindEffect(Handle, socket, Effect)
endfunction

// 设置特效颜色
function EXSetEffectColor takes effect eff, integer color returns nothing
    call GetTriggeringTrigger()
endfunction

// 获取特效颜色
function EXGetEffectColor takes effect effect_handle returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

// 显示特效
function EXSetEffectVisible takes effect eff, boolean visible returns nothing
    call GetTriggeringTrigger()
endfunction

// 设置特效是否在迷雾中显示
function EXSetEffectFogVisible takes effect eff, boolean visible returns nothing
    call GetTriggeringTrigger()
endfunction

// 设置特效是否在黑雾中显示
function EXSetEffectMaskVisible takes effect eff, boolean visible returns nothing
    call GetTriggeringTrigger()
endfunction

// 设置单位模型
function SetUnitModel takes integer Handle, string model returns nothing
    call GetTriggeringTrigger()
endfunction

// 清除模型内存缓存
function ReleaseModel takes string model_path returns nothing
    call GetTriggeringTrigger()
endfunction

// 清除所有缓存
function ReleaseAllModel takes nothing returns nothing
    call GetTriggeringTrigger()
endfunction

// 获取缓存数量
//@ desync danger 1
function GetCacheModelCount takes nothing returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

// 获取Z坐标高度
function GetTerrainZ takes real x, real y returns real
    call GetTriggeringTrigger()
    return 0.0
endfunction

// 播放特效动作
function EXSetEffectAnimation takes effect eff, integer index returns nothing
    call GetTriggeringTrigger()
endfunction

// 获取窗口大小
//@ desync danger 1
function GetWindowWidth takes nothing returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

// 获取窗口大小
//@ desync danger 1
function GetWindowHeight takes nothing returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

// 播放特效动作-名字
function EXPlayEffectAnimation takes effect Effect, string animation_name, string link_name returns nothing
    call GetTriggeringTrigger()
endfunction

// 是否窗口化
//@ desync danger 1
function IsWindowMode takes nothing returns boolean
    call GetTriggeringTrigger()
    return false
endfunction

// 缩放粒子
function SetPariticle2Size takes integer Handle, real scale returns nothing
    call GetTriggeringTrigger()
endfunction

// 缩放UI粒子
function FrameSetModelPariticle2Size takes integer frame, real scale returns nothing
    call GetTriggeringTrigger()
endfunction

// 获取uid
//@ desync danger 1
function GetUserId takes nothing returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

// 获取uid
//@ desync danger 1
function GetUserIdEx takes nothing returns string
    call GetTriggeringTrigger()
    return null
endfunction

//获取装饰物最大数量
//返回值：装饰物最大数量    循环1~最大数量 用循环数 作为装饰物的索引
function GetDoodadCount takes nothing returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

//获取装饰物的类型id
//参数：装饰物索引
//返回值：装饰物的物编类型id
function GetDoodadTypeId takes integer index returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

//设置装饰物的模型  如果无效的模型路径 会是一个 绿色的方块
//参数：装饰物索引  模型路径
//返回值：无
function SetDoodadModel takes integer index, string model returns nothing
    call GetTriggeringTrigger()
endfunction

//设置装饰物的队伍颜色
//参数：装饰物索引  队伍颜色  0~15
//返回值：无
function SetDoodadTeamColor takes integer index, integer team_color returns nothing
    call GetTriggeringTrigger()
endfunction

//设置装饰物的颜色
//参数：装饰物索引  颜色   16进制颜色值 0xffffffff  透明通道暂时无效
//返回值：无
function SetDoodadColor takes integer index, integer color returns nothing
    call GetTriggeringTrigger()
endfunction

//获取装饰物的x坐标
//参数：装饰物索引
//返回值：装饰物的x坐标
function GetDoodadX takes integer index returns real
    call GetTriggeringTrigger()
    return 0
endfunction

//获取装饰物的y坐标
//参数：装饰物索引
//返回值：装饰物的y坐标
function GetDoodadY takes integer index returns real
    call GetTriggeringTrigger()
    return 0
endfunction

//获取装饰物的z坐标
//参数：装饰物索引
//返回值：装饰物的z坐标
function GetDoodadZ takes integer index returns real
    call GetTriggeringTrigger()
    return 0
endfunction

//设置装饰物的坐标
//参数：装饰物索引  x坐标  y坐标  z坐标
//返回值：无
function SetDoodadPosition takes integer index, real x, real y, real z returns nothing
    call GetTriggeringTrigger()
endfunction

//设置装饰物的缩放   每次设置是会累加的  乘法计算 会刷新渲染范围
//参数：装饰物索引  x缩放  y缩放  z缩放
//返回值：无
function SetDoodadMatScale takes integer index, real x, real y, real z returns nothing
    call GetTriggeringTrigger()
endfunction

//设置装饰物的旋转矩阵  每次设置是会累加的  乘法计算
//参数：装饰物索引  x旋转  y旋转  z旋转
//返回值：无
function SetDoodadMatRotateX takes integer index, real x returns nothing
    call GetTriggeringTrigger()
endfunction

function SetDoodadMatRotateY takes integer index, real y returns nothing
    call GetTriggeringTrigger()
endfunction

function SetDoodadMatRotateZ takes integer index, real z returns nothing
    call GetTriggeringTrigger()
endfunction

//设置装饰物的矩阵重置成1  将旋转跟缩放重置成1
//参数：装饰物索引
//返回值：无
function SetDoodadMatReset takes integer index returns nothing
    call GetTriggeringTrigger()
endfunction

// 上面的无效就用这个
function SetDoodadMatResize takes integer index returns nothing
    call GetTriggeringTrigger()
endfunction

//设置装饰物的是否可见
//参数：装饰物索引  是否可见
//返回值：无
function SetDoodadVisible takes integer index, boolean visible returns nothing
    call GetTriggeringTrigger()
endfunction

//设置装饰物的动画  调用后 可以使用GetDoodadCurrentAnimationIndex 获取索引，根据索引获取动画名称，时长等信息
//参数：装饰物索引  动画名称  是否禁止随机  true禁止  如果是false则允许随机 会一直随机切换动画 比如stand多个动画时会自动切换。
//返回值：动画时长(毫秒)
function SetDoodadAnimationEx takes integer index, string animation, boolean disable_random returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

//设置装饰物的动画速度  1.0是正常速度  0.5是一半速度  2.0是两倍速度
//参数：装饰物索引  动画速度
//返回值：无
function SetDoodadSpeed takes integer index, real speed returns nothing
    call GetTriggeringTrigger()
endfunction

//获取装饰物的动画速度
//参数：装饰物索引
//返回值：装饰物的动画速度
function GetDoodadSpeed takes integer index returns real
    call GetTriggeringTrigger()
    return 0
endfunction

//获取装饰物的样式
//参数：装饰物索引
//返回值：样式索引
function GetDoodadVariation takes integer index returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

//获取装饰物的当前动画索引
//参数：装饰物索引
//返回值：装饰物的当前动画索引
function GetDoodadCurrentAnimationIndex takes integer index returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

//获取装饰物的动画数量
//参数：装饰物索引
//返回值：装饰物的动画数量 循环0~最大数量-1 用循环数 作为装饰物的动画索引 跟model2的动画索引机制一样
function GetDoodadAnimationCount takes integer index returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

//获取装饰物的动画名称
//参数：装饰物索引  动画索引
//返回值：装饰物的动画名称
function GetDoodadAnimationnName takes integer index, integer animation_index returns string
    call GetTriggeringTrigger()
    return null
endfunction

//获取装饰物的动画时长
//参数：装饰物索引  动画索引
//返回值：装饰物的动画时长(毫秒)
function GetDoodadAnimationTime takes integer index, integer animation_index returns integer
    call GetTriggeringTrigger()
    return 0
endfunction

//创建装饰物    由于没有销毁， 如果可以设置模型+设置不可见 来模拟回收， 需要使用时 再重新提取出来
//参数 装饰物物编类型ID, 样式, x坐标, y坐标, z坐标, 旋转角度, 缩放比例( 受到编辑器最小 最大比例限制)
//返回值：装饰物索引
function CreateDoodad takes integer type_id, integer style, real x, real y, real z, real face, real scale returns integer
    call GetTriggeringTrigger()
    return 0
endfunction