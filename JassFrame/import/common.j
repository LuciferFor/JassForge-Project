//============================================================================
// Native types. All native functions take extended handle types when
// possible to help prevent passing bad values to native functions
//
// 引用计数的对象/代理
type agent			    extends     handle  // all reference counted objects
// 事件
type event              extends     agent  // a reference to an event registration
// 玩家
type player             extends     agent  // a single player reference
// 实体/微件（任意有生命的可互动游戏对象，如单位、物品、可破坏物）
type widget             extends     agent  // an interactive game object with life
// 单位
type unit               extends     widget  // a single unit reference
// 可破坏物
type destructable       extends     widget
// 物品
type item               extends     widget
// 技能
type ability            extends     agent
// 魔法效果
type buff               extends     ability
// 玩家组
type force              extends     agent
// 单位组
type group              extends     agent
// 触发器
type trigger            extends     agent
// 触发器条件
type triggercondition   extends     agent
// 触发器动作
type triggeraction      extends     handle
// 计时器
type timer              extends     agent
// 点
type location           extends     agent
// 不规则区域
type region             extends     agent
// 矩形区域
type rect               extends     agent
// 条件表达式
type boolexpr           extends     agent
// 音效
type sound              extends     agent
// 条件方法
type conditionfunc      extends     boolexpr
// 过滤方法
type filterfunc         extends     boolexpr
// 单位池
type unitpool           extends     handle
// 物品池
type itempool           extends     handle
// 种族
type race               extends     handle
// 联盟类型
type alliancetype       extends     handle
// 预设种族
type racepreference     extends     handle
// 游戏状态
type gamestate          extends     handle
// 游戏整点状态
type igamestate         extends     gamestate
// 游戏浮点状态
type fgamestate         extends     gamestate
// 玩家状态
type playerstate        extends     handle
// 玩家得分
type playerscore        extends     handle
// 玩家游戏结果
type playergameresult   extends     handle
// 单位状态
type unitstate          extends     handle
// AI难度
type aidifficulty       extends     handle

// 事件ID
type eventid            extends     handle
// 游戏事件
type gameevent          extends     eventid
// 玩家事件
type playerevent        extends     eventid
// 玩家单位事件
type playerunitevent    extends     eventid
// 单位事件
type unitevent          extends     eventid
// 比较算符
type limitop            extends     eventid
// 实体/微件事件
type widgetevent        extends     eventid
// 对话框事件
type dialogevent        extends     eventid
// 单位类型
type unittype           extends     handle

// 游戏速度
type gamespeed          extends     handle
// 游戏难度（用于战役，在进入战役前或任务失败后设置）
type gamedifficulty     extends     handle
// 游戏（队伍）类型
type gametype           extends     handle
// 地图参数（部分参数初始值源自房间的玩家设置和高级选项设置）
type mapflag            extends     handle
// 地图可见性
type mapvisibility      extends     handle
// 地图设置
type mapsetting         extends     handle
// 地图密度
type mapdensity         extends     handle
// 玩家控制者类型
type mapcontrol         extends     handle
// 玩家槽状态
type playerslotstate    extends     handle
// 声道
type volumegroup        extends     handle
// 镜头属性
type camerafield        extends     handle
// 镜头
type camerasetup        extends     handle
// 玩家颜色（1.28及以下共12种，1.29及以上共24种，不含中立玩家颜色）
type playercolor        extends     handle
// 出生点放置方式
type placement          extends     handle
// 出生点分布优先权
type startlocprio       extends     handle
// 罕见动画控制
type raritycontrol      extends     handle
// 混合模式
type blendmode          extends     handle
// 纹理贴图标志
type texmapflags        extends     handle
// 特效
type effect             extends     agent
// 特效类型
type effecttype         extends     handle
// 天气特效
type weathereffect      extends     handle
// 地形变形
type terraindeformation extends     handle
// 迷雾状态
type fogstate           extends     handle
// 可见度修整器
type fogmodifier        extends     agent
// 对话框
type dialog             extends     agent
// 按钮
type button             extends     agent
// 任务
type quest              extends     agent
// 任务要求
type questitem          extends     agent
// 任务失败条件
type defeatcondition    extends     agent
// 计时器窗口
type timerdialog        extends     agent
// 排行榜
type leaderboard        extends     agent
// 多面板
type multiboard         extends     agent
// 多面板项目
type multiboarditem     extends     agent
// 可追踪物
type trackable          extends     agent
// 游戏缓存
type gamecache          extends     agent
// 版本（混乱之治 或 冰封王座）
type version            extends     handle
// 物品分类
type itemtype           extends     handle
// 文本标签
type texttag            extends     handle
// 攻击类型
type attacktype         extends     handle
// 伤害类型
type damagetype         extends     handle
// 武器类型
type weapontype         extends     handle
// 音效类型
type soundtype          extends     handle
// 闪电效果
type lightning          extends     handle
// 路径类型
type pathingtype        extends     handle
// 图像
type image              extends     handle
// 地表纹理变化
type ubersplat          extends     handle
// 哈希表
type hashtable          extends     agent

// 转换整数成种族
constant native ConvertRace                 takes integer i returns race
// 转换整数成联盟类型
constant native ConvertAllianceType         takes integer i returns alliancetype
// 转换整数成预设种族
constant native ConvertRacePref             takes integer i returns racepreference
// 转换整数成游戏整点状态
constant native ConvertIGameState           takes integer i returns igamestate
// 转换整数成浮动游戏状态
constant native ConvertFGameState           takes integer i returns fgamestate
// 转换整数成玩家状态
constant native ConvertPlayerState          takes integer i returns playerstate
// 转换整数成玩家得分
constant native ConvertPlayerScore          takes integer i returns playerscore
// 转换整数成玩家游戏结果
constant native ConvertPlayerGameResult     takes integer i returns playergameresult
// 转换整数成单位状态
constant native ConvertUnitState            takes integer i returns unitstate
// 转换整数成AI难度
constant native ConvertAIDifficulty         takes integer i returns aidifficulty
// 转换整数成游戏事件
constant native ConvertGameEvent            takes integer i returns gameevent
// 转换整数成玩家事件
constant native ConvertPlayerEvent          takes integer i returns playerevent
// 转换整数成玩家单位事件
constant native ConvertPlayerUnitEvent      takes integer i returns playerunitevent
// 转换整数成实体/微件事件
constant native ConvertWidgetEvent          takes integer i returns widgetevent
// 转换整数成对话框事件
constant native ConvertDialogEvent          takes integer i returns dialogevent
// 转换整数成单位事件
constant native ConvertUnitEvent            takes integer i returns unitevent
// 转换整数成比较
constant native ConvertLimitOp              takes integer i returns limitop
// 转换整数成单位类型
constant native ConvertUnitType             takes integer i returns unittype
// 转换整数成游戏速度
constant native ConvertGameSpeed            takes integer i returns gamespeed
// 转换整数成出生点放置方式
constant native ConvertPlacement            takes integer i returns placement
// 转换整数成出生点分布优先权
constant native ConvertStartLocPrio         takes integer i returns startlocprio
// 转换整数成游戏难度
constant native ConvertGameDifficulty       takes integer i returns gamedifficulty
// 转换整数成游戏（队伍）类型
constant native ConvertGameType             takes integer i returns gametype
// 转换整数成地图参数
constant native ConvertMapFlag              takes integer i returns mapflag
// 转换整数成地图可见性
constant native ConvertMapVisibility        takes integer i returns mapvisibility
// 转换整数成地图设置
constant native ConvertMapSetting           takes integer i returns mapsetting
// 转换整数成地图密度
constant native ConvertMapDensity           takes integer i returns mapdensity
// 转换整数成玩家控制者类型
constant native ConvertMapControl           takes integer i returns mapcontrol
// 转换整数成玩家颜色
constant native ConvertPlayerColor          takes integer i returns playercolor
// 转换整数成玩家槽状态
constant native ConvertPlayerSlotState      takes integer i returns playerslotstate
// 转换整数成声道
constant native ConvertVolumeGroup          takes integer i returns volumegroup
// 转换整数成镜头属性
constant native ConvertCameraField          takes integer i returns camerafield
// 转换整数成混合模式
constant native ConvertBlendMode            takes integer i returns blendmode
// 转换整数成罕见动画控制
constant native ConvertRarityControl        takes integer i returns raritycontrol
// 转换整数成纹理贴图标志
constant native ConvertTexMapFlags          takes integer i returns texmapflags
// 转换整数成迷雾状态
constant native ConvertFogState             takes integer i returns fogstate
// 转换整数成特效类型
constant native ConvertEffectType           takes integer i returns effecttype
// 转换整数成版本
constant native ConvertVersion              takes integer i returns version
// 转换整数成物品分类
constant native ConvertItemType             takes integer i returns itemtype
// 转换整数成攻击类型
constant native ConvertAttackType           takes integer i returns attacktype
// 转换整数成伤害类型
constant native ConvertDamageType           takes integer i returns damagetype
// 转换整数成武器类型
constant native ConvertWeaponType           takes integer i returns weapontype
// 转换整数成音效类型
constant native ConvertSoundType            takes integer i returns soundtype
// 转换整数成路径类型
constant native ConvertPathingType          takes integer i returns pathingtype

// 转换命令字符串成命令ID
constant native OrderId                     takes string  orderIdString     returns integer
// 转换命令ID成命令字符串
constant native OrderId2String              takes integer orderId           returns string
// 转换单位类型字符串成单位类型
//@ nodiscard 1
constant native UnitId                      takes string  unitIdString      returns integer
// 转换单位类型成单位类型字符串
constant native UnitId2String               takes integer unitId            returns string

// Not currently working correctly...
// 转换技能ID字符串成技能ID   Not currently working correctly...
//@ nodiscard 1
constant native AbilityId                   takes string  abilityIdString   returns integer
// 转换技能ID成技能ID字符串
constant native AbilityId2String            takes integer abilityId         returns string

// Looks up the "name" field for any object (unit, item, ability)
// 获取对象(单位、物品、技能等任何对象)名称(字符串) [C]
// 名称为英语，未本地化
// 在AI脚本返回值为 null
//@ desync danger 1
constant native GetObjectName               takes integer objectId          returns string

globals

//===================================================
// Game Constants    
//===================================================

    // pfff
    // 假 false
    constant boolean            FALSE                           = false
    // 真 true
    constant boolean            TRUE                            = true
    // 数组上限，默认值32768
    // 1.28及以下版本默认值为8192
    constant integer            JASS_MAX_ARRAY_SIZE             = 8192

    // 中立被动玩家，1.28及以下是玩家16，1.29及以上是玩家28
    // 其他：中立敌对(玩家13/25)，中立受害(玩家14/26)，中立特殊(玩家15/27)
    // 不随地图12/24人自动变化（以保存地图的编辑器版本为准），即在1.29或以上版本运行低版本编辑器制作的地图时，该值仍是12
    // 在低版本编辑器打开1.29或以上版本编辑器保存的地图时(如能打开)，中立玩家的单位会全部消失，需手动在物体管理器重设所属玩家，否则在游戏中(如能运行)这些单位也会消失
    constant integer            PLAYER_NEUTRAL_PASSIVE          = 15
    // 中立敌对玩家，1.28及以下是玩家13，1.29及以上是玩家25
    // 其他：中立受害(玩家14/26)，中立特殊(玩家15/27)，中立被动(玩家16/28)
    // 不随地图12/24人自动变化（以保存地图的编辑器版本为准），即在1.29或以上版本运行低版本编辑器制作的地图时，该值仍是12
    // 在低版本编辑器打开1.29或以上版本编辑器保存的地图时(如能打开)，中立玩家的单位会全部消失，需手动在物体管理器重设所属玩家，否则在游戏中(如能运行)这些单位也会消失
    constant integer            PLAYER_NEUTRAL_AGGRESSIVE       = 12

    // 玩家颜色 红色
    // 代码：|CffFF0000|r , 三色值： 255, 3, 3
    constant playercolor        PLAYER_COLOR_RED                = ConvertPlayerColor(0)
    // 玩家颜色 蓝色
    // 代码：|Cff0064FF|r , 三色值：0, 66, 255
    constant playercolor        PLAYER_COLOR_BLUE               = ConvertPlayerColor(1)
    // 玩家颜色 青色
    // 代码：|Cff1BE7BA|r , 三色值：28, 230, 185
    constant playercolor        PLAYER_COLOR_CYAN               = ConvertPlayerColor(2)
    // 玩家颜色 紫色
    // 代码：|Cff550081|r , 三色值：84, 0, 129
    constant playercolor        PLAYER_COLOR_PURPLE             = ConvertPlayerColor(3)
    // 玩家颜色 黄色
    // 代码：|CffFFFC00|r , 三色值：255, 252, 0
    constant playercolor        PLAYER_COLOR_YELLOW             = ConvertPlayerColor(4)
    // 玩家颜色 橙色
    // 代码：|CffFF8A0D|r , 三色值：254, 138, 14
    constant playercolor        PLAYER_COLOR_ORANGE             = ConvertPlayerColor(5)
    // 玩家颜色 绿色
    // 代码：|Cff21BF00|r , 三色值：32, 192, 0
    constant playercolor        PLAYER_COLOR_GREEN              = ConvertPlayerColor(6)
    // 玩家颜色 粉色
    // 代码：|CffE45CAF|r , 三色值：229, 91, 176
    constant playercolor        PLAYER_COLOR_PINK               = ConvertPlayerColor(7)
    // 玩家颜色 深灰色
    // 代码：|Cff949696|r , 三色值：149, 150, 151
    constant playercolor        PLAYER_COLOR_LIGHT_GRAY         = ConvertPlayerColor(8)
    // 玩家颜色 深蓝色
    // 代码：|Cff7EBFF1|r , 三色值：126, 191, 241
    constant playercolor        PLAYER_COLOR_LIGHT_BLUE         = ConvertPlayerColor(9)
    // 玩家颜色 浅绿色
    // 代码：|Cff106247|r , 三色值：16, 98, 70
    constant playercolor        PLAYER_COLOR_AQUA               = ConvertPlayerColor(10)
    // 玩家颜色 棕色
    // 代码：|Cff4F2B05|r , 三色值：78, 42, 3
    constant playercolor        PLAYER_COLOR_BROWN              = ConvertPlayerColor(11)

    // 种族 人类
    constant race               RACE_HUMAN                      = ConvertRace(1)
    // 种族 兽人
    constant race               RACE_ORC                        = ConvertRace(2)
    // 种族 天灾亡灵/不死
    constant race               RACE_UNDEAD                     = ConvertRace(3)
    // 种族 暗夜精灵
    constant race               RACE_NIGHTELF                   = ConvertRace(4)
    // 种族 恶魔族
    constant race               RACE_DEMON                      = ConvertRace(5)
    // 种族 其他
    constant race               RACE_OTHER                      = ConvertRace(7)

    // 玩家游戏结果 胜利
    constant playergameresult   PLAYER_GAME_RESULT_VICTORY      = ConvertPlayerGameResult(0)
    // 玩家游戏结果 失败
    constant playergameresult   PLAYER_GAME_RESULT_DEFEAT       = ConvertPlayerGameResult(1)
    // 玩家游戏结果 平局
    constant playergameresult   PLAYER_GAME_RESULT_TIE          = ConvertPlayerGameResult(2)
    // 玩家游戏结果 不确定
    constant playergameresult   PLAYER_GAME_RESULT_NEUTRAL      = ConvertPlayerGameResult(3)

    // 联盟类型 被动联盟(联盟不侵犯)
    constant alliancetype       ALLIANCE_PASSIVE                = ConvertAllianceType(0)
    // 联盟类型 救援请求
    constant alliancetype       ALLIANCE_HELP_REQUEST           = ConvertAllianceType(1)
    // 联盟类型 响应救援请求（救援回应）
    constant alliancetype       ALLIANCE_HELP_RESPONSE          = ConvertAllianceType(2)
    // 联盟类型 共享经验值
    constant alliancetype       ALLIANCE_SHARED_XP              = ConvertAllianceType(3)
    // 联盟类型 盟友魔法锁定
    constant alliancetype       ALLIANCE_SHARED_SPELLS          = ConvertAllianceType(4)
    // 联盟类型 共享视野
    constant alliancetype       ALLIANCE_SHARED_VISION          = ConvertAllianceType(5)
    // 联盟类型 共享单位（控制）
    constant alliancetype       ALLIANCE_SHARED_CONTROL         = ConvertAllianceType(6)
    // 联盟类型 完全共享单位控制
    constant alliancetype       ALLIANCE_SHARED_ADVANCED_CONTROL= ConvertAllianceType(7)
    // 联盟类型 可营救
    constant alliancetype       ALLIANCE_RESCUABLE              = ConvertAllianceType(8)
    // 联盟类型 强制共享视野
    constant alliancetype       ALLIANCE_SHARED_VISION_FORCED   = ConvertAllianceType(9)

    // 游戏版本 混乱之治
    constant version            VERSION_REIGN_OF_CHAOS          = ConvertVersion(0)
    // 游戏版本 冰封王座
    constant version            VERSION_FROZEN_THRONE           = ConvertVersion(1)

    // 攻击类型 法术
    constant attacktype         ATTACK_TYPE_NORMAL              = ConvertAttackType(0)
    // 攻击类型 普通
    constant attacktype         ATTACK_TYPE_MELEE               = ConvertAttackType(1)
    // 攻击类型 穿刺
    constant attacktype         ATTACK_TYPE_PIERCE              = ConvertAttackType(2)
    // 攻击类型 攻城
    constant attacktype         ATTACK_TYPE_SIEGE               = ConvertAttackType(3)
    // 攻击类型 魔法
    constant attacktype         ATTACK_TYPE_MAGIC               = ConvertAttackType(4)
    // 攻击类型 混乱
    constant attacktype         ATTACK_TYPE_CHAOS               = ConvertAttackType(5)
    // 攻击类型 英雄
    constant attacktype         ATTACK_TYPE_HERO                = ConvertAttackType(6)

    // 伤害类型 未知
    constant damagetype         DAMAGE_TYPE_UNKNOWN             = ConvertDamageType(0)
    // 伤害类型 普通
    constant damagetype         DAMAGE_TYPE_NORMAL              = ConvertDamageType(4)
    // 伤害类型 强化
    constant damagetype         DAMAGE_TYPE_ENHANCED            = ConvertDamageType(5)
    // 伤害类型 火焰
    constant damagetype         DAMAGE_TYPE_FIRE                = ConvertDamageType(8)
    // 伤害类型 冰冻
    constant damagetype         DAMAGE_TYPE_COLD                = ConvertDamageType(9)
    // 伤害类型 闪电
    constant damagetype         DAMAGE_TYPE_LIGHTNING           = ConvertDamageType(10)
    // 伤害类型 毒药
    constant damagetype         DAMAGE_TYPE_POISON              = ConvertDamageType(11)
    // 伤害类型 疾病
    constant damagetype         DAMAGE_TYPE_DISEASE             = ConvertDamageType(12)
    // 伤害类型 神圣
    constant damagetype         DAMAGE_TYPE_DIVINE              = ConvertDamageType(13)
    // 伤害类型 魔法
    constant damagetype         DAMAGE_TYPE_MAGIC               = ConvertDamageType(14)
    // 伤害类型 音速
    constant damagetype         DAMAGE_TYPE_SONIC               = ConvertDamageType(15)
    // 伤害类型 酸性
    constant damagetype         DAMAGE_TYPE_ACID                = ConvertDamageType(16)
    // 伤害类型 力量
    constant damagetype         DAMAGE_TYPE_FORCE               = ConvertDamageType(17)
    // 伤害类型 死亡
    constant damagetype         DAMAGE_TYPE_DEATH               = ConvertDamageType(18)
    // 伤害类型 精神
    constant damagetype         DAMAGE_TYPE_MIND                = ConvertDamageType(19)
    // 伤害类型 植物
    constant damagetype         DAMAGE_TYPE_PLANT               = ConvertDamageType(20)
    // 伤害类型 防御
    constant damagetype         DAMAGE_TYPE_DEFENSIVE           = ConvertDamageType(21)
    // 伤害类型 破坏
    constant damagetype         DAMAGE_TYPE_DEMOLITION          = ConvertDamageType(22)
    // 伤害类型 慢性毒药
    constant damagetype         DAMAGE_TYPE_SLOW_POISON         = ConvertDamageType(23)
    // 伤害类型 灵魂锁链
    constant damagetype         DAMAGE_TYPE_SPIRIT_LINK         = ConvertDamageType(24)
    // 伤害类型 暗影突袭
    constant damagetype         DAMAGE_TYPE_SHADOW_STRIKE       = ConvertDamageType(25)
    // 伤害类型 通用
    constant damagetype         DAMAGE_TYPE_UNIVERSAL           = ConvertDamageType(26)

    // 武器声音 无
    constant weapontype         WEAPON_TYPE_WHOKNOWS            = ConvertWeaponType(0)
    // 武器声音 金属轻砍
    constant weapontype         WEAPON_TYPE_METAL_LIGHT_CHOP    = ConvertWeaponType(1)
    // 武器声音 金属中砍
    constant weapontype         WEAPON_TYPE_METAL_MEDIUM_CHOP   = ConvertWeaponType(2)
    // 武器声音 金属重砍
    constant weapontype         WEAPON_TYPE_METAL_HEAVY_CHOP    = ConvertWeaponType(3)
    // 武器声音 金属轻切
    constant weapontype         WEAPON_TYPE_METAL_LIGHT_SLICE   = ConvertWeaponType(4)
    // 武器声音 金属中切
    constant weapontype         WEAPON_TYPE_METAL_MEDIUM_SLICE  = ConvertWeaponType(5)
    // 武器声音 金属重切
    constant weapontype         WEAPON_TYPE_METAL_HEAVY_SLICE   = ConvertWeaponType(6)
    // 武器声音 金属中击
    constant weapontype         WEAPON_TYPE_METAL_MEDIUM_BASH   = ConvertWeaponType(7)
    // 武器声音 金属重击
    constant weapontype         WEAPON_TYPE_METAL_HEAVY_BASH    = ConvertWeaponType(8)
    // 武器声音 金属中刺
    constant weapontype         WEAPON_TYPE_METAL_MEDIUM_STAB   = ConvertWeaponType(9)
    // 武器声音 金属重刺
    constant weapontype         WEAPON_TYPE_METAL_HEAVY_STAB    = ConvertWeaponType(10)
    // 武器声音 木头轻切
    constant weapontype         WEAPON_TYPE_WOOD_LIGHT_SLICE    = ConvertWeaponType(11)
    // 武器声音 木头中切
    constant weapontype         WEAPON_TYPE_WOOD_MEDIUM_SLICE   = ConvertWeaponType(12)
    // 武器声音 木头重切
    constant weapontype         WEAPON_TYPE_WOOD_HEAVY_SLICE    = ConvertWeaponType(13)
    // 武器声音 木头轻击
    constant weapontype         WEAPON_TYPE_WOOD_LIGHT_BASH     = ConvertWeaponType(14)
    // 武器声音 木头中击
    constant weapontype         WEAPON_TYPE_WOOD_MEDIUM_BASH    = ConvertWeaponType(15)
    // 武器声音 木头重击
    constant weapontype         WEAPON_TYPE_WOOD_HEAVY_BASH     = ConvertWeaponType(16)
    // 武器声音 木头轻刺
    constant weapontype         WEAPON_TYPE_WOOD_LIGHT_STAB     = ConvertWeaponType(17)
    // 武器声音 木头中刺
    constant weapontype         WEAPON_TYPE_WOOD_MEDIUM_STAB    = ConvertWeaponType(18)
    // 武器声音 利爪轻切
    constant weapontype         WEAPON_TYPE_CLAW_LIGHT_SLICE    = ConvertWeaponType(19)
    // 武器声音 利爪中切
    constant weapontype         WEAPON_TYPE_CLAW_MEDIUM_SLICE   = ConvertWeaponType(20)
    // 武器声音 利爪重切
    constant weapontype         WEAPON_TYPE_CLAW_HEAVY_SLICE    = ConvertWeaponType(21)
    // 武器声音 斧头中砍
    constant weapontype         WEAPON_TYPE_AXE_MEDIUM_CHOP     = ConvertWeaponType(22)
    // 武器声音 岩石重击
    constant weapontype         WEAPON_TYPE_ROCK_HEAVY_BASH     = ConvertWeaponType(23)

    // 路径类型 任何
    constant pathingtype        PATHING_TYPE_ANY                = ConvertPathingType(0)
    // 路径类型 可通行地面
    constant pathingtype        PATHING_TYPE_WALKABILITY        = ConvertPathingType(1)
    // 路径类型 空中单位可通行
    constant pathingtype        PATHING_TYPE_FLYABILITY         = ConvertPathingType(2)
    // 路径类型 可建造地面
    constant pathingtype        PATHING_TYPE_BUILDABILITY       = ConvertPathingType(3)
    // 路径类型 任何采集工人可通行
    constant pathingtype        PATHING_TYPE_PEONHARVESTPATHING = ConvertPathingType(4)
    // 路径类型 荒芜地表
    constant pathingtype        PATHING_TYPE_BLIGHTPATHING      = ConvertPathingType(5)
    // 路径类型 可通行海面
    constant pathingtype        PATHING_TYPE_FLOATABILITY       = ConvertPathingType(6)
    // 路径类型 两栖单位可通行
    constant pathingtype        PATHING_TYPE_AMPHIBIOUSPATHING  = ConvertPathingType(7)

//===================================================
// Map Setup Constants    
//===================================================

    // 预设种族 人类
    constant racepreference     RACE_PREF_HUMAN                     = ConvertRacePref(1)
    // 预设种族 兽人
    constant racepreference     RACE_PREF_ORC                       = ConvertRacePref(2)
    // 预设种族 暗夜精灵
    constant racepreference     RACE_PREF_NIGHTELF                  = ConvertRacePref(4)
    // 预设种族 天灾亡灵/不死
    constant racepreference     RACE_PREF_UNDEAD                    = ConvertRacePref(8)
    // 预设种族 恶魔
    constant racepreference     RACE_PREF_DEMON                     = ConvertRacePref(16)
    // 预设种族 随机
    constant racepreference     RACE_PREF_RANDOM                    = ConvertRacePref(32)
    // 预设种族 用户可选择
    constant racepreference     RACE_PREF_USER_SELECTABLE           = ConvertRacePref(64)

    // 玩家控制者类型 用户
    // 默认值在情节-玩家设置编辑，游戏初始化时会按房间的玩家使用情况(槽位是否有打开/无玩家，玩家是电脑还是用户)再次设置
    constant mapcontrol         MAP_CONTROL_USER                    = ConvertMapControl(0)
    // 玩家控制者类型 电脑
    // 默认值在情节-玩家设置编辑，游戏初始化时会按房间的玩家使用情况(槽位是否有打开/无玩家，玩家是电脑还是用户)再次设置
    constant mapcontrol         MAP_CONTROL_COMPUTER                = ConvertMapControl(1)
    // 玩家控制者类型 中立可营救
    constant mapcontrol         MAP_CONTROL_RESCUABLE               = ConvertMapControl(2)
    // 玩家控制者类型 中立被动
    constant mapcontrol         MAP_CONTROL_NEUTRAL                 = ConvertMapControl(3)
    // 玩家控制者类型 中立敌对
    constant mapcontrol         MAP_CONTROL_CREEP                   = ConvertMapControl(4)
    // 玩家控制者类型 没有玩家
    // 默认值在情节-玩家设置编辑，游戏初始化时会按房间的玩家使用情况(槽位是否有打开/无玩家，玩家是电脑还是用户)再次设置
    constant mapcontrol         MAP_CONTROL_NONE                    = ConvertMapControl(5)

    // 游戏（队伍）类型 对战
    constant gametype           GAME_TYPE_MELEE                     = ConvertGameType(1)
    // 游戏（队伍）类型 自由竞赛/混战
    constant gametype           GAME_TYPE_FFA                       = ConvertGameType(2)
    // 游戏（队伍）类型 使用地图设置
    constant gametype           GAME_TYPE_USE_MAP_SETTINGS          = ConvertGameType(4)
    // 游戏（队伍）类型 官方地图设置
    constant gametype           GAME_TYPE_BLIZ                      = ConvertGameType(8)
    // 游戏（队伍）类型 1 V 1
    constant gametype           GAME_TYPE_ONE_ON_ONE                = ConvertGameType(16)
    // 游戏（队伍）类型 2支队伍竞赛
    constant gametype           GAME_TYPE_TWO_TEAM_PLAY             = ConvertGameType(32)
    // 游戏（队伍）类型 3支队伍竞赛
    constant gametype           GAME_TYPE_THREE_TEAM_PLAY           = ConvertGameType(64)
    // 游戏（队伍）类型 4支队伍竞赛
    constant gametype           GAME_TYPE_FOUR_TEAM_PLAY            = ConvertGameType(128)

    // 地图参数 隐藏地形
    constant mapflag            MAP_FOG_HIDE_TERRAIN                = ConvertMapFlag(1)
    // 地图参数 已探索地图/可见地形
    constant mapflag            MAP_FOG_MAP_EXPLORED                = ConvertMapFlag(2)
    // 地图参数 始终可见
    constant mapflag            MAP_FOG_ALWAYS_VISIBLE              = ConvertMapFlag(4)

    // 地图参数 使用生命障碍
    constant mapflag            MAP_USE_HANDICAPS                   = ConvertMapFlag(8)
    // 地图参数 裁判/观战者
    constant mapflag            MAP_OBSERVERS                       = ConvertMapFlag(16)
    // 地图参数 战败后成为观战者
    constant mapflag            MAP_OBSERVERS_ON_DEATH              = ConvertMapFlag(32)

    // 地图参数 固定玩家颜色
    constant mapflag            MAP_FIXED_COLORS                    = ConvertMapFlag(128)
    
    // 地图参数 锁定交易资源（禁止交易）
    constant mapflag            MAP_LOCK_RESOURCE_TRADING           = ConvertMapFlag(256)
    // 地图参数 限制盟友资源交易
    constant mapflag            MAP_RESOURCE_TRADING_ALLIES_ONLY    = ConvertMapFlag(512)

    // 地图参数 锁定联盟设置（禁止更改）
    constant mapflag            MAP_LOCK_ALLIANCE_CHANGES           = ConvertMapFlag(1024)
    // 地图参数 隐藏联盟类型变更
    constant mapflag            MAP_ALLIANCE_CHANGES_HIDDEN         = ConvertMapFlag(2048)

    // 地图参数 作弊码
    constant mapflag            MAP_CHEATS                          = ConvertMapFlag(4096)
    // 地图参数 隐藏作弊码
    constant mapflag            MAP_CHEATS_HIDDEN                   = ConvertMapFlag(8192)

    // 地图参数 锁定游戏速度
    constant mapflag            MAP_LOCK_SPEED                      = ConvertMapFlag(8192*2)
    // 地图参数 禁止随机游戏速度
    constant mapflag            MAP_LOCK_RANDOM_SEED                = ConvertMapFlag(8192*4)
    // 地图参数 共享高级控制
    constant mapflag            MAP_SHARED_ADVANCED_CONTROL         = ConvertMapFlag(8192*8)
    // 地图参数 使用随机英雄
    constant mapflag            MAP_RANDOM_HERO                     = ConvertMapFlag(8192*16)
    // 地图参数 使用随机种族
    constant mapflag            MAP_RANDOM_RACES                    = ConvertMapFlag(8192*32)
    // 地图参数 地图转换（加载新地图）
    constant mapflag            MAP_RELOADED                        = ConvertMapFlag(8192*64)

    // 出生点放置方式 随机玩家出生点
    constant placement          MAP_PLACEMENT_RANDOM                = ConvertPlacement(0)   // random among all slots
    // 出生点放置方式 固定玩家出生点
    constant placement          MAP_PLACEMENT_FIXED                 = ConvertPlacement(1)   // player 0 in start loc 0...
    // 出生点放置方式 使用地图设置的玩家出生点
    constant placement          MAP_PLACEMENT_USE_MAP_SETTINGS      = ConvertPlacement(2)   // whatever was specified by the script
    // 出生点放置方式 同队出生点相邻
    constant placement          MAP_PLACEMENT_TEAMS_TOGETHER        = ConvertPlacement(3)   // random with allies next to each other    

    // 出生点分布优先权 低
    constant startlocprio       MAP_LOC_PRIO_LOW                    = ConvertStartLocPrio(0)
    // 出生点分布优先权 高
    constant startlocprio       MAP_LOC_PRIO_HIGH                   = ConvertStartLocPrio(1)
    // 出生点分布优先权 无
    constant startlocprio       MAP_LOC_PRIO_NOT                    = ConvertStartLocPrio(2)

    // 地图密度 无密度
    constant mapdensity         MAP_DENSITY_NONE                    = ConvertMapDensity(0)
    // 地图密度 低密度
    constant mapdensity         MAP_DENSITY_LIGHT                   = ConvertMapDensity(1)
    // 地图密度 中等密度
    constant mapdensity         MAP_DENSITY_MEDIUM                  = ConvertMapDensity(2)
    // 地图密度 高密度
    constant mapdensity         MAP_DENSITY_HEAVY                   = ConvertMapDensity(3)

    // 游戏难度 简单
    constant gamedifficulty     MAP_DIFFICULTY_EASY                 = ConvertGameDifficulty(0)
    // 游戏难度 普通
    constant gamedifficulty     MAP_DIFFICULTY_NORMAL               = ConvertGameDifficulty(1)
    // 游戏难度 困难
    constant gamedifficulty     MAP_DIFFICULTY_HARD                 = ConvertGameDifficulty(2)
    // 游戏难度 疯狂
    constant gamedifficulty     MAP_DIFFICULTY_INSANE               = ConvertGameDifficulty(3)

    // 游戏速度 最慢速
    constant gamespeed          MAP_SPEED_SLOWEST                   = ConvertGameSpeed(0)
    // 游戏速度 慢速
    constant gamespeed          MAP_SPEED_SLOW                      = ConvertGameSpeed(1)
    // 游戏速度 正常
    constant gamespeed          MAP_SPEED_NORMAL                    = ConvertGameSpeed(2)
    // 游戏速度 快速
    constant gamespeed          MAP_SPEED_FAST                      = ConvertGameSpeed(3)
    // 游戏速度 最快速
    constant gamespeed          MAP_SPEED_FASTEST                   = ConvertGameSpeed(4)

    // 玩家槽状态 没有玩家使用
    constant playerslotstate    PLAYER_SLOT_STATE_EMPTY             = ConvertPlayerSlotState(0)
    // 玩家槽状态 玩家正在游戏
    constant playerslotstate    PLAYER_SLOT_STATE_PLAYING           = ConvertPlayerSlotState(1)
    // 玩家槽状态 玩家已离开游戏
    constant playerslotstate    PLAYER_SLOT_STATE_LEFT              = ConvertPlayerSlotState(2)

//===================================================
// Sound Constants
//===================================================
    // 声道 单位移动音效
    constant volumegroup        SOUND_VOLUMEGROUP_UNITMOVEMENT      = ConvertVolumeGroup(0)
    // 声道 单位响应音效
    constant volumegroup        SOUND_VOLUMEGROUP_UNITSOUNDS        = ConvertVolumeGroup(1)
    // 声道 战斗音效
    constant volumegroup        SOUND_VOLUMEGROUP_COMBAT            = ConvertVolumeGroup(2)
    // 声道 动画和法术音效
    constant volumegroup        SOUND_VOLUMEGROUP_SPELLS            = ConvertVolumeGroup(3)
    // 声道 用户界面(UI)音效
    constant volumegroup        SOUND_VOLUMEGROUP_UI                = ConvertVolumeGroup(4)
    // 声道 音乐
    constant volumegroup        SOUND_VOLUMEGROUP_MUSIC             = ConvertVolumeGroup(5)
    // 声道 场景配音
    constant volumegroup        SOUND_VOLUMEGROUP_AMBIENTSOUNDS     = ConvertVolumeGroup(6)
    // 声道 火焰音效
    constant volumegroup        SOUND_VOLUMEGROUP_FIRE              = ConvertVolumeGroup(7)


//===================================================
// Game, Player, and Unit States
//
// For use with TriggerRegister<X>StateEvent
//
//===================================================

    // 游戏整点状态 神圣干涉
    constant igamestate GAME_STATE_DIVINE_INTERVENTION          = ConvertIGameState(0)
    // 游戏整点状态 断开连接
    constant igamestate GAME_STATE_DISCONNECTED                 = ConvertIGameState(1)
    // 游戏浮点状态 当前时间
    constant fgamestate GAME_STATE_TIME_OF_DAY                  = ConvertFGameState(2)

    // 玩家状态 游戏得分
    constant playerstate PLAYER_STATE_GAME_RESULT               = ConvertPlayerState(0)

    // current resource levels
    //
    // 玩家状态 现有黄金量
    constant playerstate PLAYER_STATE_RESOURCE_GOLD             = ConvertPlayerState(1)
    // 玩家状态 现有木材量
    constant playerstate PLAYER_STATE_RESOURCE_LUMBER           = ConvertPlayerState(2)
    // 玩家状态 剩余可用英雄数
    constant playerstate PLAYER_STATE_RESOURCE_HERO_TOKENS      = ConvertPlayerState(3)
    // 玩家状态 可用人口数(默认为人口建筑提供的数量)
    constant playerstate PLAYER_STATE_RESOURCE_FOOD_CAP         = ConvertPlayerState(4)
    // 玩家状态 已使用人口数
    constant playerstate PLAYER_STATE_RESOURCE_FOOD_USED        = ConvertPlayerState(5)
    // 玩家状态 最大人口上限(平衡常数或触发限制的最大数量)，默认为100
    constant playerstate PLAYER_STATE_FOOD_CAP_CEILING          = ConvertPlayerState(6)

    // 玩家状态 给予奖励
    constant playerstate PLAYER_STATE_GIVES_BOUNTY              = ConvertPlayerState(7)
    // 玩家状态 联盟胜利
    constant playerstate PLAYER_STATE_ALLIED_VICTORY            = ConvertPlayerState(8)
    // 玩家状态 放置
    constant playerstate PLAYER_STATE_PLACED                    = ConvertPlayerState(9)
    // 玩家状态 战败后成为观战者
    constant playerstate PLAYER_STATE_OBSERVER_ON_DEATH         = ConvertPlayerState(10)
    // 玩家状态 裁判或观战者
    constant playerstate PLAYER_STATE_OBSERVER                  = ConvertPlayerState(11)
    // 玩家状态 不可跟随
    constant playerstate PLAYER_STATE_UNFOLLOWABLE              = ConvertPlayerState(12)

    // taxation rate for each resource
    //
    // 玩家状态 黄金维修费率
    constant playerstate PLAYER_STATE_GOLD_UPKEEP_RATE          = ConvertPlayerState(13)
    // 玩家状态 木材维修费率
    constant playerstate PLAYER_STATE_LUMBER_UPKEEP_RATE        = ConvertPlayerState(14)

    // cumulative resources collected by the player during the mission
    //
    // 玩家状态 总金钱采集量
    constant playerstate PLAYER_STATE_GOLD_GATHERED             = ConvertPlayerState(15)
    // 玩家状态 总木材采集量
    constant playerstate PLAYER_STATE_LUMBER_GATHERED           = ConvertPlayerState(16)

    // 玩家状态 中立敌对玩家单位睡眠
    constant playerstate PLAYER_STATE_NO_CREEP_SLEEP            = ConvertPlayerState(25)

    // 单位状态 单位当前生命值
    constant unitstate UNIT_STATE_LIFE                          = ConvertUnitState(0)
    // 单位状态 单位最大生命值
    constant unitstate UNIT_STATE_MAX_LIFE                      = ConvertUnitState(1)
    // 单位状态 单位当前法力值
    constant unitstate UNIT_STATE_MANA                          = ConvertUnitState(2)
    // 单位状态 单位最大法力值
    constant unitstate UNIT_STATE_MAX_MANA                      = ConvertUnitState(3)

    // AI难度 简单
    constant aidifficulty AI_DIFFICULTY_NEWBIE                  = ConvertAIDifficulty(0)
    // AI难度 普通
    constant aidifficulty AI_DIFFICULTY_NORMAL                  = ConvertAIDifficulty(1)
    // AI难度 困难
    constant aidifficulty AI_DIFFICULTY_INSANE                  = ConvertAIDifficulty(2)

    // player score values
    // 玩家得分 训练单位数量 player score values
    constant playerscore PLAYER_SCORE_UNITS_TRAINED             = ConvertPlayerScore(0)
    // 玩家得分 消灭单位数量
    constant playerscore PLAYER_SCORE_UNITS_KILLED              = ConvertPlayerScore(1)
    // 玩家得分 已建造建筑数量
    constant playerscore PLAYER_SCORE_STRUCT_BUILT              = ConvertPlayerScore(2)
    // 玩家得分 被毁建筑数量
    constant playerscore PLAYER_SCORE_STRUCT_RAZED              = ConvertPlayerScore(3)
    // 玩家得分 科技百分比
    constant playerscore PLAYER_SCORE_TECH_PERCENT              = ConvertPlayerScore(4)
    // 玩家得分 最大可用人口数量
    constant playerscore PLAYER_SCORE_FOOD_MAXPROD              = ConvertPlayerScore(5)
    // 玩家得分 最大使用人口数量
    constant playerscore PLAYER_SCORE_FOOD_MAXUSED              = ConvertPlayerScore(6)
    // 玩家得分 杀死英雄数量
    constant playerscore PLAYER_SCORE_HEROES_KILLED             = ConvertPlayerScore(7)
    // 玩家得分 获得物品数量
    constant playerscore PLAYER_SCORE_ITEMS_GAINED              = ConvertPlayerScore(8)
    // 玩家得分 购买雇佣兵数量
    constant playerscore PLAYER_SCORE_MERCS_HIRED               = ConvertPlayerScore(9)
    // 玩家得分 采集到的黄金数量(全部)
    constant playerscore PLAYER_SCORE_GOLD_MINED_TOTAL          = ConvertPlayerScore(10)
    // 玩家得分 采集到的黄金数量(维修费生效期间采集的)
    constant playerscore PLAYER_SCORE_GOLD_MINED_UPKEEP         = ConvertPlayerScore(11)
    // 玩家得分 由于维修费而损失的黄金数量
    constant playerscore PLAYER_SCORE_GOLD_LOST_UPKEEP          = ConvertPlayerScore(12)
    // 玩家得分 由于纳税损失的黄金数量
    constant playerscore PLAYER_SCORE_GOLD_LOST_TAX             = ConvertPlayerScore(13)
    // 玩家得分 给予盟友的黄金数量
    constant playerscore PLAYER_SCORE_GOLD_GIVEN                = ConvertPlayerScore(14)
    // 玩家得分 从盟友那收到的黄金数量
    constant playerscore PLAYER_SCORE_GOLD_RECEIVED             = ConvertPlayerScore(15)
    // 玩家得分 采集到的木材数量
    constant playerscore PLAYER_SCORE_LUMBER_TOTAL              = ConvertPlayerScore(16)
    // 玩家得分 由于维修费而损失的木材数量
    constant playerscore PLAYER_SCORE_LUMBER_LOST_UPKEEP        = ConvertPlayerScore(17)
    // 玩家得分 由于纳税损失的木材数量
    constant playerscore PLAYER_SCORE_LUMBER_LOST_TAX           = ConvertPlayerScore(18)
    // 玩家得分 给予盟友的木材数量
    constant playerscore PLAYER_SCORE_LUMBER_GIVEN              = ConvertPlayerScore(19)
    // 玩家得分 从盟友那收到的木材数量
    constant playerscore PLAYER_SCORE_LUMBER_RECEIVED           = ConvertPlayerScore(20)
    // 玩家得分 总的单位得分
    constant playerscore PLAYER_SCORE_UNIT_TOTAL                = ConvertPlayerScore(21)
    // 玩家得分 总的英雄得分
    constant playerscore PLAYER_SCORE_HERO_TOTAL                = ConvertPlayerScore(22)
    // 玩家得分 总的资源得分
    constant playerscore PLAYER_SCORE_RESOURCE_TOTAL            = ConvertPlayerScore(23)
    // 玩家得分 总的整体得分
    constant playerscore PLAYER_SCORE_TOTAL                     = ConvertPlayerScore(24)
        
//===================================================
// Game, Player and Unit Events
//
//  When an event causes a trigger to fire these
//  values allow the action code to determine which
//  event was dispatched and therefore which set of
//  native functions should be used to get information
//  about the event.
//
// Do NOT change the order or value of these constants
// without insuring that the JASS_GAME_EVENTS_WAR3 enum
// is changed to match.
//
//===================================================

    //===================================================
    // For use with TriggerRegisterGameEvent    
    //===================================================    

    // 游戏事件 游戏胜利
    constant gameevent EVENT_GAME_VICTORY                       = ConvertGameEvent(0)
    // 游戏事件 游戏本关结束
    constant gameevent EVENT_GAME_END_LEVEL                     = ConvertGameEvent(1)

    // 游戏事件 游戏变量变更
    constant gameevent EVENT_GAME_VARIABLE_LIMIT                = ConvertGameEvent(2)
    // 游戏事件 游戏状态变更
    constant gameevent EVENT_GAME_STATE_LIMIT                   = ConvertGameEvent(3)   

    // 游戏事件 游戏超时
    constant gameevent EVENT_GAME_TIMER_EXPIRED                 = ConvertGameEvent(4)

    // 游戏事件 进入区域
    constant gameevent EVENT_GAME_ENTER_REGION                  = ConvertGameEvent(5)
    // 游戏事件 离开区域
    constant gameevent EVENT_GAME_LEAVE_REGION                  = ConvertGameEvent(6)

    // 游戏事件 鼠标点击可追踪物
    constant gameevent EVENT_GAME_TRACKABLE_HIT                 = ConvertGameEvent(7)
    // 游戏事件 鼠标移动到可追踪物
    constant gameevent EVENT_GAME_TRACKABLE_TRACK               = ConvertGameEvent(8)

    // 游戏事件 显示技能
    constant gameevent EVENT_GAME_SHOW_SKILL                    = ConvertGameEvent(9)    
    // 游戏事件 创建子菜单
    constant gameevent EVENT_GAME_BUILD_SUBMENU                 = ConvertGameEvent(10)

    //===================================================
    // For use with TriggerRegisterPlayerEvent
    //===================================================
    // 玩家事件 玩家状态变更
    constant playerevent EVENT_PLAYER_STATE_LIMIT               = ConvertPlayerEvent(11)
    // 玩家事件 玩家联盟类型变更
    constant playerevent EVENT_PLAYER_ALLIANCE_CHANGED          = ConvertPlayerEvent(12)

    // 玩家事件 玩家失败
    constant playerevent EVENT_PLAYER_DEFEAT                    = ConvertPlayerEvent(13)
    // 玩家事件 玩家胜利
    constant playerevent EVENT_PLAYER_VICTORY                   = ConvertPlayerEvent(14)
    // 玩家事件 玩家离开游戏
    constant playerevent EVENT_PLAYER_LEAVE                     = ConvertPlayerEvent(15)
    // 玩家事件 玩家聊天
    constant playerevent EVENT_PLAYER_CHAT                      = ConvertPlayerEvent(16)
    // 玩家事件 玩家按下 ESC键
    constant playerevent EVENT_PLAYER_END_CINEMATIC             = ConvertPlayerEvent(17)

    //===================================================
    // For use with TriggerRegisterPlayerUnitEvent
    //===================================================

    // 玩家单位事件 单位被攻击
    constant playerunitevent EVENT_PLAYER_UNIT_ATTACKED                 = ConvertPlayerUnitEvent(18)
    // 玩家单位事件 单位被营救
    constant playerunitevent EVENT_PLAYER_UNIT_RESCUED                  = ConvertPlayerUnitEvent(19)

    // 玩家单位事件 单位死亡
    constant playerunitevent EVENT_PLAYER_UNIT_DEATH                    = ConvertPlayerUnitEvent(20)
    // 玩家单位事件 单位(尸体)开始腐烂
    constant playerunitevent EVENT_PLAYER_UNIT_DECAY                    = ConvertPlayerUnitEvent(21)

    // 玩家单位事件 单位可侦测（可被反隐看到）
    constant playerunitevent EVENT_PLAYER_UNIT_DETECTED                 = ConvertPlayerUnitEvent(22)
    // 玩家单位事件 单位被隐藏
    constant playerunitevent EVENT_PLAYER_UNIT_HIDDEN                   = ConvertPlayerUnitEvent(23)

    // 玩家单位事件 选择单位
    constant playerunitevent EVENT_PLAYER_UNIT_SELECTED                 = ConvertPlayerUnitEvent(24)
    // 玩家单位事件 取消选择单位
    constant playerunitevent EVENT_PLAYER_UNIT_DESELECTED               = ConvertPlayerUnitEvent(25)

    // 玩家单位事件 开始建造
    constant playerunitevent EVENT_PLAYER_UNIT_CONSTRUCT_START          = ConvertPlayerUnitEvent(26)
    // 玩家单位事件 取消建造
    constant playerunitevent EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL         = ConvertPlayerUnitEvent(27)
    // 玩家单位事件 建造完成
    constant playerunitevent EVENT_PLAYER_UNIT_CONSTRUCT_FINISH         = ConvertPlayerUnitEvent(28)

    // 玩家单位事件 开始研究科技
    constant playerunitevent EVENT_PLAYER_UNIT_UPGRADE_START            = ConvertPlayerUnitEvent(29)
    // 玩家单位事件 取消研究科技
    constant playerunitevent EVENT_PLAYER_UNIT_UPGRADE_CANCEL           = ConvertPlayerUnitEvent(30)
    // 玩家单位事件 完成科技研究
    constant playerunitevent EVENT_PLAYER_UNIT_UPGRADE_FINISH           = ConvertPlayerUnitEvent(31)

    // 玩家单位事件 开始训练单位
    constant playerunitevent EVENT_PLAYER_UNIT_TRAIN_START              = ConvertPlayerUnitEvent(32)
    // 玩家单位事件 取消训练单位
    constant playerunitevent EVENT_PLAYER_UNIT_TRAIN_CANCEL             = ConvertPlayerUnitEvent(33)
    // 玩家单位事件 完成训练单位
    constant playerunitevent EVENT_PLAYER_UNIT_TRAIN_FINISH             = ConvertPlayerUnitEvent(34)

    // 玩家单位事件 开始研究科技
    constant playerunitevent EVENT_PLAYER_UNIT_RESEARCH_START           = ConvertPlayerUnitEvent(35)
    // 玩家单位事件 取消研究科技
    constant playerunitevent EVENT_PLAYER_UNIT_RESEARCH_CANCEL          = ConvertPlayerUnitEvent(36)
    // 玩家单位事件 完成研究科技
    constant playerunitevent EVENT_PLAYER_UNIT_RESEARCH_FINISH          = ConvertPlayerUnitEvent(37)
    // 玩家单位事件 发布命令(无目标)
    constant playerunitevent EVENT_PLAYER_UNIT_ISSUED_ORDER             = ConvertPlayerUnitEvent(38)
    // 玩家单位事件 发布命令(指定点)
    constant playerunitevent EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER       = ConvertPlayerUnitEvent(39)
    // 玩家单位事件 发布命令(指定目标，可以是单位、物品、可破坏物)
    constant playerunitevent EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER      = ConvertPlayerUnitEvent(40)
    // 玩家单位事件 发布命令(指定单位)
    constant playerunitevent EVENT_PLAYER_UNIT_ISSUED_UNIT_ORDER        = ConvertPlayerUnitEvent(40)    // for compat

    // 玩家单位事件 英雄升级
    constant playerunitevent EVENT_PLAYER_HERO_LEVEL                    = ConvertPlayerUnitEvent(41)
    // 玩家单位事件 英雄学习技能
    constant playerunitevent EVENT_PLAYER_HERO_SKILL                    = ConvertPlayerUnitEvent(42)

    // 玩家单位事件 英雄可复活/阵亡
    constant playerunitevent EVENT_PLAYER_HERO_REVIVABLE                = ConvertPlayerUnitEvent(43)

    // 玩家单位事件 英雄开始复活
    constant playerunitevent EVENT_PLAYER_HERO_REVIVE_START             = ConvertPlayerUnitEvent(44)
    // 玩家单位事件 英雄取消复活
    constant playerunitevent EVENT_PLAYER_HERO_REVIVE_CANCEL            = ConvertPlayerUnitEvent(45)
    // 玩家单位事件 英雄完成复活
    constant playerunitevent EVENT_PLAYER_HERO_REVIVE_FINISH            = ConvertPlayerUnitEvent(46)
    // 玩家单位事件 召唤单位
    constant playerunitevent EVENT_PLAYER_UNIT_SUMMON                   = ConvertPlayerUnitEvent(47)
    // 玩家单位事件 物品掉落
    constant playerunitevent EVENT_PLAYER_UNIT_DROP_ITEM                = ConvertPlayerUnitEvent(48)
    // 玩家单位事件 拾取物品
    constant playerunitevent EVENT_PLAYER_UNIT_PICKUP_ITEM              = ConvertPlayerUnitEvent(49)
    // 玩家单位事件 使用物品
    constant playerunitevent EVENT_PLAYER_UNIT_USE_ITEM                 = ConvertPlayerUnitEvent(50)

    // 玩家单位事件 单位被装载
    // 被飞艇、船、被缠绕的金矿等装载
    constant playerunitevent EVENT_PLAYER_UNIT_LOADED                   = ConvertPlayerUnitEvent(51)
    
    //===================================================
    // For use with TriggerRegisterUnitEvent
    //===================================================

    // 单位事件 单位受到伤害
    constant unitevent EVENT_UNIT_DAMAGED                               = ConvertUnitEvent(52)
    // 单位事件 单位死亡
    constant unitevent EVENT_UNIT_DEATH                                 = ConvertUnitEvent(53)
    // 单位事件 单位(尸体)开始腐烂
    constant unitevent EVENT_UNIT_DECAY                                 = ConvertUnitEvent(54)
    // 单位事件 单位可侦测（可被反隐看到）
    constant unitevent EVENT_UNIT_DETECTED                              = ConvertUnitEvent(55)
    // 单位事件 单位被隐藏
    constant unitevent EVENT_UNIT_HIDDEN                                = ConvertUnitEvent(56)
    // 单位事件 选择单位
    constant unitevent EVENT_UNIT_SELECTED                              = ConvertUnitEvent(57)
    // 单位事件 取消选择单位
    constant unitevent EVENT_UNIT_DESELECTED                            = ConvertUnitEvent(58)
                                                                        
    // 单位事件 单位状态变更
    constant unitevent EVENT_UNIT_STATE_LIMIT                           = ConvertUnitEvent(59)                                                                        

    // Events which may have a filter for the "other unit"              
    //                                                                  
    // 单位事件 单位获取到攻击目标(类似触发单位警戒攻击)
    constant unitevent EVENT_UNIT_ACQUIRED_TARGET                       = ConvertUnitEvent(60)
    // 单位事件 目标在单位获取范围内(类似警戒范围)
    constant unitevent EVENT_UNIT_TARGET_IN_RANGE                       = ConvertUnitEvent(61)
    // 单位事件 单位被攻击
    constant unitevent EVENT_UNIT_ATTACKED                              = ConvertUnitEvent(62)
    // 单位事件 单位被营救
    constant unitevent EVENT_UNIT_RESCUED                               = ConvertUnitEvent(63)
                                                                        
    // 单位事件 取消建造
    constant unitevent EVENT_UNIT_CONSTRUCT_CANCEL                      = ConvertUnitEvent(64)
    // 单位事件 完成建造
    constant unitevent EVENT_UNIT_CONSTRUCT_FINISH                      = ConvertUnitEvent(65)
                                                                        
    // 单位事件 开始研究科技
    constant unitevent EVENT_UNIT_UPGRADE_START                         = ConvertUnitEvent(66)
    // 单位事件 取消研究科技
    constant unitevent EVENT_UNIT_UPGRADE_CANCEL                        = ConvertUnitEvent(67)
    // 单位事件 完成研究科技
    constant unitevent EVENT_UNIT_UPGRADE_FINISH                        = ConvertUnitEvent(68)
                                                                        
    // Events which involve the specified unit performing               
    // training of other units                                          
    //                                                                  
    // 单位事件 开始训练单位
    constant unitevent EVENT_UNIT_TRAIN_START                           = ConvertUnitEvent(69)
    // 单位事件 取消训练单位
    constant unitevent EVENT_UNIT_TRAIN_CANCEL                          = ConvertUnitEvent(70)
    // 单位事件 完成训练单位
    constant unitevent EVENT_UNIT_TRAIN_FINISH                          = ConvertUnitEvent(71)
                                                                        
    // 单位事件 开始研究科技
    constant unitevent EVENT_UNIT_RESEARCH_START                        = ConvertUnitEvent(72)
    // 单位事件 取消研究科技
    constant unitevent EVENT_UNIT_RESEARCH_CANCEL                       = ConvertUnitEvent(73)
    // 单位事件 完成研究科技
    constant unitevent EVENT_UNIT_RESEARCH_FINISH                       = ConvertUnitEvent(74)
                                                                        
    // 单位事件 发布命令(无目标)
    constant unitevent EVENT_UNIT_ISSUED_ORDER                          = ConvertUnitEvent(75)
    // 单位事件 发布命令(指定点)
    constant unitevent EVENT_UNIT_ISSUED_POINT_ORDER                    = ConvertUnitEvent(76)
    // 单位事件 发布命令(指定单位)
    constant unitevent EVENT_UNIT_ISSUED_TARGET_ORDER                   = ConvertUnitEvent(77)
                                                                       
    // 单位事件 英雄升级
    constant unitevent EVENT_UNIT_HERO_LEVEL                            = ConvertUnitEvent(78)
    // 单位事件 英雄学习技能
    constant unitevent EVENT_UNIT_HERO_SKILL                            = ConvertUnitEvent(79)
                                                                        
    // 单位事件 英雄可复活/阵亡
    constant unitevent EVENT_UNIT_HERO_REVIVABLE                        = ConvertUnitEvent(80)
    // 单位事件 英雄开始复活
    constant unitevent EVENT_UNIT_HERO_REVIVE_START                     = ConvertUnitEvent(81)
    // 单位事件 英雄取消复活
    constant unitevent EVENT_UNIT_HERO_REVIVE_CANCEL                    = ConvertUnitEvent(82)
    // 单位事件 英雄完成复活
    constant unitevent EVENT_UNIT_HERO_REVIVE_FINISH                    = ConvertUnitEvent(83)
                                                                        
    // 单位事件 召唤单位
    constant unitevent EVENT_UNIT_SUMMON                                = ConvertUnitEvent(84)
                                                                        
    // 单位事件 掉落物品
    constant unitevent EVENT_UNIT_DROP_ITEM                             = ConvertUnitEvent(85)
    // 单位事件 获得/拾取物品
    constant unitevent EVENT_UNIT_PICKUP_ITEM                           = ConvertUnitEvent(86)
    // 单位事件 使用物品
    constant unitevent EVENT_UNIT_USE_ITEM                              = ConvertUnitEvent(87)

    // 单位事件 单位被装载
    // 被飞艇、船、被缠绕的金矿等装载
    constant unitevent EVENT_UNIT_LOADED                                = ConvertUnitEvent(88)

    // 微件/实体事件 单位/物品/可破坏物死亡
    constant widgetevent EVENT_WIDGET_DEATH                             = ConvertWidgetEvent(89)

    // 对话框事件 点击对话框按钮
    constant dialogevent EVENT_DIALOG_BUTTON_CLICK                      = ConvertDialogEvent(90)
    // 对话框事件 点击对话框
    constant dialogevent EVENT_DIALOG_CLICK                             = ConvertDialogEvent(91)

    //===================================================
    // Frozen Throne Expansion Events
    // Need to be added here to preserve compat
    //===================================================

    //===================================================
    // For use with TriggerRegisterGameEvent    
    //===================================================    

    // 游戏事件 游戏加载完毕
    constant gameevent          EVENT_GAME_LOADED                       = ConvertGameEvent(256)
    // 游戏事件 比赛即将完成
    constant gameevent          EVENT_GAME_TOURNAMENT_FINISH_SOON       = ConvertGameEvent(257)
    // 游戏事件 比赛完成
    constant gameevent          EVENT_GAME_TOURNAMENT_FINISH_NOW        = ConvertGameEvent(258)
    // 游戏事件 存档
    constant gameevent          EVENT_GAME_SAVE                         = ConvertGameEvent(259)

    //===================================================
    // For use with TriggerRegisterPlayerEvent
    //===================================================

    // 玩家事件 按下 左方向键
    constant playerevent        EVENT_PLAYER_ARROW_LEFT_DOWN            = ConvertPlayerEvent(261)
    // 玩家事件 松开 左方向键
    constant playerevent        EVENT_PLAYER_ARROW_LEFT_UP              = ConvertPlayerEvent(262)
    // 玩家事件 按下 右方向键
    constant playerevent        EVENT_PLAYER_ARROW_RIGHT_DOWN           = ConvertPlayerEvent(263)
    // 玩家事件 松开 右方向键
    constant playerevent        EVENT_PLAYER_ARROW_RIGHT_UP             = ConvertPlayerEvent(264)
    // 玩家事件 按下 上方向键
    constant playerevent        EVENT_PLAYER_ARROW_DOWN_DOWN            = ConvertPlayerEvent(265)
    // 玩家事件 松开 上方向键
    constant playerevent        EVENT_PLAYER_ARROW_DOWN_UP              = ConvertPlayerEvent(266)
    // 玩家事件 按下 下方向键
    constant playerevent        EVENT_PLAYER_ARROW_UP_DOWN              = ConvertPlayerEvent(267)
    // 玩家事件 松开 下方向键
    constant playerevent        EVENT_PLAYER_ARROW_UP_UP                = ConvertPlayerEvent(268)

    //===================================================
    // For use with TriggerRegisterPlayerUnitEvent
    //===================================================

    // 玩家单位事件 出售单位
    constant playerunitevent    EVENT_PLAYER_UNIT_SELL                  = ConvertPlayerUnitEvent(269)
    // 玩家单位事件 变更所属
    constant playerunitevent    EVENT_PLAYER_UNIT_CHANGE_OWNER          = ConvertPlayerUnitEvent(270)
    // 玩家单位事件 出售物品
    constant playerunitevent    EVENT_PLAYER_UNIT_SELL_ITEM             = ConvertPlayerUnitEvent(271)
    // 玩家单位事件 准备施放技能 (前摇开始)
    constant playerunitevent    EVENT_PLAYER_UNIT_SPELL_CHANNEL         = ConvertPlayerUnitEvent(272)
    // 玩家单位事件 开始施放技能(前摇结束)
    constant playerunitevent    EVENT_PLAYER_UNIT_SPELL_CAST            = ConvertPlayerUnitEvent(273)
    // 玩家单位事件 发动技能效果(后摇开始)
    constant playerunitevent    EVENT_PLAYER_UNIT_SPELL_EFFECT          = ConvertPlayerUnitEvent(274)
    // 玩家单位事件 释放技能結束 (后摇结束)
    constant playerunitevent    EVENT_PLAYER_UNIT_SPELL_FINISH          = ConvertPlayerUnitEvent(275)
    // 玩家单位事件 停止施放技能
    constant playerunitevent    EVENT_PLAYER_UNIT_SPELL_ENDCAST         = ConvertPlayerUnitEvent(276)
    // 玩家单位事件 抵押(卖)物品
    constant playerunitevent    EVENT_PLAYER_UNIT_PAWN_ITEM             = ConvertPlayerUnitEvent(277)

    //===================================================
    // For use with TriggerRegisterUnitEvent
    //===================================================

    // 单位事件 出售单位
    constant unitevent          EVENT_UNIT_SELL                         = ConvertUnitEvent(286)
    // 单位事件 单位所属变更
    constant unitevent          EVENT_UNIT_CHANGE_OWNER                 = ConvertUnitEvent(287)
    // 单位事件 出售物品
    constant unitevent          EVENT_UNIT_SELL_ITEM                    = ConvertUnitEvent(288)
    // 单位事件 准备施放技能 (前摇开始)
    constant unitevent          EVENT_UNIT_SPELL_CHANNEL                = ConvertUnitEvent(289)
    // 单位事件 开始施放技能 (前摇结束)
    constant unitevent          EVENT_UNIT_SPELL_CAST                   = ConvertUnitEvent(290)
    // 单位事件 发动技能效果 (后摇开始)
    constant unitevent          EVENT_UNIT_SPELL_EFFECT                 = ConvertUnitEvent(291)
    // 单位事件 发动技能结束 (后摇结束)
    constant unitevent          EVENT_UNIT_SPELL_FINISH                 = ConvertUnitEvent(292)
    // 单位事件 停止施放技能
    constant unitevent          EVENT_UNIT_SPELL_ENDCAST                = ConvertUnitEvent(293)
    // 单位事件 抵押(卖)物品
    constant unitevent          EVENT_UNIT_PAWN_ITEM                    = ConvertUnitEvent(294)

    //===================================================
    // Limit Event API constants    
    // variable, player state, game state, and unit state events
    // ( do NOT change the order of these... )
    //===================================================
    // 比较算符 小于
    constant limitop LESS_THAN                              = ConvertLimitOp(0)
    // 比较算符 小于 或 等于
    constant limitop LESS_THAN_OR_EQUAL                     = ConvertLimitOp(1)
    // 比较算符 等于
    constant limitop EQUAL                                  = ConvertLimitOp(2)
    // 比较算符 大于 或 等于
    constant limitop GREATER_THAN_OR_EQUAL                  = ConvertLimitOp(3)
    // 比较算符 大于
    constant limitop GREATER_THAN                           = ConvertLimitOp(4)
    // 比较算符 不等于
    constant limitop NOT_EQUAL                              = ConvertLimitOp(5)

//===================================================
// Unit Type Constants for use with IsUnitType()
//===================================================

    // 单位类型 英雄
    constant unittype UNIT_TYPE_HERO                        = ConvertUnitType(0)
    // 单位类型 已死亡
    constant unittype UNIT_TYPE_DEAD                        = ConvertUnitType(1)
    // 单位类型 建筑
    constant unittype UNIT_TYPE_STRUCTURE                   = ConvertUnitType(2)

    // 单位类型 飞行单位
    constant unittype UNIT_TYPE_FLYING                      = ConvertUnitType(3)
    // 单位类型 地面单位
    constant unittype UNIT_TYPE_GROUND                      = ConvertUnitType(4)

    // 单位类型 可以攻击飞行单位
    constant unittype UNIT_TYPE_ATTACKS_FLYING              = ConvertUnitType(5)
    // 单位类型 可以攻击地面单位
    constant unittype UNIT_TYPE_ATTACKS_GROUND              = ConvertUnitType(6)

    // 单位类型 近战攻击单位
    constant unittype UNIT_TYPE_MELEE_ATTACKER              = ConvertUnitType(7)
    // 单位类型 远程攻击单位
    constant unittype UNIT_TYPE_RANGED_ATTACKER             = ConvertUnitType(8)

    // 单位类型 泰坦
    constant unittype UNIT_TYPE_GIANT                       = ConvertUnitType(9)
    // 单位类型 召唤物
    constant unittype UNIT_TYPE_SUMMONED                    = ConvertUnitType(10)
    // 单位类型 被击晕的
    constant unittype UNIT_TYPE_STUNNED                     = ConvertUnitType(11)
    // 单位类型 受折磨的
    constant unittype UNIT_TYPE_PLAGUED                     = ConvertUnitType(12)
    // 单位类型 被诱捕(被网住)
    constant unittype UNIT_TYPE_SNARED                      = ConvertUnitType(13)

    // 单位类型 不死族
    constant unittype UNIT_TYPE_UNDEAD                      = ConvertUnitType(14)
    // 单位类型 机械
    constant unittype UNIT_TYPE_MECHANICAL                  = ConvertUnitType(15)
    // 单位类型 工人
    constant unittype UNIT_TYPE_PEON                        = ConvertUnitType(16)
    // 单位类型 自爆工兵
    constant unittype UNIT_TYPE_SAPPER                      = ConvertUnitType(17)
    // 单位类型 城镇
    constant unittype UNIT_TYPE_TOWNHALL                    = ConvertUnitType(18)    
    // 单位类型 古树
    constant unittype UNIT_TYPE_ANCIENT                     = ConvertUnitType(19)
    
    // 单位类型 牛头人
    constant unittype UNIT_TYPE_TAUREN                      = ConvertUnitType(20)
    // 单位类型 已中毒
    constant unittype UNIT_TYPE_POISONED                    = ConvertUnitType(21)
    // 单位类型 被变形
    constant unittype UNIT_TYPE_POLYMORPHED                 = ConvertUnitType(22)
    // 单位类型 被催眠，夜晚睡眠也属于被催眠
    constant unittype UNIT_TYPE_SLEEPING                    = ConvertUnitType(23)
    // 单位类型 有抗性皮肤
    constant unittype UNIT_TYPE_RESISTANT                   = ConvertUnitType(24)
    // 单位类型 处于虚无状态
    constant unittype UNIT_TYPE_ETHEREAL                    = ConvertUnitType(25)
    // 单位类型 免疫魔法
    constant unittype UNIT_TYPE_MAGIC_IMMUNE                = ConvertUnitType(26)

//===================================================
// Unit Type Constants for use with ChooseRandomItemEx()
//===================================================

    // 物品分类 永久
    constant itemtype ITEM_TYPE_PERMANENT                   = ConvertItemType(0)
    // 物品分类 可充
    constant itemtype ITEM_TYPE_CHARGED                     = ConvertItemType(1)
    // 物品分类 力量提升
    constant itemtype ITEM_TYPE_POWERUP                     = ConvertItemType(2)
    // 物品分类 人造
    constant itemtype ITEM_TYPE_ARTIFACT                    = ConvertItemType(3)
    // 物品分类 可购买
    constant itemtype ITEM_TYPE_PURCHASABLE                 = ConvertItemType(4)
    // 物品分类 战役
    constant itemtype ITEM_TYPE_CAMPAIGN                    = ConvertItemType(5)
    // 物品分类 混杂(假)
    constant itemtype ITEM_TYPE_MISCELLANEOUS               = ConvertItemType(6)
    // 物品分类 未知
    constant itemtype ITEM_TYPE_UNKNOWN                     = ConvertItemType(7)
    // 物品分类 任何
    constant itemtype ITEM_TYPE_ANY                         = ConvertItemType(8)

    // Deprecated, should use ITEM_TYPE_POWERUP
    // 弃用物品分类，应改用力量提升分类
    constant itemtype ITEM_TYPE_TOME                        = ConvertItemType(2)

//===================================================
// Animatable Camera Fields
//===================================================

    // 镜头属性 镜头距离(距离到目标)
    constant camerafield CAMERA_FIELD_TARGET_DISTANCE       = ConvertCameraField(0)
    // 镜头属性 远景截断距离(远景裁剪)
    constant camerafield CAMERA_FIELD_FARZ                  = ConvertCameraField(1)
    // 镜头属性 X 轴旋转角度(水平/攻击角度)
    constant camerafield CAMERA_FIELD_ANGLE_OF_ATTACK       = ConvertCameraField(2)
    // 镜头属性 镜头区域(观察区域)
    constant camerafield CAMERA_FIELD_FIELD_OF_VIEW         = ConvertCameraField(3)
    // 镜头属性 Y 轴旋转角度(滚动)
    constant camerafield CAMERA_FIELD_ROLL                  = ConvertCameraField(4)
    // 镜头属性 Z 轴旋转角度(旋转)
    constant camerafield CAMERA_FIELD_ROTATION              = ConvertCameraField(5)
    // 镜头属性 Z 轴偏移(高度位移)
    constant camerafield CAMERA_FIELD_ZOFFSET               = ConvertCameraField(6)

    // 混合模式 无混合，有两个无混合
    constant blendmode   BLEND_MODE_NONE                    = ConvertBlendMode(0)
    // 混合模式 无视混合
    constant blendmode   BLEND_MODE_DONT_CARE               = ConvertBlendMode(0)
    // 混合模式 关键的alpha混合
    constant blendmode   BLEND_MODE_KEYALPHA                = ConvertBlendMode(1)
    // 混合模式 普通混合
    constant blendmode   BLEND_MODE_BLEND                   = ConvertBlendMode(2)
    // 混合模式 附加的混合
    constant blendmode   BLEND_MODE_ADDITIVE                = ConvertBlendMode(3)
    // 混合模式 调整的混合
    constant blendmode   BLEND_MODE_MODULATE                = ConvertBlendMode(4)
    // 混合模式 调整的2倍混合
    constant blendmode   BLEND_MODE_MODULATE_2X             = ConvertBlendMode(5)
    
    // 动画频率控制 普通频率
    constant raritycontrol  RARITY_FREQUENT                 = ConvertRarityControl(0)
    // 动画频率控制 罕见频率
    constant raritycontrol  RARITY_RARE                     = ConvertRarityControl(1)

    // 纹理贴图标志 无
    constant texmapflags    TEXMAP_FLAG_NONE                = ConvertTexMapFlags(0)
    // 纹理贴图标志 重叠(U)
    constant texmapflags    TEXMAP_FLAG_WRAP_U              = ConvertTexMapFlags(1)
    // 纹理贴图标志 重叠(V)
    constant texmapflags    TEXMAP_FLAG_WRAP_V              = ConvertTexMapFlags(2)
    // 纹理贴图标志 重叠(UV)
    constant texmapflags    TEXMAP_FLAG_WRAP_UV             = ConvertTexMapFlags(3)

    // 迷雾状态 黑色阴影
    constant fogstate       FOG_OF_WAR_MASKED               = ConvertFogState(1)
    // 迷雾状态 战争迷雾
    constant fogstate       FOG_OF_WAR_FOGGED               = ConvertFogState(2)
    // 迷雾状态 可见
    constant fogstate       FOG_OF_WAR_VISIBLE              = ConvertFogState(4)

//===================================================
// Camera Margin constants for use with GetCameraMargin
//===================================================

    // 镜头空白 左，似乎默认值恒为512
    constant integer        CAMERA_MARGIN_LEFT              = 0
    // 镜头空白 右，似乎默认值恒为512
    constant integer        CAMERA_MARGIN_RIGHT             = 1
    // 镜头空白 顶部，似乎默认值恒为256
    constant integer        CAMERA_MARGIN_TOP               = 2
    // 镜头空白 底部，似乎默认值恒为256
    constant integer        CAMERA_MARGIN_BOTTOM            = 3

//===================================================
// Effect API constants
//===================================================

    // 特效类型 点目标特效
    constant effecttype     EFFECT_TYPE_EFFECT              = ConvertEffectType(0)
    // 特效类型 目标特效
    constant effecttype     EFFECT_TYPE_TARGET              = ConvertEffectType(1)
    // 特效类型 施法者特效
    constant effecttype     EFFECT_TYPE_CASTER              = ConvertEffectType(2)
    // 特效类型 特殊特效
    constant effecttype     EFFECT_TYPE_SPECIAL             = ConvertEffectType(3)
    // 特效类型 区域特效
    constant effecttype     EFFECT_TYPE_AREA_EFFECT         = ConvertEffectType(4)
    // 特效类型 弹道/投射物特效
    constant effecttype     EFFECT_TYPE_MISSILE             = ConvertEffectType(5)
    // 特效类型 闪电特效
    constant effecttype     EFFECT_TYPE_LIGHTNING           = ConvertEffectType(6)

    // 音效类型 特效
    constant soundtype      SOUND_TYPE_EFFECT               = ConvertSoundType(0)
    // 音效类型 循环特效
    constant soundtype      SOUND_TYPE_EFFECT_LOOPED        = ConvertSoundType(1)

endglobals

//============================================================================
// MathAPI
// 转换 度 为 弧度
native Deg2Rad  takes real degrees returns real
// 转换 弧度 为 度
native Rad2Deg  takes real radians returns real

// 正弦(弧度) [R]
native Sin      takes real radians returns real
// 余弦(弧度) [R]
native Cos      takes real radians returns real
// 正切(弧度) [R]
native Tan      takes real radians returns real

// Expect values between -1 and 1...returns 0 for invalid input
// 反正弦(弧度) [R]
// y 应在 -1 到 1 之间...输入无效时返回 0
native Asin     takes real y returns real
// 反余弦(弧度) [R]
native Acos     takes real x returns real

// 反正切(弧度) [R]
native Atan     takes real x returns real

// Returns 0 if x and y are both 0
// 反正切(Y:X)(弧度) [R]
// x == 0 且 y == 0 , 返回 0
native Atan2    takes real y, real x returns real

// Returns 0 if x <= 0
// 平方根
// x <= 0 , 返回 0
native SquareRoot takes real x returns real

// computes x to the y power
// y == 0.0             => 1
// x ==0.0 and y < 0    => 0
//
// 求幂
// power == 0.0          ， 返回 1
// x == 0.0 且 power < 0 ， 返回 0
native Pow      takes real x, real power returns real

//============================================================================
// String Utility API
// 转换整数成实数
native I2R  takes integer i returns real
// 转换实数成整数(大于0时向下取整，小于0时向上取整)
// 7.x 返回 7，-7.x 返回 -7
native R2I  takes real r returns integer
// 转换整数成字符串
native I2S  takes integer i returns string
// 转换实数成字符串
native R2S  takes real r returns string
// 转换实数成字符串
// @param precision 保留的小数位数
native R2SW takes real r, integer width, integer precision returns string
// 转换字符串成整数
native S2I  takes string s returns integer
// 转换字符串成实数
native S2R  takes string s returns real
// 获取句柄ID
// tips:一般用于哈希表键值（hashtable key）
// @param h 任意handle子类型
native GetHandleId takes handle h returns integer
// 截取字符串 [R]
// @param source 源内容
// @param start 起始位置,下标为0
// @param end 结束位置,需要的字符串长度
native SubString takes string source, integer start, integer end returns string
// 获取字符串长度
native StringLength takes string s returns integer
// 转换字符串英文的大小写
native StringCase takes string source, boolean upper returns string
// 转换字符串成哈希码
native StringHash takes string s returns integer

// 获取外部字符串的译文 [R]
// 从Globalstrings.fdf文件获取查询内容对应的翻译文本，不同语言返回不同的值
// 当字符串不存在时(是当前版本不存在查询的字符串本身，不是字符串已存在但没有翻译文本)，会原封不动返回查询内容(英语也附带翻译，该翻译文本仅首字母大写，但所有字符串都是大写且使用下划线替代空格，故翻译文本和字符串绝对不会相等)，可利用其得知游戏大致版本号(如1.27，1.30等)
// 不能在AI脚本使用，因为脚本无法获取外部内容，只返回 null
//@ desync danger 1
native GetLocalizedString takes string source returns string
// 获取本地快捷键
// 理论上不能在AI脚本使用
//@ desync danger 1
native GetLocalizedHotkey takes string source returns integer

//============================================================================
// Map Setup API
//
//  These are native functions for describing the map configuration
//  these funcs should only be used in the "config" function of
//  a map script. The functions should also be called in this order
//  ( i.e. call SetPlayers before SetPlayerColor...
//

// 设置地图名称
native SetMapName           takes string name returns nothing
// 设置地图说明
native SetMapDescription    takes string description returns nothing

//@ desync handle-op 15
// 设置队伍数量
native SetTeams             takes integer teamcount returns nothing
// 设置玩家数量，需在设置玩家颜色前使用
native SetPlayers           takes integer playercount returns nothing

// 设置默认出生点(指定出生点编号绑定到指定坐标)
native DefineStartLocation      takes integer whichStartLoc, real x, real y returns nothing
// 设置默认出生点(指定出生点编号绑定到指定点)
native DefineStartLocationLoc   takes integer whichStartLoc, location whichLocation returns nothing
// 设置出生点分布编号(指定玩家槽)
native SetStartLocPrioCount     takes integer whichStartLoc, integer prioSlotCount returns nothing
// 设置出生点分布优先权（指定出生点编号）
// @param whichStartLoc 指定出生点编号（按地图设置的各玩家开始点）
// @param prioSlotIndex 玩家槽
// @param otherStartLocIndex 其他出生点(仅在允许玩家变更出生点时有效)
// @param priority 出生点分布优先权
native SetStartLocPrio          takes integer whichStartLoc, integer prioSlotIndex, integer otherStartLocIndex, startlocprio priority returns nothing
// 获取出生点分布优先权(指定玩家槽)
// 以整数形式返回
native GetStartLocPrioSlot      takes integer whichStartLoc, integer prioSlotIndex returns integer
// 获取出生点分布优先权(指定玩家槽)
native GetStartLocPrio          takes integer whichStartLoc, integer prioSlotIndex returns startlocprio

// 设置游戏（队伍）类型支持状态
native SetGameTypeSupported takes gametype whichGameType, boolean value returns nothing
// 设置地图参数（指定参数类型）
native SetMapFlag           takes mapflag whichMapFlag, boolean value returns nothing
// 设置游戏出生点放置方式(指定出生点放置方式)
native SetGamePlacement     takes placement whichPlacementType returns nothing
// 设定游戏速度
native SetGameSpeed         takes gamespeed whichspeed returns nothing
// 设置游戏难度 [R]
native SetGameDifficulty    takes gamedifficulty whichdifficulty returns nothing
// 设置资源密度
native SetResourceDensity   takes mapdensity whichdensity returns nothing
// 设置单位密度
native SetCreatureDensity   takes mapdensity whichdensity returns nothing

// 获取队伍数量
native GetTeams             takes nothing returns integer
// 获取玩家数量
native GetPlayers           takes nothing returns integer

// 查询是否支持指定的游戏（队伍）类型
native IsGameTypeSupported  takes gametype whichGameType returns boolean
// 获取选择的游戏（队伍）类型
native GetGameTypeSelected  takes nothing returns gametype
// 查询地图参数/地图选项是否开启(指定参数)
native IsMapFlagSet         takes mapflag whichMapFlag returns boolean

// 获取游戏出生点放置方式
constant native GetGamePlacement     takes nothing returns placement
// 获取游戏速度
constant native GetGameSpeed         takes nothing returns gamespeed
// 获取游戏难度，游戏难度和AI难度是两个维度的参数
constant native GetGameDifficulty    takes nothing returns gamedifficulty
// 获取资源密度
constant native GetResourceDensity   takes nothing returns mapdensity
// 获取单位密度
constant native GetCreatureDensity   takes nothing returns mapdensity
// 获取指定编号出生点 X 坐标
// 带入0~11/23即可返回指定编号的出生点。在未固定出生点时，出生点编号和玩家不会按编号对应
constant native GetStartLocationX    takes integer whichStartLocation returns real
// 获取指定编号出生点 Y 坐标
// 带入0~11/23即可返回指定编号的出生点。在未固定出生点时，出生点编号和玩家不会按编号对应
constant native GetStartLocationY    takes integer whichStartLocation returns real
// 获取指定编号出生点，以点形式返回
// 带入0~11/23会返回该编号的出生点。在未固定出生点时，出生点编号和玩家不会按编号对应
// 会创建点，用完请注意排泄
constant native GetStartLocationLoc  takes integer whichStartLocation returns location

// 设置指定玩家所在队伍
native SetPlayerTeam            takes player whichPlayer, integer whichTeam returns nothing
// 设置指定玩家出生点编号
native SetPlayerStartLocation   takes player whichPlayer, integer startLocIndex returns nothing
// forces player to have the specified start loc and marks the start loc as occupied
// which removes it from consideration for subsequently placed players
// ( i.e. you can use this to put people in a fixed loc and then
//   use random placement for any unplaced players etc )
// 设置指定玩家出点编号(默认用于按玩家组设置玩家出生点触发器)
native ForcePlayerStartLocation takes player whichPlayer, integer startLocIndex returns nothing 
// 设置指定玩家颜色 [R]
native SetPlayerColor           takes player whichPlayer, playercolor color returns nothing
// 设置指定玩家联盟类型(指定项目) [R]
native SetPlayerAlliance        takes player sourcePlayer, player otherPlayer, alliancetype whichAllianceSetting, boolean value returns nothing
// 设置指定玩家税率 [R]
// @param sourcePlayer 纳税玩家
// @param otherPlayer 收税玩家
// @param whichResource 税收类型，黄金或木材[PLAYER_STATE_RESOURCE_GOLD，PLAYER_STATE_RESOURCE_LUMBER]
// @param rate 税率
native SetPlayerTaxRate         takes player sourcePlayer, player otherPlayer, playerstate whichResource, integer rate returns nothing
// 设置指定玩家预设种族
native SetPlayerRacePreference  takes player whichPlayer, racepreference whichRacePreference returns nothing
// 设置指定玩家种族可选性
native SetPlayerRaceSelectable  takes player whichPlayer, boolean value returns nothing
// 设置指定玩家控制者类型
native SetPlayerController      takes player whichPlayer, mapcontrol controlType returns nothing
// 设置指定玩家名字
native SetPlayerName            takes player whichPlayer, string name returns nothing

// 显示/隐藏 得分屏 [R]
// 游戏结束后的得分统计面板，官方战役默认不显示
native SetPlayerOnScoreScreen   takes player whichPlayer, boolean flag returns nothing

// 获取指定玩家所在队伍的编号
native GetPlayerTeam            takes player whichPlayer returns integer
// 获取指定玩家出生点编号
// 带入0~11/23玩家编号会返回该玩家出生点。在未固定出生点时，出生点编号和玩家不会按编号对应
native GetPlayerStartLocation   takes player whichPlayer returns integer
// 获取指定玩家颜色
native GetPlayerColor           takes player whichPlayer returns playercolor
// 查询指定玩家是否可选
native GetPlayerSelectable      takes player whichPlayer returns boolean
// 查询指定玩家控制者类型
native GetPlayerController      takes player whichPlayer returns mapcontrol
// 查询指定玩家槽状态
native GetPlayerSlotState       takes player whichPlayer returns playerslotstate
// 获取指定玩家税率 [R]
// @param sourcePlayer 纳税玩家
// @param otherPlayer 收税玩家
// @param whichResource 税收类型，黄金或木材[PLAYER_STATE_RESOURCE_GOLD，PLAYER_STATE_RESOURCE_LUMBER]
native GetPlayerTaxRate         takes player sourcePlayer, player otherPlayer, playerstate whichResource returns integer
// 查询指定玩家预设种族是否指定种族
// 若情节–玩家未设置指定的种族（必须固定出生点才生效），则取房间玩家自主选择的种族，使用随机时应该返回否
native IsPlayerRacePrefSet      takes player whichPlayer, racepreference pref returns boolean
// 获取指定玩家名字
native GetPlayerName            takes player whichPlayer returns string

//============================================================================
// Timer API
//
// 新建计时器 [R]
//@ desync handle-op
native CreateTimer          takes nothing returns timer
// 销毁计时器 [R]
//@ desync handle-op
native DestroyTimer         takes timer whichTimer returns nothing
// 开始计时器(计时) [C]
// @param whichTimer 计时器
// @param timeout 超时/倒计时初始值
// @param periodic 是否循环
// @param handlerFunc 到期后运行的函数
native TimerStart           takes timer whichTimer, real timeout, boolean periodic, code handlerFunc returns nothing
// 获取计时器经过的时间/已倒计的时间
native TimerGetElapsed      takes timer whichTimer returns real
// 获取计时器剩余时间
native TimerGetRemaining    takes timer whichTimer returns real
// 获取计时器初始时间/倒计时初始值
native TimerGetTimeout      takes timer whichTimer returns real
// 暂停计时器(计时) [R]
native PauseTimer           takes timer whichTimer returns nothing
// 恢复计时器(计时) [R]
native ResumeTimer          takes timer whichTimer returns nothing
// 获取到期的计时器
// 与 TimerStart 一同使用
native GetExpiredTimer      takes nothing returns timer

//============================================================================
// Group API
//
//@ desync handle-op 50
// 创建单位组 [R]
// 会创建单位组，用完请注意排泄
native CreateGroup                          takes nothing returns group
// 销毁单位组 [R]
native DestroyGroup                         takes group whichGroup returns nothing
// 将指定单位添加到单位组中 [R]
native GroupAddUnit                         takes group whichGroup, unit whichUnit returns nothing
// 将指定单位移出单位组 [R]
native GroupRemoveUnit                      takes group whichGroup, unit whichUnit returns nothing
// 清空单位组
// 排泄需使用销毁单位组 DestroyGroup，而非清空
native GroupClear                           takes group whichGroup returns nothing
// 将指定单位名称的单位加入单位组
// @param unitname 单位名称，不区分大小写，可在 common.ai 和 jass.config.json 文件找到，使用 GOLDMINE 时，会同时加入金矿、被缠绕的金矿、闹鬼金矿
// @param filter 条件表达式，不建议使用在AI脚本中，即filter写成null
native GroupEnumUnitsOfType                 takes group whichGroup, string unitname, boolexpr filter returns nothing
// 将指定玩家的单位加入单位组
// @param filter 条件表达式，不建议使用在AI脚本中，即filter写成null
native GroupEnumUnitsOfPlayer               takes group whichGroup, player whichPlayer, boolexpr filter returns nothing
// 将指定单位名称的单位加入单位组，同时指定添加单位的数量上限
// @param unitname 单位名称，不区分大小写，可在 common.ai 和 jass.config.json 文件找到，使用 GOLDMINE 时，会同时加入金矿、被缠绕的金矿、闹鬼金矿
// @param filter 条件表达式，不建议使用在AI脚本中，即filter写成null
// @param countLimit 数量上限
native GroupEnumUnitsOfTypeCounted          takes group whichGroup, string unitname, boolexpr filter, integer countLimit returns nothing
// 将指定矩形区域的的单位加入单位组
// @param filter 条件表达式，不建议使用在AI脚本中，即filter写成null
native GroupEnumUnitsInRect                 takes group whichGroup, rect r, boolexpr filter returns nothing
// 将指定矩形区域的的单位加入单位组，同时指定添加单位的数量上限
// @param filter 条件表达式，不建议使用在AI脚本中，即filter写成null
// @param countLimit 数量上限
native GroupEnumUnitsInRectCounted          takes group whichGroup, rect r, boolexpr filter, integer countLimit returns nothing
// 将指定圆形范围的单位添加到单位组(指定圆心坐标)
// @param filter 条件表达式，不建议使用在AI脚本中，即filter写成null
native GroupEnumUnitsInRange                takes group whichGroup, real x, real y, real radius, boolexpr filter returns nothing
// 将指定圆形范围的单位添加到单位组(指定圆心坐标)
// @param filter 条件表达式，不建议使用在AI脚本中，即filter写成null
native GroupEnumUnitsInRangeOfLoc           takes group whichGroup, location whichLocation, real radius, boolexpr filter returns nothing
// 【弃用】将指定圆形范围的单位添加到单位组(指定圆心坐标)，同时指定添加单位的数量上限
// @param filter 条件表达式，不建议使用在AI脚本中，即filter写成null
// @param countLimit 数量上限
// @deprecated 弃用函数
native GroupEnumUnitsInRangeCounted         takes group whichGroup, real x, real y, real radius, boolexpr filter, integer countLimit returns nothing
// 【弃用】将指定圆形范围的单位添加到单位组(指定圆心坐标)，同时指定添加单位的数量上限
// @param filter 条件表达式，不建议使用在AI脚本中，即filter写成null
// @param countLimit 数量上限
// @deprecated 弃用函数
native GroupEnumUnitsInRangeOfLocCounted    takes group whichGroup, location whichLocation, real radius, boolexpr filter, integer countLimit returns nothing
// 将指定玩家选择的单位添加到单位组
// @param filter 条件表达式，不建议使用在AI脚本中，即filter写成null
native GroupEnumUnitsSelected               takes group whichGroup, player whichPlayer, boolexpr filter returns nothing

//@ nodiscard 25
//@ desync handle-op 24
// 发布(单位组)命令(无目标)
// @param order 技能命令字符串可在 记录物编的文件 找到
native GroupImmediateOrder                  takes group whichGroup, string order returns boolean
// 按ID发布(单位组)命令(无目标)
// @param order 技能命令ID可在 记录物编的文件 找到
native GroupImmediateOrderById              takes group whichGroup, integer order returns boolean
// 发布(单位组)命令(指定坐标) [R]
// @param order 技能命令字符串可在 记录物编的文件 找到
native GroupPointOrder                      takes group whichGroup, string order, real x, real y returns boolean
// 发布(单位组)命令(指定点)
// @param order 技能命令字符串可在 记录物编的文件 找到
native GroupPointOrderLoc                   takes group whichGroup, string order, location whichLocation returns boolean
// 按ID发布(单位组)命令(指定坐标)
// @param order 技能命令ID可在 记录物编的文件 找到
native GroupPointOrderById                  takes group whichGroup, integer order, real x, real y returns boolean
// 按ID发布(单位组)命令(指定点)
// @param order 技能命令ID可在 记录物编的文件 找到
native GroupPointOrderByIdLoc               takes group whichGroup, integer order, location whichLocation returns boolean
// 发布(单位组)命令(指定单位/物品/可破坏物)
// @param order 技能命令字符串可在 记录物编的文件 找到
native GroupTargetOrder                     takes group whichGroup, string order, widget targetWidget returns boolean
// 按ID发布(单位组)命令(指定单位/物品/可破坏物)
// @param order 技能命令ID可在 记录物编的文件 找到
native GroupTargetOrderById                 takes group whichGroup, integer order, widget targetWidget returns boolean

//@ desync handle-op 10
// This will be difficult to support with potentially disjoint, cell-based regions
// as it would involve enumerating all the cells that are covered by a particularregion
// a better implementation would be a trigger that adds relevant units as they enter
// and removes them if they leave...
// 选取指定单位组做单个动作
native ForGroup                 takes group whichGroup, code callback returns nothing
// 获取单位组中第一个单位
// 在单位组内单位未发生变化时(添加或移除单位)，单位的排序不会发生变化，即每次获取的都是同一个单位
// 当单位组内某个单位因死亡或删除后被系统自动置null后，排在该单位之后的单位无法在使用该命令获取，建议清空单位组并重新选取单位
native FirstOfGroup             takes group whichGroup returns unit

//============================================================================
// Force API
//
//@ desync handle-op 22
// 新建玩家组 [R]
native CreateForce              takes nothing returns force
// 销毁玩家组 [R]
native DestroyForce             takes force whichForce returns nothing
// 添加玩家到玩家组 [R]
native ForceAddPlayer           takes force whichForce, player whichPlayer returns nothing
// 从玩家组移除玩家 [R]
native ForceRemovePlayer        takes force whichForce, player whichPlayer returns nothing
// 清空玩家组
// 排泄需使用销毁玩家组 DestroyForce，而非清空
native ForceClear               takes force whichForce returns nothing
// 匹配玩家组(指定条件表达式)
native ForceEnumPlayers         takes force whichForce, boolexpr filter returns nothing
// 在指定的玩家组中匹配玩家(指定匹配的玩家数量)
// @param countLimit 匹配的玩家数量上限
native ForceEnumPlayersCounted  takes force whichForce, boolexpr filter, integer countLimit returns nothing
// 在指定玩家组中匹配指定玩家的盟友
native ForceEnumAllies          takes force whichForce, player whichPlayer, boolexpr filter returns nothing
// 在指定玩家组中匹配指定玩家的敌人
native ForceEnumEnemies         takes force whichForce, player whichPlayer, boolexpr filter returns nothing
// 选取指定玩家组(的所有玩家)做动作(单个动作)
native ForForce                 takes force whichForce, code callback returns nothing

//============================================================================
// Region and Location API
//
//@ desync handle-op 16
// 转换坐标成矩形区域
// 会创建矩形区域，用完请注意排泄
native Rect                     takes real minx, real miny, real maxx, real maxy returns rect
// 转换点成矩形区域
// 会创建矩形区域，用完请注意排泄
native RectFromLoc              takes location min, location max returns rect
// 删除矩形区域 [R]
native RemoveRect               takes rect whichRect returns nothing
// 设置矩形区域(指定坐标) [R]
native SetRect                  takes rect whichRect, real minx, real miny, real maxx, real maxy returns nothing
// 设置矩形区域(指定点) [R]
native SetRectFromLoc           takes rect whichRect, location min, location max returns nothing
// 移动矩形区域(指定坐标) [R]
native MoveRectTo               takes rect whichRect, real newCenterX, real newCenterY returns nothing
// 移动矩形区域(指定新的中心点)
native MoveRectToLoc            takes rect whichRect, location newCenterLoc returns nothing

// 获取矩形区域中心的 X 坐标
native GetRectCenterX           takes rect whichRect returns real
// 获取矩形区域中心的 Y 坐标
native GetRectCenterY           takes rect whichRect returns real
// 获取矩形区域最小 X 坐标
native GetRectMinX              takes rect whichRect returns real
// 获取矩形区域最小 Y 坐标
native GetRectMinY              takes rect whichRect returns real
// 获取矩形区域最大 X 坐标
native GetRectMaxX              takes rect whichRect returns real
// 获取矩形区域最大 Y 坐标
native GetRectMaxY              takes rect whichRect returns real

//@ desync handle-op 4
// 新建不规则区域 [R]
native CreateRegion             takes nothing returns region
// 删除不规则区域 [R]
native RemoveRegion             takes region whichRegion returns nothing

//@ desync handle-op 4
// 在指定不规则区域添加矩形区域  [R]
native RegionAddRect            takes region whichRegion, rect r returns nothing
// 移除指定不规则区域的矩形区域  [R]
native RegionClearRect          takes region whichRegion, rect r returns nothing

//@ desync handle-op 8
// 在指定不规则区域指定坐标添加单元格 [R]
native RegionAddCell           takes region whichRegion, real x, real y returns nothing
// 在指定不规则区域指定点添加单元格 [R]
native RegionAddCellAtLoc      takes region whichRegion, location whichLocation returns nothing
// 清理指定不规则区域指定坐标的单元格 [R]
native RegionClearCell         takes region whichRegion, real x, real y returns nothing
// 清理指定不规则区域指定点的单元格 [R]
native RegionClearCellAtLoc    takes region whichRegion, location whichLocation returns nothing

//@ desync handle-op 7
// 转换坐标成点
// 会创建点，用完请注意排泄
native Location                 takes real x, real y returns location
// 清除点 [R]
native RemoveLocation           takes location whichLocation returns nothing
// 移动点（到指定坐标） [R]
native MoveLocation             takes location whichLocation, real newX, real newY returns nothing
// 获取点 X 坐标
native GetLocationX             takes location whichLocation returns real
// 获取点 Y 坐标
native GetLocationY             takes location whichLocation returns real

//@ desync danger 4
// This function is asynchronous. The values it returns are not guaranteed synchronous between each player.
//  If you attempt to use it in a synchronous manner, it may cause a desync.
// 获取点 Z 坐标（高度）(异步) [R]
native GetLocationZ             takes location whichLocation returns real

// 查询单位是否在不规则区域内
native IsUnitInRegion               takes region whichRegion, unit whichUnit returns boolean
// 查询坐标是否在不规则区域内
native IsPointInRegion              takes region whichRegion, real x, real y returns boolean
// 查询点是否在不规则区域内
native IsLocationInRegion           takes region whichRegion, location whichLocation returns boolean

// Returns full map bounds, including unplayable borders, in world coordinates
// 获取完整地图区域(包括不可玩的边界)
// 会创建区域，用完请注意排泄
//@ desync handle-op
native GetWorldBounds           takes nothing returns rect

//============================================================================
// Native trigger interface
//
//@ desync handle-op 10
// 新建触发器 [R]
native CreateTrigger    takes nothing returns trigger
// 销毁触发器 [R]
native DestroyTrigger   takes trigger whichTrigger returns nothing
// 重置触发器
native ResetTrigger     takes trigger whichTrigger returns nothing
// 打开触发器
native EnableTrigger    takes trigger whichTrigger returns nothing
// 关闭触发器
native DisableTrigger   takes trigger whichTrigger returns nothing
// 查询触发器是否打开
native IsTriggerEnabled takes trigger whichTrigger returns boolean

//@ desync handle-op 2
// 挂起/释放 触发器
native TriggerWaitOnSleeps   takes trigger whichTrigger, boolean flag returns nothing
// 查询触发器是否挂起
native IsTriggerWaitOnSleeps takes trigger whichTrigger returns boolean

//@ desync handle-op 4
// 获取匹配的单位
constant native GetFilterUnit       takes nothing returns unit
// 获取选取的单位
constant native GetEnumUnit         takes nothing returns unit

//@ desync handle-op 4
// 获取匹配的可破坏物
constant native GetFilterDestructable   takes nothing returns destructable
// 获取选取的可破坏物
constant native GetEnumDestructable     takes nothing returns destructable

//@ desync handle-op 4
// 获取匹配的物品
constant native GetFilterItem           takes nothing returns item
// 获取选取的物品
constant native GetEnumItem             takes nothing returns item

//@ desync handle-op 4
// 获取匹配的玩家
constant native GetFilterPlayer     takes nothing returns player
// 获取选取的玩家
constant native GetEnumPlayer       takes nothing returns player

// 获取（当前被）触发的触发器
//@ nodiscard 1
constant native GetTriggeringTrigger    takes nothing returns trigger
// 获取触发器事件ID
constant native GetTriggerEventId       takes nothing returns eventid
// 获取触发器条件数量
constant native GetTriggerEvalCount     takes trigger whichTrigger returns integer
// 获取触发器运行次数
constant native GetTriggerExecCount     takes trigger whichTrigger returns integer

//@ desync handle-op 3
//@ execstring-func 2
// 运行函数 [R]
native ExecuteFunc          takes string funcName returns nothing

//============================================================================
// Boolean Expr API ( for compositing trigger conditions and unit filter funcs...)
//============================================================================
//@ desync handle-op 18
// 和
native And              takes boolexpr operandA, boolexpr operandB returns boolexpr
// 或
native Or               takes boolexpr operandA, boolexpr operandB returns boolexpr
// 否/非
native Not              takes boolexpr operand returns boolexpr
// 条件方法
native Condition        takes code func returns conditionfunc
// 销毁条件方法
native DestroyCondition takes conditionfunc c returns nothing
// 过滤方法
// 可理解为条件/布尔值，用于选取/匹配时指定具体的筛选条件
// 用完请注意排泄(使用DestroyFilter，并set null)，不建议在AI脚本中使用
native Filter           takes code func returns filterfunc
// 销毁过滤方法
native DestroyFilter    takes filterfunc f returns nothing
// 销毁条件表达式
native DestroyBoolExpr  takes boolexpr e returns nothing

//============================================================================
// Trigger Game Event API
//============================================================================

//@ nodiscard 3
//@ desync handle-op 2
// 触发器登记变量事件
native TriggerRegisterVariableEvent takes trigger whichTrigger, string varName, limitop opcode, real limitval returns event

    // EVENT_GAME_VARIABLE_LIMIT
    //constant native string GetTriggeringVariableName takes nothing returns string

// Creates it's own timer and triggers when it expires
//@ nodiscard 3
//@ desync handle-op 2
// 触发器登记计时器事件
native TriggerRegisterTimerEvent takes trigger whichTrigger, real timeout, boolean periodic returns event

// Triggers when the timer you tell it about expires
//@ nodiscard 3
//@ desync handle-op 2
// 触发器登记计时器到期事件
native TriggerRegisterTimerExpireEvent takes trigger whichTrigger, timer t returns event

//@ nodiscard 3
//@ desync handle-op 2
// 触发器登记游戏状态事件
native TriggerRegisterGameStateEvent takes trigger whichTrigger, gamestate whichState, limitop opcode, real limitval returns event

//@ nodiscard 5
//@ desync handle-op 4
// 触发器登记对话框事件
native TriggerRegisterDialogEvent       takes trigger whichTrigger, dialog whichDialog returns event
// 触发器登记点击对话框按钮事件 [R]
native TriggerRegisterDialogButtonEvent takes trigger whichTrigger, button whichButton returns event

//@ desync handle-op 3
//  EVENT_GAME_STATE_LIMIT
// 获取游戏状态(对应游戏状态设置等事件)
constant native GetEventGameState takes nothing returns gamestate

//@ nodiscard 3
//@ desync handle-op 2
// 触发器登记游戏事件
native TriggerRegisterGameEvent takes trigger whichTrigger, gameevent whichGameEvent returns event
  
// EVENT_GAME_VICTORY
// 获取胜利玩家(对应游戏胜利等事件)
constant native GetWinningPlayer takes nothing returns player


//@ nodiscard 3
//@ desync handle-op 2
// 触发器登记单位进入不规则区域事件(可指定条件表达式) [R]
native TriggerRegisterEnterRegion takes trigger whichTrigger, region whichRegion, boolexpr filter returns event

//@ desync handle-op 5
// EVENT_GAME_ENTER_REGION
// 事件响应 获取触发的不规则区域 [R](对应进入不规则区域等事件)
constant native GetTriggeringRegion takes nothing returns region
// 事件响应 获取正在进入的单位(对应进入不规则区域等事件)
constant native GetEnteringUnit takes nothing returns unit

// EVENT_GAME_LEAVE_REGION

//@ nodiscard 3
//@ desync handle-op 4
// 触发器登记单位离开不规则区域事件(可指定条件表达式) [R](对应离开不规则区域等事件)
native TriggerRegisterLeaveRegion takes trigger whichTrigger, region whichRegion, boolexpr filter returns event
// 事件响应 获取正在离开的单位(对应离开不规则区域等事件)
constant native GetLeavingUnit takes nothing returns unit

//@ nodiscard 5
//@ desync handle-op 4
// 触发器登记鼠标点击可追踪物事件 [R]
native TriggerRegisterTrackableHitEvent takes trigger whichTrigger, trackable t returns event
// 触发器登记鼠标移动到可追踪物事件 [R]
native TriggerRegisterTrackableTrackEvent takes trigger whichTrigger, trackable t returns event

//@ desync handle-op 4
// EVENT_GAME_TRACKABLE_HIT
// EVENT_GAME_TRACKABLE_TRACK
// 事件响应 获取触发的可追踪物 [R](对应鼠标点击可追踪物及鼠标移动到可追踪物事件)
constant native GetTriggeringTrackable takes nothing returns trackable

//@ desync handle-op 5
// EVENT_DIALOG_BUTTON_CLICK
// 事件响应 获取被点击的对话框按钮(对应对话框按钮被点击等事件)
constant native GetClickedButton takes nothing returns button
// 事件响应 获取被点击的对话框(对应对话框按钮被点击等事件)
constant native GetClickedDialog    takes nothing returns dialog

// EVENT_GAME_TOURNAMENT_FINISH_SOON
// 事件响应 获取比赛剩余时间(对应比赛完成等事件)
// @version 1.33
constant native GetTournamentFinishSoonTimeRemaining takes nothing returns real
// 事件响应 获取比赛结束规则(对应比赛完成等事件)
// @version 1.33
constant native GetTournamentFinishNowRule takes nothing returns integer
// 事件响应 获取比赛结束玩家(对应比赛完成等事件)
// @version 1.33
constant native GetTournamentFinishNowPlayer takes nothing returns player
// 事件响应 获取比赛得分(对应比赛完成等事件)
// @version 1.33
constant native GetTournamentScore takes player whichPlayer returns integer

// EVENT_GAME_SAVE
// 事件响应 获取游戏存档的文件名(对应存档等事件)
constant native GetSaveBasicFilename takes nothing returns string

//============================================================================
// Trigger Player Based Event API
//============================================================================

//@ nodiscard 3
//@ desync handle-op 2
// 触发器登记玩家事件
native TriggerRegisterPlayerEvent takes trigger whichTrigger, player  whichPlayer, playerevent whichPlayerEvent returns event

//@ desync handle-op 4
// EVENT_PLAYER_DEFEAT
// EVENT_PLAYER_VICTORY
// 事件响应 获取触发玩家(对应玩家失败和玩家胜利等事件)
constant native GetTriggerPlayer takes nothing returns player

//@ nodiscard 3
//@ desync handle-op 2
// 触发器登记玩家单位事件
native TriggerRegisterPlayerUnitEvent takes trigger whichTrigger, player whichPlayer, playerunitevent whichPlayerUnitEvent, boolexpr filter returns event

//@ desync handle-op 4
// EVENT_PLAYER_HERO_LEVEL
// EVENT_UNIT_HERO_LEVEL
// 事件响应 获取升级的英雄(对应英雄升级和英雄升级等事件)
constant native GetLevelingUnit takes nothing returns unit

//@ desync handle-op 8
// EVENT_PLAYER_HERO_SKILL
// EVENT_UNIT_HERO_SKILL
// 事件响应 获取学习技能的英雄(对应英雄学习技能和英雄学习技能等事件)
constant native GetLearningUnit      takes nothing returns unit
// 事件响应 获取学习的技能 [R](对应英雄学习技能和英雄学习技能等事件)
constant native GetLearnedSkill      takes nothing returns integer
// 事件响应 获取学习技能的等级(对应英雄学习技能和英雄学习技能等事件)
constant native GetLearnedSkillLevel takes nothing returns integer

//@ desync handle-op 3
// EVENT_PLAYER_HERO_REVIVABLE
// 事件响应 获取可复活/阵亡的英雄(对应可复活/阵亡英雄等事件)
constant native GetRevivableUnit takes nothing returns unit

// EVENT_PLAYER_HERO_REVIVE_START
// EVENT_PLAYER_HERO_REVIVE_CANCEL
// EVENT_PLAYER_HERO_REVIVE_FINISH
// EVENT_UNIT_HERO_REVIVE_START
// EVENT_UNIT_HERO_REVIVE_CANCEL
// EVENT_UNIT_HERO_REVIVE_FINISH
// 事件响应 获取复活的英雄(对应开始/取消/完成复活英雄和开始/取消/完成复活英雄等事件)
//@ desync handle-op
constant native GetRevivingUnit takes nothing returns unit

//@ desync handle-op 3
// EVENT_PLAYER_UNIT_ATTACKED
// 事件响应 获取攻击的单位(对应单位被攻击等事件)
constant native GetAttacker takes nothing returns unit

//@ desync handle-op 3
// EVENT_PLAYER_UNIT_RESCUED
// 获取营救单位(对应单位被营救等事件)
constant native GetRescuer  takes nothing returns unit

//@ desync handle-op 5
// EVENT_PLAYER_UNIT_DEATH
// 事件响应 获取死亡单位(对应单位死亡等事件)
constant native GetDyingUnit takes nothing returns unit
// 事件响应 获取凶手单位(对应单位死亡等事件)
constant native GetKillingUnit takes nothing returns unit

//@ desync handle-op 3
// EVENT_PLAYER_UNIT_DECAY
// 事件响应 获取尸体腐烂单位(对应单位尸体腐烂等事件)
constant native GetDecayingUnit takes nothing returns unit

// EVENT_PLAYER_UNIT_SELECTED
//constant native GetSelectedUnit takes nothing returns unit

//@ desync handle-op 3
// EVENT_PLAYER_UNIT_CONSTRUCT_START
// 事件响应 获取正在建造的建筑(对应开始建造单位等事件)
constant native GetConstructingStructure takes nothing returns unit

//@ desync handle-op 6
// EVENT_PLAYER_UNIT_CONSTRUCT_FINISH
// EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL
// 事件响应 获取取消建造的建筑(对应完成/取消建造单位等事件)
constant native GetCancelledStructure takes nothing returns unit
// 事件响应 获取已建造的建筑(对应完成/取消建造单位等事件)
constant native GetConstructedStructure takes nothing returns unit

// EVENT_PLAYER_UNIT_RESEARCH_START
// EVENT_PLAYER_UNIT_RESEARCH_CANCEL
// EVENT_PLAYER_UNIT_RESEARCH_FINISH
//@ desync handle-op 4
// 事件响应 获取研究科技的单位(对应开始/完成/取消研究科技等事件)
constant native GetResearchingUnit takes nothing returns unit
// 事件响应 获取研究的科技类型(对应开始/完成/取消研究科技等事件)
constant native GetResearched takes nothing returns integer

// EVENT_PLAYER_UNIT_TRAIN_START
// EVENT_PLAYER_UNIT_TRAIN_CANCEL
//@ desync handle-op 2
// 事件响应 获取训练的单位类型(对应开始/完成/取消训练单位等事件)
constant native GetTrainedUnitType takes nothing returns integer

// EVENT_PLAYER_UNIT_TRAIN_FINISH
//@ desync handle-op 2
// 事件响应 获取训练的单位(对应完成训练单位等事件)
constant native GetTrainedUnit takes nothing returns unit

// EVENT_PLAYER_UNIT_DETECTED
//@ desync handle-op 2
// 事件响应 获取被侦测的单位(对应单位被侦测到等事件)（被反隐看到的单位）
constant native GetDetectedUnit takes nothing returns unit

//@ desync handle-op 5
// EVENT_PLAYER_UNIT_SUMMONED
// 事件响应 获取正在召唤的单位(对应召唤单位等事件)
constant native GetSummoningUnit    takes nothing returns unit
// 事件响应 获取被召唤单位(对应召唤单位等事件)
constant native GetSummonedUnit     takes nothing returns unit

//@ desync handle-op 7
// EVENT_PLAYER_UNIT_LOADED
// 事件响应 获取运输/载具单位(对应装载单位等事件)
// 飞艇/船/被缠绕的金矿等
constant native GetTransportUnit    takes nothing returns unit
// 事件响应 获取被装载单位(对应装载单位等事件)
// 在飞艇/船内、在缠绕的金矿内的单位都可装载单位
constant native GetLoadedUnit       takes nothing returns unit

//@ desync handle-op 7
// EVENT_PLAYER_UNIT_SELL
// 事件响应 获取出售单位(对应出售单位等事件)
constant native GetSellingUnit      takes nothing returns unit
// 事件响应 获取被出售单位(对应出售单位等事件)
constant native GetSoldUnit         takes nothing returns unit
// 事件响应 获取购买单位(对应出售单位等事件)
constant native GetBuyingUnit       takes nothing returns unit

//@ desync handle-op 3
// EVENT_PLAYER_UNIT_SELL_ITEM
// 事件响应 获取卖出的物品(对应出售物品等事件)
constant native GetSoldItem         takes nothing returns item

//@ desync handle-op 5
// EVENT_PLAYER_UNIT_CHANGE_OWNER
// 事件响应 获取变更了所属(玩家)的单位(对应变更单位所属等事件)
constant native GetChangingUnit             takes nothing returns unit
// 事件响应 获取变更所属单位的前一个所属(玩家)(对应变更单位所属等事件)
constant native GetChangingUnitPrevOwner    takes nothing returns player

// EVENT_PLAYER_UNIT_DROP_ITEM
// EVENT_PLAYER_UNIT_PICKUP_ITEM
// EVENT_PLAYER_UNIT_USE_ITEM
//@ desync handle-op 4
// 事件响应 获取操作物品的单位(对应丢弃/拾取/使用物品等事件)
constant native GetManipulatingUnit takes nothing returns unit
// 事件响应 获取被操作的物品(对应丢弃/拾取/使用物品等事件)
constant native GetManipulatedItem  takes nothing returns item

//@ desync handle-op 3
// EVENT_PLAYER_UNIT_ISSUED_ORDER
// 事件响应 获取收到命令的单位(对应发布命令等事件)
constant native GetOrderedUnit takes nothing returns unit
// 事件响应 获取发布的命令ID
constant native GetIssuedOrderId takes nothing returns integer

// EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER
// 事件响应 获取命令目标点 X 坐标 [R](对应发布命令(指定点)等事件)
constant native GetOrderPointX takes nothing returns real
// 事件响应 获取命令目标点 Y 坐标 [R](对应发布命令(指定点)等事件)
constant native GetOrderPointY takes nothing returns real
// 事件响应 获取命令目标点(对应发布命令(指定点)等事件)
//@ desync handle-op 2
// 会创建点，用完请注意排泄
constant native GetOrderPointLoc takes nothing returns location

//@ desync handle-op 9
// EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER
// 事件响应 获取命令目标(单位/物品/可破坏物)(对应发布命令(指定目标，可以是单位、物品、可破坏物)等事件)
constant native GetOrderTarget              takes nothing returns widget
// 事件响应 获取命令目标(可破坏物)(对应发布命令(指定目标，可以是单位、物品、可破坏物)等事件)
constant native GetOrderTargetDestructable  takes nothing returns destructable
// 事件响应 获取命令目标(物品)(对应发布命令(指定目标，可以是单位、物品、可破坏物)等事件)
constant native GetOrderTargetItem          takes nothing returns item
// 事件响应 获取命令目标(单位)(对应发布命令(指定目标，可以是单位、物品、可破坏物)等事件)
constant native GetOrderTargetUnit          takes nothing returns unit

// EVENT_UNIT_SPELL_CHANNEL
// EVENT_UNIT_SPELL_CAST
// EVENT_UNIT_SPELL_EFFECT
// EVENT_UNIT_SPELL_FINISH
// EVENT_UNIT_SPELL_ENDCAST
// EVENT_PLAYER_UNIT_SPELL_CHANNEL
// EVENT_PLAYER_UNIT_SPELL_CAST
// EVENT_PLAYER_UNIT_SPELL_EFFECT
// EVENT_PLAYER_UNIT_SPELL_FINISH
// EVENT_PLAYER_UNIT_SPELL_ENDCAST
//@ desync handle-op 2
// 事件响应 获取释放技能的单位
constant native GetSpellAbilityUnit         takes nothing returns unit
// 事件响应 获取被释放技能的ID
constant native GetSpellAbilityId           takes nothing returns integer
//@ desync handle-op 2
// 事件响应 获取被释放的技能
constant native GetSpellAbility             takes nothing returns ability
// 事件响应 获取被释放技能的目标(点)
//@ desync handle-op 2
// 会创建点，用完请注意排泄
constant native GetSpellTargetLoc           takes nothing returns location
// 事件响应 获取被释放技能的目标(点 X 坐标)
constant native GetSpellTargetX				takes nothing returns real
// 事件响应 获取被释放技能的目标(点 Y 坐标)
constant native GetSpellTargetY				takes nothing returns real
//@ desync handle-op 6
// 事件响应 获取被释放技能的目标(可破坏物)
constant native GetSpellTargetDestructable  takes nothing returns destructable
// 事件响应 获取被释放技能的目标(物品)
constant native GetSpellTargetItem          takes nothing returns item
// 事件响应 获取被释放技能的目标(单位)
constant native GetSpellTargetUnit          takes nothing returns unit

//@ nodiscard 5
//@ desync handle-op 4
// 触发器登记玩家联盟类型变更事件(特殊)
native TriggerRegisterPlayerAllianceChange takes trigger whichTrigger, player whichPlayer, alliancetype whichAlliance returns event
// 触发器登记玩家状态事件
native TriggerRegisterPlayerStateEvent takes trigger whichTrigger, player whichPlayer, playerstate whichState, limitop opcode, real limitval returns event

//@ desync handle-op 3
// EVENT_PLAYER_STATE_LIMIT
// 事件响应 获取玩家状态(对应设置玩家状态等事件)
constant native GetEventPlayerState takes nothing returns playerstate

//@ nodiscard 5
//@ desync handle-op 4
// 触发器登记玩家输入聊天信息事件
// @param chatMessageToDetect输入的聊天信息
// @param exactMatchOnly输入的聊天信息是否需要完全匹配
native TriggerRegisterPlayerChatEvent takes trigger whichTrigger, player whichPlayer, string chatMessageToDetect, boolean exactMatchOnly returns event

// EVENT_PLAYER_CHAT

// returns the actual string they typed in ( same as what you registered for
// if you required exact match )
// 事件响应 获取输入的聊天字符(对应玩家输入聊天信息等事件)
// 返回实际输入的字符串，如需完全匹配，则返回指定的字符串
constant native GetEventPlayerChatString takes nothing returns string

// returns the string that you registered for
// 获取匹配的聊天字符(对应玩家输入聊天信息等事件)
// 返回指定的字符串
constant native GetEventPlayerChatStringMatched takes nothing returns string

//@ nodiscard 3
//@ desync handle-op 2
// 触发器登记单位/物品/可破坏物死亡事件
native TriggerRegisterDeathEvent takes trigger whichTrigger, widget whichWidget returns event

//============================================================================
// Trigger Unit Based Event API
//============================================================================

// returns handle to unit which triggered the most recent event when called from
// within a trigger action function...returns null handle when used incorrectly

//@ desync handle-op 2
// 事件响应 获取触发单位
constant native GetTriggerUnit takes nothing returns unit

//@ nodiscard 4
//@ desync handle-op 3
// 触发器登记单位状态事件
// @param whichState 单位状态 [UNIT_STATE_LIFE, UNIT_STATE_MAX_LIFE, UNIT_STATE_MANA, UNIT_STATE_MAX_MANA]
native TriggerRegisterUnitStateEvent takes trigger whichTrigger, unit whichUnit, unitstate whichState, limitop opcode, real limitval returns event

//@ desync handle-op 3
// EVENT_UNIT_STATE_LIMIT
// 事件响应 获取单位状态(对应设置单位状态等事件)
constant native GetEventUnitState takes nothing returns unitstate

//@ nodiscard 3
//@ desync handle-op 2
// 触发器登记单位指定事件
native TriggerRegisterUnitEvent takes trigger whichTrigger, unit whichUnit, unitevent whichEvent returns event

// EVENT_UNIT_DAMAGED
// 事件响应 获取被伤害后损失的生命值(对应单位受到伤害等事件)
constant native GetEventDamage takes nothing returns real
//@ desync handle-op 2
// 事件响应 获取造成伤害的单位(对应单位受到伤害等事件)
constant native GetEventDamageSource takes nothing returns unit

// EVENT_UNIT_DEATH
// EVENT_UNIT_DECAY
// Use the GetDyingUnit and GetDecayingUnit funcs above

// EVENT_UNIT_DETECTED 
// 事件响应 获取侦测单位的玩家(对应单位被侦测到等事件)（操作反隐的玩家）
constant native GetEventDetectingPlayer takes nothing returns player

//@ nodiscard 3
//@ desync handle-op 2
// 事件响应 触发器登记玩家单位事件
native TriggerRegisterFilterUnitEvent takes trigger whichTrigger, unit whichUnit, unitevent whichEvent, boolexpr filter returns event

// EVENT_UNIT_ACQUIRED_TARGET
// EVENT_UNIT_TARGET_IN_RANGE
// 获取事件目标单位(对应单位获取到目标及目标进入单位获取范围等事件)
constant native GetEventTargetUnit takes nothing returns unit

// EVENT_UNIT_ATTACKED
// Use GetAttacker from the Player Unit Event API Below...

// EVENT_UNIT_RESCUEDED
// Use GetRescuer from the Player Unit Event API Below...

// EVENT_UNIT_CONSTRUCT_CANCEL
// EVENT_UNIT_CONSTRUCT_FINISH

// See the Player Unit Construction Event API above for event info funcs

// EVENT_UNIT_TRAIN_START
// EVENT_UNIT_TRAIN_CANCELLED
// EVENT_UNIT_TRAIN_FINISH

// See the Player Unit Training Event API above for event info funcs

// EVENT_UNIT_SELL

// See the Player Unit Sell Event API above for event info funcs

// EVENT_UNIT_DROP_ITEM
// EVENT_UNIT_PICKUP_ITEM
// EVENT_UNIT_USE_ITEM
// See the Player Unit/Item manipulation Event API above for event info funcs

// EVENT_UNIT_ISSUED_ORDER
// EVENT_UNIT_ISSUED_POINT_ORDER
// EVENT_UNIT_ISSUED_TARGET_ORDER

// See the Player Unit Order Event API above for event info funcs

// 触发器登记范围内单位事件
//@ nodiscard 2
//@ desync handle-op
native TriggerRegisterUnitInRange takes trigger whichTrigger, unit whichUnit, real range, boolexpr filter returns event

//@ nodiscard 3
//@ desync handle-op 7
// 添加触发器条件方法（指定条件表达式）
native TriggerAddCondition    takes trigger whichTrigger, boolexpr condition returns triggercondition
// 删除触发器条件方法
native TriggerRemoveCondition takes trigger whichTrigger, triggercondition whichCondition returns nothing
// 清空触发器条件方法
// 排泄需使用删除触发器条件方法 TriggerRemoveCondition，而非清空
native TriggerClearConditions takes trigger whichTrigger returns nothing

//@ nodiscard 3
//@ desync handle-op 12
// 添加触发器动作
native TriggerAddAction     takes trigger whichTrigger, code actionFunc returns triggeraction
// 删除触发器动作
native TriggerRemoveAction  takes trigger whichTrigger, triggeraction whichAction returns nothing
// 清空触发器动作
// 排泄需使用删除触发器动作 TriggerRemoveAction，而非清空
native TriggerClearActions  takes trigger whichTrigger returns nothing
// 等待实际时间(指定时间)
native TriggerSleepAction   takes real timeout returns nothing
// 等到指定音效结束前N秒（指定时间）
// @deprecated 弃用函数
native TriggerWaitForSound  takes sound s, real offset returns nothing
// 判断触发器条件是否满足
//@ nodiscard
native TriggerEvaluate      takes trigger whichTrigger returns boolean
//@ desync handle-op 9
// 运行触发器 (忽略条件)
native TriggerExecute       takes trigger whichTrigger returns nothing
// 等待运行触发器 (忽略条件)
// @deprecated 弃用函数
native TriggerExecuteWait   takes trigger whichTrigger returns nothing
// 触发器同步开始
native TriggerSyncStart     takes nothing returns nothing
// 触发器同步准备完成
native TriggerSyncReady     takes nothing returns nothing

//============================================================================
// Widget API
// 获取指定单位/物品/可破坏物生命值
native  GetWidgetLife   takes widget whichWidget returns real
// 设置指定单位/物品/可破坏物生命值
native  SetWidgetLife   takes widget whichWidget, real newLife returns nothing
// 获取指定单位/物品/可破坏物 X 坐标
native  GetWidgetX      takes widget whichWidget returns real
// 获取指定单位/物品/可破坏物 Y 坐标
native  GetWidgetY      takes widget whichWidget returns real
//@ desync handle-op 2
// 获取触发单位/物品/可破坏物
constant native GetTriggerWidget takes nothing returns widget

//============================================================================
// Destructable Object API
// Facing arguments are specified in degrees
//@ desync handle-op 8
// 新建可破坏物(未毁坏)(指定类型、X坐标，Y坐标，朝向度，尺寸，样式)
native          CreateDestructable          takes integer objectid, real x, real y, real face, real scale, integer variation returns destructable
// 新建可破坏物 [R](未毁坏)(指定类型、X坐标，Y坐标，朝向度，尺寸，样式)
native          CreateDestructableZ         takes integer objectid, real x, real y, real z, real face, real scale, integer variation returns destructable
// 新建可破坏物(毁坏的，如砍伐完的树，毁坏的门/柱)(指定类型、X坐标，Y坐标，朝向度，尺寸，样式)
native          CreateDeadDestructable      takes integer objectid, real x, real y, real face, real scale, integer variation returns destructable
// 新建可破坏物(毁坏的，如砍伐完的树，毁坏的门/柱) [R](指定类型、X坐标，Y坐标，朝向度，尺寸，样式)
native          CreateDeadDestructableZ     takes integer objectid, real x, real y, real z, real face, real scale, integer variation returns destructable
//@ desync handle-op 39
// 删除可破坏物
native          RemoveDestructable          takes destructable d returns nothing
// 杀死指定可破坏物(变成 毁坏的)
native          KillDestructable            takes destructable d returns nothing
// 设置指定可破坏物是否可见
native          SetDestructableInvulnerable takes destructable d, boolean flag returns nothing
// 查询指定可破坏物是否可见
native          IsDestructableInvulnerable  takes destructable d returns boolean
// 选取指定区域(filter可附带条件表达式)的可破坏物执行指定动作(actionFunc可指定动作)
native          EnumDestructablesInRect     takes rect r, boolexpr filter, code actionFunc returns nothing
// 获取指定可破坏物的类型
native          GetDestructableTypeId       takes destructable d returns integer
// 获取指定可破坏物 X 坐标 [R]
native          GetDestructableX            takes destructable d returns real
// 获取指定可破坏物 Y 坐标 [R]
native          GetDestructableY            takes destructable d returns real
// 设置指定可破坏物生命值
native          SetDestructableLife         takes destructable d, real life returns nothing
// 获取指定可破坏物生命值
native          GetDestructableLife         takes destructable d returns real
// 设置指定可破坏物最大生命值
native          SetDestructableMaxLife      takes destructable d, real max returns nothing
// 获取指定可破坏物最大生命值
native          GetDestructableMaxLife      takes destructable d returns real
// 复活指定可破坏物(指定生命值)(变回 未毁坏)
native          DestructableRestoreLife     takes destructable d, real life, boolean birth returns nothing
// 队列指定可破坏物动画
native          QueueDestructableAnimation  takes destructable d, string whichAnimation returns nothing
// 设置指定可破坏物动画
native          SetDestructableAnimation    takes destructable d, string whichAnimation returns nothing
// 设置指定可破坏物动画播放速度 [R]
native          SetDestructableAnimationSpeed takes destructable d, real speedFactor returns nothing
// 显示/隐藏 指定可破坏物[R]
// 隐藏后反隐也看不到，但其碰撞体积仍可生效
native          ShowDestructable            takes destructable d, boolean flag returns nothing
// 获取指定可破坏物闭塞高度
native          GetDestructableOccluderHeight takes destructable d returns real
// 设置指定可破坏物的闭塞高度
native          SetDestructableOccluderHeight takes destructable d, real height returns nothing
//@ desync danger 2
// 获取指定可破坏物名称
native          GetDestructableName         takes destructable d returns string
//@ desync handle-op 2
// 获取触发的可破坏物
constant native GetTriggerDestructable takes nothing returns destructable

//============================================================================
// Item API
//@ desync handle-op 6
// 创建物品(指定坐标)
native          CreateItem      takes integer itemid, real x, real y returns item
// 删除物品
native          RemoveItem      takes item whichItem returns nothing
// 获取指定物品的所属玩家
native          GetItemPlayer   takes item whichItem returns player
// 获取指定物品物品类型(4字编码)
native          GetItemTypeId   takes item i returns integer
// 获取指定物品 X 坐标 [R]
native          GetItemX        takes item i returns real
// 获取指定物品 Y 坐标 [R]
native          GetItemY        takes item i returns real
// 移动指定物品到坐标(立即)(指定坐标) [R]
//@ desync handle-op
native          SetItemPosition takes item i, real x, real y returns nothing
//@ desync handle-op 15
// 允许/禁止 指定物品死亡时掉落
native          SetItemDropOnDeath  takes item whichItem, boolean flag returns nothing
// 允许/禁止 指定物品被丢弃
native          SetItemDroppable takes item i, boolean flag returns nothing
// 允许/禁止 指定物品被抵押
native          SetItemPawnable takes item i, boolean flag returns nothing
// 设置指定物品的所属玩家
native          SetItemPlayer    takes item whichItem, player whichPlayer, boolean changeColor returns nothing
// 设置指定物品 无敌/可攻击
native          SetItemInvulnerable takes item whichItem, boolean flag returns nothing
// 查询指定物品是否无敌
native          IsItemInvulnerable  takes item whichItem returns boolean
// 显示/隐藏 指定物品 [R]
// 隐藏后反隐也看不到
native          SetItemVisible  takes item whichItem, boolean show returns nothing
// 查询指定物品是否可见 [R]
native          IsItemVisible   takes item whichItem returns boolean
// 查询指定物品所属是否当前持有玩家
native          IsItemOwned     takes item whichItem returns boolean
// 查询指定物品是否拾取时自动使用 [R]
native          IsItemPowerup   takes item whichItem returns boolean
// 查询指定物品是否可在市场随机出售 [R]
native          IsItemSellable  takes item whichItem returns boolean
// 查询指定物品是否可被抵押 [R]
native          IsItemPawnable  takes item whichItem returns boolean
// 查询指定物品类型是否拾取时自动使用
native          IsItemIdPowerup takes integer itemId returns boolean
// 查询指定物品类型是否可以被市场出售
native          IsItemIdSellable takes integer itemId returns boolean
// 查询指定物品类型是否可以被抵押
native          IsItemIdPawnable takes integer itemId returns boolean
// 选取区域内所有物品做动作
// @param r区域
// @param filter条件表达式
// @param actionFunc动作
//@ desync handle-op 
native          EnumItemsInRect     takes rect r, boolexpr filter, code actionFunc returns nothing
// 获取指定物品等级
native          GetItemLevel    takes item whichItem returns integer
// 获取指定物品分类
native          GetItemType     takes item whichItem returns itemtype
//@ desync handle-op 2 
// 设置掉落指定物品的单位类型
native          SetItemDropID   takes item whichItem, integer unitId returns nothing
// 获取指定物品名称
constant native GetItemName     takes item whichItem returns string
// 获取指定物品使用次数
native          GetItemCharges  takes item whichItem returns integer
//@ desync handle-op 2 
// 设置指定物品使用次数
native          SetItemCharges  takes item whichItem, integer charges returns nothing
// 获取指定物品自定义值
native          GetItemUserData takes item whichItem returns integer
//@ desync handle-op 2 
// 设置指定物品自定义值
native          SetItemUserData takes item whichItem, integer data returns nothing

//============================================================================
// Unit API
// Facing arguments are specified in degrees
//@ desync handle-op 12
// 新建单位(指定单位类型及坐标) [R]
native          CreateUnit              takes player id, integer unitid, real x, real y, real face returns unit
// 新建单位(指定单位名称及坐标) [R]
// @param unitname 单位名称，不区分大小写，可在 common.ai 和 jass.config.json 文件找到
native          CreateUnitByName        takes player whichPlayer, string unitname, real x, real y, real face returns unit
// 新建单位(指定单位类型及点) [R]
native          CreateUnitAtLoc         takes player id, integer unitid, location whichLocation, real face returns unit
// 新建单位(指定单位名称及点) [R]
// @param unitname 单位名称，不区分大小写，可在 common.ai 和 jass.config.json 文件找到
native          CreateUnitAtLocByName   takes player id, string unitname, location whichLocation, real face returns unit
// 新建尸体 [R]
native          CreateCorpse            takes player whichPlayer, integer unitid, real x, real y, real face returns unit

//@ desync handle-op 7
// 杀死单位
native          KillUnit            takes unit whichUnit returns nothing
// 删除单位，删除不会留下尸体
native          RemoveUnit          takes unit whichUnit returns nothing
// 显示/隐藏 指定单位 [R]
// 隐藏后反隐也看不到，但其碰撞体积仍可按设置工作
native          ShowUnit            takes unit whichUnit, boolean show returns nothing

// 设置指定单位属性 [R]
// @param whichUnitState 单位属性，可选 UNIT_STATE_LIFE, UNIT_STATE_MAX_LIFE, UNIT_STATE_MANA, UNIT_STATE_MAX_MANA
native          SetUnitState        takes unit whichUnit, unitstate whichUnitState, real newVal returns nothing
//@ desync handle-op 24
// 设置指定单位 X 坐标 [R]
native          SetUnitX            takes unit whichUnit, real newX returns nothing
// 设置指定单位 Y 坐标 [R]
native          SetUnitY            takes unit whichUnit, real newY returns nothing
// 移动指定单位(立即)(指定坐标) [R]
native          SetUnitPosition     takes unit whichUnit, real newX, real newY returns nothing
// 移动指定单位(立即)(指定点)
native          SetUnitPositionLoc  takes unit whichUnit, location whichLocation returns nothing
// 设置指定单位朝向 [R]
native          SetUnitFacing       takes unit whichUnit, real facingAngle returns nothing
// 设置指定单位朝向(指定转身持续时间)
native          SetUnitFacingTimed  takes unit whichUnit, real facingAngle, real duration returns nothing
// 设置指定单位移动速度
native          SetUnitMoveSpeed    takes unit whichUnit, real newSpeed returns nothing
// 设置指定单位飞行高度
native          SetUnitFlyHeight    takes unit whichUnit, real newHeight, real rate returns nothing
// 设置指定单位转身速度
native          SetUnitTurnSpeed    takes unit whichUnit, real newTurnSpeed returns nothing
// 设置指定单位转向角度(弧度制) [R]
native          SetUnitPropWindow   takes unit whichUnit, real newPropWindowAngle returns nothing
// 设置指定单位警界范围，未设置时默认值取物遍
native          SetUnitAcquireRange takes unit whichUnit, real newAcquireRange returns nothing
// 锁定指定单位警戒职责 [R]
native          SetUnitCreepGuard   takes unit whichUnit, boolean creepGuard returns nothing

// 获取指定单位主动攻击范围 (当前值)，中立敌对玩家单位的当前攻击范围以警戒范围为准
native          GetUnitAcquireRange     takes unit whichUnit returns real
// 获取指定单位转身速度 (当前值)
native          GetUnitTurnSpeed        takes unit whichUnit returns real
// 获取指定单位转向角度(当前值)(弧度制) [R]
native          GetUnitPropWindow       takes unit whichUnit returns real
// 获取指定单位飞行高度 (当前值)
native          GetUnitFlyHeight        takes unit whichUnit returns real

// 获取指定单位主动攻击范围 (默认值)
native          GetUnitDefaultAcquireRange      takes unit whichUnit returns real
// 获取指定单位转身速度 (默认值)
native          GetUnitDefaultTurnSpeed         takes unit whichUnit returns real
// 获取指定单位(头像视窗)转向角度(默认值)
native          GetUnitDefaultPropWindow        takes unit whichUnit returns real
// 获取指定单位飞行高度 (默认值)
native          GetUnitDefaultFlyHeight         takes unit whichUnit returns real

//@ desync handle-op 5
// 设置指定单位所属(指定玩家)
// @param changeColor 是否改变队伍颜色
native          SetUnitOwner        takes unit whichUnit, player whichPlayer, boolean changeColor returns nothing
// 设置指定单位颜色(指定玩家颜色)
native          SetUnitColor        takes unit whichUnit, playercolor whichColor returns nothing

// 设置指定单位尺寸(按倍数) [R]
native          SetUnitScale        takes unit whichUnit, real scaleX, real scaleY, real scaleZ returns nothing
// 设置指定单位动画播放速度(按倍数) [R]
native          SetUnitTimeScale    takes unit whichUnit, real timeScale returns nothing
// 设置指定单位混合时间
native          SetUnitBlendTime    takes unit whichUnit, real blendTime returns nothing
// 设置指定单位顶点颜色(RGB:0-255) [R]
native          SetUnitVertexColor  takes unit whichUnit, integer red, integer green, integer blue, integer alpha returns nothing

//@ desync handle-op 2
// 将指定单位的指定动画加入队列
native          QueueUnitAnimation          takes unit whichUnit, string whichAnimation returns nothing
// 播放指定单位指定动画
native          SetUnitAnimation            takes unit whichUnit, string whichAnimation returns nothing
// 播放指定单位的指定序号动画 [R]
native          SetUnitAnimationByIndex     takes unit whichUnit, integer whichAnimation returns nothing
// 播放指定单位的指定动画
// @param rarity 稀有度：普通的(RARITY_FREQUENT)或罕见的(RARITY_RARE)
native          SetUnitAnimationWithRarity  takes unit whichUnit, string whichAnimation, raritycontrol rarity returns nothing
// 添加/删除 指定单位指定动画附加名 [R]
native          AddUnitAnimationProperties  takes unit whichUnit, string animProperties, boolean add returns nothing

//@ desync handle-op 4
// 设置指定单位身体朝向
native          SetUnitLookAt       takes unit whichUnit, string whichBone, unit lookAtTarget, real offsetX, real offsetY, real offsetZ returns nothing
// 重置指定单位身体朝向
native          ResetUnitLookAt     takes unit whichUnit returns nothing

//@ desync handle-op 4
// 设置指定单位可否营救(指定玩家) [R]
native          SetUnitRescuable    takes unit whichUnit, player byWhichPlayer, boolean flag returns nothing
// 设置指定单位的营救范围
native          SetUnitRescueRange  takes unit whichUnit, real range returns nothing

//@ desync handle-op 6
// 设置指定英雄力量值 [R]
native          SetHeroStr          takes unit whichHero, integer newStr, boolean permanent returns nothing
// 设置指定英雄敏捷值 [R]
native          SetHeroAgi          takes unit whichHero, integer newAgi, boolean permanent returns nothing
// 设置指定英雄智力值 [R]
native          SetHeroInt          takes unit whichHero, integer newInt, boolean permanent returns nothing

// 获取指定英雄力量值 [R]
native          GetHeroStr          takes unit whichHero, boolean includeBonuses returns integer
// 获取指定英雄敏捷值 [R]
native          GetHeroAgi          takes unit whichHero, boolean includeBonuses returns integer
// 获取指定英雄智力值 [R]
native          GetHeroInt          takes unit whichHero, boolean includeBonuses returns integer

//@ nodiscard 5
//@ desync handle-op 4
// 降低指定英雄等级 [R]
// @param howManyLevels 降级数
// 降级时会忘记技能
native          UnitStripHeroLevel  takes unit whichHero, integer howManyLevels returns boolean

// 获取指定英雄经验值
native          GetHeroXP           takes unit whichHero returns integer
//@ desync handle-op 2
// 设置指定英雄经验值
native          SetHeroXP           takes unit whichHero, integer newXpVal,  boolean showEyeCandy returns nothing

// 获取指定英雄未使用的技能点数
native          GetHeroSkillPoints      takes unit whichHero returns integer
//@ nodiscard 4
//@ desync handle-op 3
// 设置指定英雄未使用的技能点数 [R]
// 给与技能点数超过技能可学习等级时，额外的点数无效，拥有额外技能点数时仍遵循技能学习等级及跳级学习限制
native          UnitModifySkillPoints   takes unit whichHero, integer skillPointDelta returns boolean

//@ desync handle-op 7
// 增加指定英雄经验值 [R]
// @param showEyeCandy 因此升级时是否显示升级动画
native          AddHeroXP           takes unit whichHero, integer xpToAdd,   boolean showEyeCandy returns nothing
// 设置指定英雄等级
// @param showEyeCandy 是否显示升级动画，该设置对降级无效
// 降级时会忘记技能
native          SetHeroLevel        takes unit whichHero, integer level,  boolean showEyeCandy returns nothing
// 获取指定英雄等级
constant native GetHeroLevel        takes unit whichHero returns integer
// 获取指定单位等级
constant native GetUnitLevel        takes unit whichUnit returns integer
// 获取指定英雄（本地化语言的）称谓
// 在AI脚本中默认返回null
native          GetHeroProperName   takes unit whichHero returns string
// 允许/禁止 指定英雄获取经验值 [R]
//@ desync handle-op 6
native          SuspendHeroXP       takes unit whichHero, boolean flag returns nothing
// 查询指定英雄是否可获取经验值
native          IsSuspendedXP       takes unit whichHero returns boolean
// 发布学习技能命令(指定英雄)
// 当英雄拥有不能叠加的技能时，此命令似乎无效，比如牛头捡了提供坚韧光环的物品（物编未作任何修改），因为他此时已拥有了坚韧光环（物品技能），在发布该指令后，他可能不会学习他本身的坚韧光环
native          SelectHeroSkill     takes unit whichHero, integer abilcode returns nothing
// 获取指定单位技能等级 [R]
// 对于触发器添加的技能，在AI脚本中似乎只返回0，不论技能是否存在
// 某些技能本身的等级为0，但在AI脚本中，只要单位拥有技能，也会返回等级大于0，比如'Apit'
native          GetUnitAbilityLevel takes unit whichUnit, integer abilcode returns integer
//@ desync handle-op 20
// 降低指定英雄技能等级 [R]
native          DecUnitAbilityLevel takes unit whichUnit, integer abilcode returns integer
// 提升指定英雄技能等级 [R]
native          IncUnitAbilityLevel takes unit whichUnit, integer abilcode returns integer
// 设置指定英雄技能等级 [R]
//@ nodiscard 5
native          SetUnitAbilityLevel takes unit whichUnit, integer abilcode, integer level returns integer
// 立即复活指定英雄(指定坐标) [R]
native          ReviveHero          takes unit whichHero, real x, real y, boolean doEyecandy returns boolean
// 立即复活指定英雄(指定点)
native          ReviveHeroLoc       takes unit whichHero, location loc, boolean doEyecandy returns boolean
// 设置指定单位死亡方式(是否爆炸)
// @param whichUnit 指定单位
// @param exploded 是否爆炸
native          SetUnitExploded     takes unit whichUnit, boolean exploded returns nothing
// 设置指定单位 无敌/可攻击
native          SetUnitInvulnerable takes unit whichUnit, boolean flag returns nothing
// 暂停/恢复 指定单位 [R]
native          PauseUnit           takes unit whichUnit, boolean flag returns nothing
// 查询指定单位是否暂停
native          IsUnitPaused        takes unit whichHero returns boolean
//@ desync handle-op 2
// 打开/关闭 指定单位碰撞体积
native          SetUnitPathing      takes unit whichUnit, boolean flag returns nothing

//@ desync safe 4
// 清除所有选择(鼠标框选的单位/物品/可破坏物)
native          ClearSelection      takes nothing returns nothing
// 选择/取消选择 指定单位
native          SelectUnit          takes unit whichUnit, boolean flag returns nothing

// 获取单位附加值(指定单位)
native          GetUnitPointValue       takes unit whichUnit returns integer
// 获取单位附加值(指定单位类型)
native          GetUnitPointValueByType takes integer unitType returns integer
//native        SetUnitPointValueByType takes integer unitType, integer newPointValue returns nothing

//@ nodiscard 10
//@ desync handle-op 18
// 创建物品(指定单位和物品) [R]
// 如果单位没有物品栏或物品栏已满，将会创建在单位位置
native          UnitAddItem             takes unit whichUnit, item whichItem returns boolean
// 创建物品(指定单位和物品类型)
// 如果单位没有物品栏或物品栏已满，将会创建在单位位置
native          UnitAddItemById         takes unit whichUnit, integer itemId returns item
// 把物品移动到指定物品栏格数(指定单位和物品类型) [R]
// @param itemSlot 物品栏格数：0-5
native          UnitAddItemToSlotById   takes unit whichUnit, integer itemId, integer itemSlot returns boolean
// 丢弃物品到当前位置（指定单位和指定物品）
// 包括不可丢弃的物品
// 单位死亡或删除后，也会正常丢弃
native          UnitRemoveItem          takes unit whichUnit, item whichItem returns nothing
// 丢弃物品到当前位置(指定单位和物品栏格数)
// 不论该格是何物品（包括不可丢弃的物品），都会被丢弃
// 单位死亡或删除后，也能正常丢弃
// @param itemSlot 物品栏格数：0-5
native          UnitRemoveItemFromSlot  takes unit whichUnit, integer itemSlot returns item
// 查询单位是否持有指定物品
native          UnitHasItem             takes unit whichUnit, item whichItem returns boolean
// 获取单位持有的物品(指定物品栏格数)
// @param itemSlot 物品栏格数：0-5
native          UnitItemInSlot          takes unit whichUnit, integer itemSlot returns item
// 获取已存档物品的物品栏格数（指定单位）
native          UnitInventorySize       takes unit whichUnit returns integer

//@ nodiscard 12
//@ desync handle-op 21
// 发布丢弃物品命令(指定坐标) [R]
// 丢弃成功的前提是该物品允许丢弃
native          UnitDropItemPoint       takes unit whichUnit, item whichItem, real x, real y returns boolean
// 发布移动物品命令(指定物品栏格数) [R]
// 丢弃成功的前提是该格的物品允许丢弃
// @param slot 物品栏格数：0-5
native          UnitDropItemSlot        takes unit whichUnit, item whichItem, integer slot returns boolean
// 发布丢弃物品命令(指定单位和目标单位/物品/可破坏物) [R]
// 丢弃成功的前提是该物品允许丢弃
// 指定目标为商店时会卖出物品
native          UnitDropItemTarget      takes unit whichUnit, item whichItem, widget target returns boolean

//@ nodiscard 9
// 发布使用物品命令(无目标)
// 可能只返回false，不论执行成败
native          UnitUseItem             takes unit whichUnit, item whichItem returns boolean
// 发布使用物品命令(指定坐标)
// 可能只返回false，不论执行成败
native          UnitUseItemPoint        takes unit whichUnit, item whichItem, real x, real y returns boolean
// 发布使用物品命令(指定单位)
// 可能只返回false，不论执行成败
native          UnitUseItemTarget       takes unit whichUnit, item whichItem, widget target returns boolean

// 获取指定单位 X 坐标 [R]
constant native GetUnitX            takes unit whichUnit returns real
// 获取指定单位 Y 坐标 [R]
constant native GetUnitY            takes unit whichUnit returns real
//@ desync handle-op 3
// 获取指定单位位置
// 会创建点，用完请注意排泄
constant native GetUnitLoc          takes unit whichUnit returns location
// 获取指定单位朝向
constant native GetUnitFacing       takes unit whichUnit returns real
// 获取指定单位移动速度 (当前值)
constant native GetUnitMoveSpeed    takes unit whichUnit returns real
// 获取指定单位移动速度 (默认值)
constant native GetUnitDefaultMoveSpeed takes unit whichUnit returns real
// 获取指定单位指定状态值，如当前生命值/魔法值，最大生命/魔法值 [R]
// @param whichUnitState 单位状态[UNIT_STATE_LIFE, UNIT_STATE_MAX_LIFE, UNIT_STATE_MANA, UNIT_STATE_MAX_MANA]
constant native GetUnitState        takes unit whichUnit, unitstate whichUnitState returns real
// 获取指定单位所属玩家
constant native GetOwningPlayer     takes unit whichUnit returns player
// 获取指定单位类型(返回四字符码)
constant native GetUnitTypeId       takes unit whichUnit returns integer
// 获取指定单位种族
constant native GetUnitRace         takes unit whichUnit returns race
// 获取指定单位（本地化语言的）名字
// 在AI脚本中默认返回null
constant native GetUnitName         takes unit whichUnit returns string
// 获取指定单位 占用的人口数量(单个)
constant native GetUnitFoodUsed     takes unit whichUnit returns integer
// 获取指定单位 提供的人口数量(单个)
constant native GetUnitFoodMade     takes unit whichUnit returns integer
// 获取指定单位类型 提供的人口数量(单个)
constant native GetFoodMade         takes integer unitId returns integer
// 获取指定单位类型 占用的人口数量(单个)
constant native GetFoodUsed         takes integer unitId returns integer
//@ desync handle-op 2
// 允许/禁止 指定单位占用人口 [R]
native          SetUnitUseFood      takes unit whichUnit, boolean useFood returns nothing

//@ desync handle-op 10
// 获取指定单位集结点(指向点)
// 会创建点，用完请注意排泄
// 建筑的旗子，集结技能
constant native GetUnitRallyPoint           takes unit whichUnit returns location
// 获取指定单位集结点(指向单位)，未指向单位时返回null
// 建筑的旗子，集结技能
constant native GetUnitRallyUnit            takes unit whichUnit returns unit
// 获取指定单位集结点(指向可破坏物(树、石头、门、柱等))，未指向可破坏物时返回null
// 建筑的旗子，集结技能
constant native GetUnitRallyDestructable    takes unit whichUnit returns destructable

// 查询指定单位是否在指定的单位组中
// 在判断单位组的循环内使用时，可能导致游戏爆卡
constant native IsUnitInGroup       takes unit whichUnit, group whichGroup returns boolean
// 查询指定单位是否指定玩家组中任意玩家的单位
constant native IsUnitInForce       takes unit whichUnit, force whichForce returns boolean
// 查询指定单位是否指定玩家的单位
constant native IsUnitOwnedByPlayer takes unit whichUnit, player whichPlayer returns boolean
// 查询指定单位的所属玩家与指定玩家是否盟友关系
constant native IsUnitAlly          takes unit whichUnit, player whichPlayer returns boolean
// 查询指定单位的所属玩家与指定玩家是否敌对关系
constant native IsUnitEnemy         takes unit whichUnit, player whichPlayer returns boolean
// 查询指定单位是否对指定玩家可见（未使用反隐的情况下）
constant native IsUnitVisible       takes unit whichUnit, player whichPlayer returns boolean
// 查询指定单位是否已被指定玩家反隐侦测到
constant native IsUnitDetected      takes unit whichUnit, player whichPlayer returns boolean
// 查询指定单位是否对指定玩家不可见（未使用反隐的情况下）
constant native IsUnitInvisible     takes unit whichUnit, player whichPlayer returns boolean
// 查询指定单位在指定玩家视野中，是否被迷雾遮挡
constant native IsUnitFogged        takes unit whichUnit, player whichPlayer returns boolean
// 查询指定单位是否被黑色阴影遮挡
constant native IsUnitMasked        takes unit whichUnit, player whichPlayer returns boolean
// 查询指定单位是否已被指定玩家选择
constant native IsUnitSelected      takes unit whichUnit, player whichPlayer returns boolean
// 查询指定单位是否指定的种族
constant native IsUnitRace          takes unit whichUnit, race whichRace returns boolean
// 查询指定单位是否指定的单位类型
constant native IsUnitType          takes unit whichUnit, unittype whichUnitType returns boolean
// 查询指定单位是否另一指定单位(两个变量是否指向同一单位)
constant native IsUnit              takes unit whichUnit, unit whichSpecifiedUnit returns boolean
// 查询指定单位是否在指定单位范围内 [R]
constant native IsUnitInRange       takes unit whichUnit, unit otherUnit, real distance returns boolean
// 查询指定单位是否在指定坐标范围内 [R]
constant native IsUnitInRangeXY     takes unit whichUnit, real x, real y, real distance returns boolean
// 查询指定单位是否在指定点范围内 [R]
constant native IsUnitInRangeLoc    takes unit whichUnit, location whichLocation, real distance returns boolean
// 查询指定单位是否隐藏
// 隐藏的单位不受反隐影响，但其碰撞体积仍可按设置工作
constant native IsUnitHidden        takes unit whichUnit returns boolean
// 查询指定单位是否镜像
constant native IsUnitIllusion      takes unit whichUnit returns boolean

// 查询指定单位当前是否被指定运输/载具单位装载
// 可用于查询单位被哪艘（座）船/飞艇/被缠绕的金矿装载（每个载具逐一检查）
constant native IsUnitInTransport   takes unit whichUnit, unit whichTransport returns boolean
// 查询指定单位当前是否被装载(进入被缠绕的金矿、运输飞艇、运输船都属于装载)
constant native IsUnitLoaded        takes unit whichUnit returns boolean

// 查询指定单位ID（四字码）是否为英雄
constant native IsHeroUnitId        takes integer unitId returns boolean
// 查询指定单位ID（四字码）是否为指定单位类型
constant native IsUnitIdType        takes integer unitId, unittype whichUnitType returns boolean

//@ desync handle-op 8
// 允许/禁止 指定单位和指定玩家共享视野 [R]
native UnitShareVision              takes unit whichUnit, player whichPlayer, boolean share returns nothing
// 暂停/恢复 指定尸体腐烂 [R]
native UnitSuspendDecay             takes unit whichUnit, boolean suspend returns nothing
//@ nodiscard 4
// 添加指定单位类型到指定单位 [R]
native UnitAddType                  takes unit whichUnit, unittype whichUnitType returns boolean
// 删除指定单位的指定单位类型 [R]
native UnitRemoveType               takes unit whichUnit, unittype whichUnitType returns boolean

//@ nodiscard 6
//@ desync handle-op 11
// 添加指定技能到指定单位 [R]
// 添加的技能默认为非永久性，会在单位变身恢复时消失，若要不消失，需设置技能永久性 UnitMakeAbilityPermanent
native UnitAddAbility               takes unit whichUnit, integer abilityId returns boolean
// 删除指定单位的指定技能 [R]
native UnitRemoveAbility            takes unit whichUnit, integer abilityId returns boolean
// 允许/禁止 指定单位技能永久性 [R]
//@ nodiscard
native UnitMakeAbilityPermanent     takes unit whichUnit, boolean permanent, integer abilityId returns boolean
// 删除指定单位的魔法效果(Buff) (指定极性) [R]
native UnitRemoveBuffs              takes unit whichUnit, boolean removePositive, boolean removeNegative returns nothing
// 删除指定单位的魔法效果(Buff) (指定详细类别) [R]
native UnitRemoveBuffsEx            takes unit whichUnit, boolean removePositive, boolean removeNegative, boolean magic, boolean physical, boolean timedLife, boolean aura, boolean autoDispel returns nothing
// 查询指定单位是否拥有 魔法效果(Buff) [R]
native UnitHasBuffsEx               takes unit whichUnit, boolean removePositive, boolean removeNegative, boolean magic, boolean physical, boolean timedLife, boolean aura, boolean autoDispel returns boolean
// 查询指定单位拥有的 魔法效果(Buff) 数量 [R]
native UnitCountBuffsEx             takes unit whichUnit, boolean removePositive, boolean removeNegative, boolean magic, boolean physical, boolean timedLife, boolean aura, boolean autoDispel returns integer
//@ desync handle-op 3
// 设置指定单位睡眠
// @param add 真为睡眠，假为清醒
native UnitAddSleep                 takes unit whichUnit, boolean add returns nothing
// 查询指定单位晚上是否会睡眠
native UnitCanSleep                 takes unit whichUnit returns boolean
// 设置指定单位的睡眠状态(不受挑衅时)
// @param add 真为睡眠，假为清醒
native UnitAddSleepPerm             takes unit whichUnit, boolean add returns nothing
//@ desync handle-op 3
// 设置指定单位的睡眠状态(在晚上)
// @param add 真为睡眠，假为清醒
native UnitCanSleepPerm             takes unit whichUnit returns boolean
// 查询单位是否正在睡眠
native UnitIsSleeping               takes unit whichUnit returns boolean
// 查询单位是否清醒，可用于判断本身不眠的野外生物，如石头人，或被编入中立敌对的非野外生物单位，如正常的四族单位
native UnitWakeUp                   takes unit whichUnit returns nothing
// 设置指定单位限时生命 [R]
// @param buffId 魔法效果(buff)类型，只支持 'BTLF','BUan','Bapl','BEfn','Bhwd','BHwe','Brai'
//@ desync handle-op
native UnitApplyTimedLife           takes unit whichUnit, integer buffId, real duration returns nothing
// 设置指定单位忽略报警
//@ nodiscard 2
//@ desync handle-op
native UnitIgnoreAlarm              takes unit whichUnit, boolean flag returns boolean
// 查询指定单位是否忽略报警
//@ desync handle-op
native UnitIgnoreAlarmToggled       takes unit whichUnit returns boolean
// 重设指定单位(所有)技能冷却时间
//@ desync handle-op
native UnitResetCooldown            takes unit whichUnit returns nothing
// 设置指定建筑建造进度(百分比)
//@ desync handle-op
native UnitSetConstructionProgress  takes unit whichUnit, integer constructionPercentage returns nothing
// 设置指定科技研究进度(百分比)
//@ desync handle-op
native UnitSetUpgradeProgress       takes unit whichUnit, integer upgradePercentage returns nothing
// 暂停/恢复 指定单位限时生命 [R]
//@ desync handle-op
native UnitPauseTimedLife           takes unit whichUnit, boolean flag returns nothing
// 启用/禁用 单位的小地图特殊图标
// 禁用后只是未探索该单位前不显示，战役地图中利用此操作隐藏中立建筑物，这样进入游戏时玩家就不能在小地图中未探索的迷雾遮罩区域看到商店泉水之类的中立建筑图标
// 需要完全隐藏应该还是要改物编的不显示中立建筑图标
//@ desync handle-op
native UnitSetUsesAltIcon           takes unit whichUnit, boolean flag returns nothing

//@ nodiscard 18
//@ desync handle-op 17
// 发布伤害区域命令（指定单位） [R]
// @param delay 延迟时间
// @param amount 伤害量
// @param attack 是否攻击伤害
// @param ranged 是否远程攻击
// @param attackType 攻击类型 [ATTACK_TYPE_NORMAL,ATTACK_TYPE_MELEE,ATTACK_TYPE_PIERCE,ATTACK_TYPE_SIEGE,ATTACK_TYPE_MAGIC,ATTACK_TYPE_CHAOS,ATTACK_TYPE_HERO]
// @param damageType 伤害类型 [DAMAGE_TYPE_UNKNOWN,DAMAGE_TYPE_NORMAL,DAMAGE_TYPE_ENHANCED,DAMAGE_TYPE_FIRE,DAMAGE_TYPE_COLD,DAMAGE_TYPE_LIGHTNING,DAMAGE_TYPE_POISON,DAMAGE_TYPE_DISEASE,DAMAGE_TYPE_DIVINE,DAMAGE_TYPE_MAGIC,DAMAGE_TYPE_SONIC,DAMAGE_TYPE_ACID,DAMAGE_TYPE_FORCE,DAMAGE_TYPE_DEATH,DAMAGE_TYPE_MIND,DAMAGE_TYPE_PLANT,DAMAGE_TYPE_DEFENSIVE,DAMAGE_TYPE_DEMOLITION,DAMAGE_TYPE_SLOW_POISON,DAMAGE_TYPE_SPIRIT_LINK,DAMAGE_TYPE_SHADOW_STRIKE,DAMAGE_TYPE_UNIVERSAL]
// @param weaponType 武器类型（造成伤害时发出哪种武器声音） [WEAPON_TYPE_WHOKNOWS,WEAPON_TYPE_METAL_LIGHT_CHOP,WEAPON_TYPE_METAL_MEDIUM_CHOP,WEAPON_TYPE_METAL_HEAVY_CHOP,WEAPON_TYPE_METAL_LIGHT_SLICE,WEAPON_TYPE_METAL_MEDIUM_SLICE,WEAPON_TYPE_METAL_HEAVY_SLICE,WEAPON_TYPE_METAL_MEDIUM_BASH,WEAPON_TYPE_METAL_HEAVY_BASH,WEAPON_TYPE_METAL_MEDIUM_STAB,WEAPON_TYPE_METAL_HEAVY_STAB,WEAPON_TYPE_WOOD_LIGHT_SLICE,WEAPON_TYPE_WOOD_MEDIUM_SLICE,WEAPON_TYPE_WOOD_HEAVY_SLICE,WEAPON_TYPE_WOOD_LIGHT_BASH,WEAPON_TYPE_WOOD_MEDIUM_BASH,WEAPON_TYPE_WOOD_HEAVY_BASH,WEAPON_TYPE_WOOD_LIGHT_STAB,WEAPON_TYPE_WOOD_MEDIUM_STAB,WEAPON_TYPE_CLAW_LIGHT_SLICE,WEAPON_TYPE_CLAW_MEDIUM_SLICE,WEAPON_TYPE_CLAW_HEAVY_SLICE,WEAPON_TYPE_AXE_MEDIUM_CHOP,WEAPON_TYPE_ROCK_HEAVY_BASH]
native UnitDamagePoint              takes unit whichUnit, real delay, real radius, real x, real y, real amount, boolean attack, boolean ranged, attacktype attackType, damagetype damageType, weapontype weaponType returns boolean
// 发布伤害目标（单位/物品/可破坏物）命令（指定单位） [R]
// @param amount 伤害量
// @param attack 是否攻击伤害
// @param ranged 是否远程攻击
// @param attackType 攻击类型 [ATTACK_TYPE_NORMAL,ATTACK_TYPE_MELEE,ATTACK_TYPE_PIERCE,ATTACK_TYPE_SIEGE,ATTACK_TYPE_MAGIC,ATTACK_TYPE_CHAOS,ATTACK_TYPE_HERO]
// @param damageType 伤害类型 [DAMAGE_TYPE_UNKNOWN,DAMAGE_TYPE_NORMAL,DAMAGE_TYPE_ENHANCED,DAMAGE_TYPE_FIRE,DAMAGE_TYPE_COLD,DAMAGE_TYPE_LIGHTNING,DAMAGE_TYPE_POISON,DAMAGE_TYPE_DISEASE,DAMAGE_TYPE_DIVINE,DAMAGE_TYPE_MAGIC,DAMAGE_TYPE_SONIC,DAMAGE_TYPE_ACID,DAMAGE_TYPE_FORCE,DAMAGE_TYPE_DEATH,DAMAGE_TYPE_MIND,DAMAGE_TYPE_PLANT,DAMAGE_TYPE_DEFENSIVE,DAMAGE_TYPE_DEMOLITION,DAMAGE_TYPE_SLOW_POISON,DAMAGE_TYPE_SPIRIT_LINK,DAMAGE_TYPE_SHADOW_STRIKE,DAMAGE_TYPE_UNIVERSAL]
// @param weaponType 武器类型（造成伤害时发出哪种武器声音） [WEAPON_TYPE_WHOKNOWS,WEAPON_TYPE_METAL_LIGHT_CHOP,WEAPON_TYPE_METAL_MEDIUM_CHOP,WEAPON_TYPE_METAL_HEAVY_CHOP,WEAPON_TYPE_METAL_LIGHT_SLICE,WEAPON_TYPE_METAL_MEDIUM_SLICE,WEAPON_TYPE_METAL_HEAVY_SLICE,WEAPON_TYPE_METAL_MEDIUM_BASH,WEAPON_TYPE_METAL_HEAVY_BASH,WEAPON_TYPE_METAL_MEDIUM_STAB,WEAPON_TYPE_METAL_HEAVY_STAB,WEAPON_TYPE_WOOD_LIGHT_SLICE,WEAPON_TYPE_WOOD_MEDIUM_SLICE,WEAPON_TYPE_WOOD_HEAVY_SLICE,WEAPON_TYPE_WOOD_LIGHT_BASH,WEAPON_TYPE_WOOD_MEDIUM_BASH,WEAPON_TYPE_WOOD_HEAVY_BASH,WEAPON_TYPE_WOOD_LIGHT_STAB,WEAPON_TYPE_WOOD_MEDIUM_STAB,WEAPON_TYPE_CLAW_LIGHT_SLICE,WEAPON_TYPE_CLAW_MEDIUM_SLICE,WEAPON_TYPE_CLAW_HEAVY_SLICE,WEAPON_TYPE_AXE_MEDIUM_CHOP,WEAPON_TYPE_ROCK_HEAVY_BASH]
native UnitDamageTarget             takes unit whichUnit, widget target, real amount, boolean attack, boolean ranged, attacktype attackType, damagetype damageType, weapontype weaponType returns boolean

//@ nodiscard 62
//@ desync handle-op 22
// 发布命令(无目标)
// @param order 技能命令字符串可在 记录物编的文件 找到
native IssueImmediateOrder          takes unit whichUnit, string order returns boolean
// 按ID发布命令(无目标)
// @param order 技能命令ID可在 记录物编的文件 找到
native IssueImmediateOrderById      takes unit whichUnit, integer order returns boolean
// 发布命令(指定坐标)
// 可能只返回false，不论执行成败
// @param order 技能命令字符串可在 记录物编的文件 找到
native IssuePointOrder              takes unit whichUnit, string order, real x, real y returns boolean
// 发布命令(指定点)
// 可能只返回false，不论执行成败
// @param order 技能命令字符串可在 记录物编的文件 找到
native IssuePointOrderLoc           takes unit whichUnit, string order, location whichLocation returns boolean
// 按ID发布命令(指定坐标)
// 可能只返回false，不论执行成败
// @param order 技能命令ID可在 记录物编的文件 找到
native IssuePointOrderById          takes unit whichUnit, integer order, real x, real y returns boolean
// 按ID发布命令(指定点)
// 可能只返回false，不论执行成败
// @param order 技能命令ID可在 记录物编的文件 找到
native IssuePointOrderByIdLoc       takes unit whichUnit, integer order, location whichLocation returns boolean
//@ desync handle-op 24
// 发布命令(指定单位/物品/可破坏物)
// @param order 技能命令字符串可在 记录物编的文件 找到
native IssueTargetOrder             takes unit whichUnit, string order, widget targetWidget returns boolean
// 按ID发布命令(指定单位/物品/可破坏物)
// @param order 技能命令ID可在 记录物编的文件 找到
native IssueTargetOrderById         takes unit whichUnit, integer order, widget targetWidget returns boolean
// 发布即时命令(指定坐标)
// @param order 技能命令字符串可在 记录物编的文件 找到
native IssueInstantPointOrder       takes unit whichUnit, string order, real x, real y, widget instantTargetWidget returns boolean
// 按ID发布即时命令(指定点)
// @param order 技能命令ID可在 记录物编的文件 找到
native IssueInstantPointOrderById   takes unit whichUnit, integer order, real x, real y, widget instantTargetWidget returns boolean
// 发布即时命令(指定单位/物品/可破坏物)
// @param order 技能命令字符串可在 记录物编的文件 找到
native IssueInstantTargetOrder      takes unit whichUnit, string order, widget targetWidget, widget instantTargetWidget returns boolean
// 按ID发布即时命令(指定单位/物品/可破坏物)
// @param order 技能命令ID可在 记录物编的文件 找到
native IssueInstantTargetOrderById  takes unit whichUnit, integer order, widget targetWidget, widget instantTargetWidget returns boolean
// 发布建造命令(指定坐标) [R]
// @param unitToBuild 建筑物的单位名称字符串，可在 common.ai 和 jass.config.json 文件找到
native IssueBuildOrder              takes unit whichPeon, string unitToBuild, real x, real y returns boolean
// 按ID发布建造命令(指定坐标) [R]
// @param unitId 单位类型，可在 记录物编的文件 找到
native IssueBuildOrderById          takes unit whichPeon, integer unitId, real x, real y returns boolean

//@ desync handle-op 12
// 发布中介命令(无目标)
native IssueNeutralImmediateOrder       takes player forWhichPlayer, unit neutralStructure, string unitToBuild returns boolean
// 按ID发布中介命令(无目标)
native IssueNeutralImmediateOrderById   takes player forWhichPlayer,unit neutralStructure, integer unitId returns boolean
// 发布中介命令(指定坐标)
native IssueNeutralPointOrder           takes player forWhichPlayer,unit neutralStructure, string unitToBuild, real x, real y returns boolean
// 按ID发布中介命令(指定坐标)
native IssueNeutralPointOrderById       takes player forWhichPlayer,unit neutralStructure, integer unitId, real x, real y returns boolean
// 发布中介命令(指定单位/物品/可破坏物)
native IssueNeutralTargetOrder          takes player forWhichPlayer,unit neutralStructure, string unitToBuild, widget target returns boolean
// 按ID发布中介命令(指定单位/物品/可破坏物)
native IssueNeutralTargetOrderById      takes player forWhichPlayer,unit neutralStructure, integer unitId, widget target returns boolean

// 获取指定单位当前的命令
// 返回值为0或null时标识该单位当前未接受任何命令，但不代表该单位停止，可能是命令已无法获取，其可能仍在执行命令，比如移动
native GetUnitCurrentOrder          takes unit whichUnit returns integer

// 设置指定金矿储金量(指定新值)
//@ desync handle-op
native SetResourceAmount            takes unit whichUnit, integer amount returns nothing
// 增加指定金矿储金量(指定增量)
//@ desync handle-op
native AddResourceAmount            takes unit whichUnit, integer amount returns nothing
// 获取指定金矿储金量
//@ desync handle-op
native GetResourceAmount            takes unit whichUnit returns integer

// 获取传送门目的地 X 坐标
native WaygateGetDestinationX       takes unit waygate returns real
// 获取传送门目的地 Y 坐标
native WaygateGetDestinationY       takes unit waygate returns real
// 设置传送门目的地坐标 [R]
//@ desync handle-op
native WaygateSetDestination        takes unit waygate, real x, real y returns nothing
// 设置传送门激活状态
//@ desync handle-op
native WaygateActivate              takes unit waygate, boolean activate returns nothing
// 获取传送门激活状态
native WaygateIsActive              takes unit waygate returns boolean

//@ desync handle-op 20
// 增加商店出售的物品类型 (应用于所有商店)
// @param itemId 物品类型
// @param currentStock 设置后立即拥有的库存数
// @param stockMax 自动刷新库存后最大的库存数
native AddItemToAllStock            takes integer itemId, integer currentStock, integer stockMax returns nothing
// 增加商店出售的物品类型 (应用于指定商店)
// @param itemId 物品类型
// @param currentStock 设置后立即拥有的库存数
// @param stockMax 自动刷新库存后最大的库存数
native AddItemToStock               takes unit whichUnit, integer itemId, integer currentStock, integer stockMax returns nothing
// 增加商店出售的单位类型 (应用于所有商店)
// @param unitId 单位类型
// @param currentStock 设置后立即拥有的库存数
// @param stockMax 自动刷新库存后最大的库存数
native AddUnitToAllStock            takes integer unitId, integer currentStock, integer stockMax returns nothing
// 增加商店出售的单位类型 (应用于指定商店)
// @param unitId 单位类型
// @param currentStock 设置后立即拥有的库存数
// @param stockMax 自动刷新库存后最大的库存数
native AddUnitToStock               takes unit whichUnit, integer unitId, integer currentStock, integer stockMax returns nothing

//@ desync handle-op 17
// 移除商店出售的指定物品类型 (应用于所有商店)
native RemoveItemFromAllStock       takes integer itemId returns nothing
// 移除商店出售的指定物品类型 (应用于指定商店)
native RemoveItemFromStock          takes unit whichUnit, integer itemId returns nothing
// 移除商店出售的指定单位类型 (应用于所有商店)
native RemoveUnitFromAllStock       takes integer unitId returns nothing
// 移除商店出售的指定单位类型 (应用于指定商店)
native RemoveUnitFromStock          takes unit whichUnit, integer unitId returns nothing

// 设置所有物品库存上限 (应用于所有商店)
native SetAllItemTypeSlots          takes integer slots returns nothing
// 设置所有单位库存上限 (应用于所有商店)
native SetAllUnitTypeSlots          takes integer slots returns nothing
// 设置所有物品库存上限 (应用于指定商店)
native SetItemTypeSlots             takes unit whichUnit, integer slots returns nothing
// 设置所有单位库存上限 (应用于指定商店)
native SetUnitTypeSlots             takes unit whichUnit, integer slots returns nothing

// 获取指定单位自定义值
native GetUnitUserData              takes unit whichUnit returns integer
// 设置指定单位自定义值
//@ desync handle-op
native SetUnitUserData              takes unit whichUnit, integer data returns nothing

//============================================================================
// Player API
// 查询玩家（指定编号）
// @param number 玩家编号，编号从0开始，即玩家1编号为0
constant native Player              takes integer number returns player
//@ desync danger 3
// 获取本地玩家 [R]
// 通常用于异步判断，同时返回多位玩家，包含AI玩家、裁判和观战者
constant native GetLocalPlayer      takes nothing returns player

// 查询指定玩家与另一指定玩家是否盟友关系
// 中立被动玩家是所有非中立玩家的盟友
constant native IsPlayerAlly        takes player whichPlayer, player otherPlayer returns boolean
// 查询指定玩家与另一指定玩家是否敌对关系
// 中立敌对玩家是所有非中立玩家的敌人
constant native IsPlayerEnemy       takes player whichPlayer, player otherPlayer returns boolean
// 查询指定玩家是否在指定玩家组内
constant native IsPlayerInForce     takes player whichPlayer, force whichForce returns boolean
// 查询指定玩家是否裁判或观战者 [R]
constant native IsPlayerObserver    takes player whichPlayer returns boolean
// 查询指定坐标在指定玩家视野中，是否可见
constant native IsVisibleToPlayer           takes real x, real y, player whichPlayer returns boolean
// 查询指定点在指定玩家视野中，是否可见
constant native IsLocationVisibleToPlayer   takes location whichLocation, player whichPlayer returns boolean
// 查询指定坐标在指定玩家视野中，是否被战争迷雾遮挡
constant native IsFoggedToPlayer            takes real x, real y, player whichPlayer returns boolean
// 查询指定点在指定玩家视野中，是否被战争迷雾遮挡
constant native IsLocationFoggedToPlayer    takes location whichLocation, player whichPlayer returns boolean
// 查询指定坐标在指定玩家视野中，是否被黑色阴影遮挡
constant native IsMaskedToPlayer            takes real x, real y, player whichPlayer returns boolean
// 查询指定点在指定玩家视野中，是否被黑色阴影遮挡
constant native IsLocationMaskedToPlayer    takes location whichLocation, player whichPlayer returns boolean

// 获取玩家种族，返回值[RACE_NIGHTELF,RACE_HUMAN,RACE_ORC,RACE_UNDEAD]
constant native GetPlayerRace           takes player whichPlayer returns race
// 获取玩家编号 [R]
// 编号从0开始，即玩家1编号为0
constant native GetPlayerId             takes player whichPlayer returns integer
// 获取玩家单位总数量（不含建筑、隐藏/阵亡单位）
// @param includeIncomplete 是否包含训练中/复活中的单位
constant native GetPlayerUnitCount      takes player whichPlayer, boolean includeIncomplete returns integer
// 获取玩家指定单位名称的单位数量（不含建筑、隐藏/阵亡单位）
// @param unitname 单位名称，不区分大小写，部分可在 common.ai 和 AIScripts 文件找到训练中/建造中/复活中
// @param includeIncomplete 是否包含训练中/复活中的单位
// @param includeUpgrades 是否包含科技（可能是包含研究后变成的单位，如猎头）
constant native GetPlayerTypedUnitCount takes player whichPlayer, string unitName, boolean includeIncomplete, boolean includeUpgrades returns integer
// 获取玩家的建筑总数量（不含单位、隐藏/阵亡建筑）
// @param includeIncomplete 是否包含建造中的建筑
constant native GetPlayerStructureCount takes player whichPlayer, boolean includeIncomplete returns integer
// 获取玩家指定状态
constant native GetPlayerState          takes player whichPlayer, playerstate whichPlayerState returns integer
// 获取玩家得分
constant native GetPlayerScore          takes player whichPlayer, playerscore whichPlayerScore returns integer
// 查询玩家与玩家的联盟类型是否指定类型
// @param whichAllianceSetting 联盟类型
constant native GetPlayerAlliance       takes player sourcePlayer, player otherPlayer, alliancetype whichAllianceSetting returns boolean

// 获取玩家经验上限 [R]
constant native GetPlayerHandicap       takes player whichPlayer returns real
// 获取玩家经验获得率 [R]
constant native GetPlayerHandicapXP     takes player whichPlayer returns real
// 设置玩家经验上限 [R]
//@ desync handle-op 2
constant native SetPlayerHandicap       takes player whichPlayer, real handicap returns nothing
// 设置玩家经验获得率 [R]
constant native SetPlayerHandicapXP     takes player whichPlayer, real handicap returns nothing

//@ desync handle-op 9
// 设置指定玩家指定科技的等级上限
constant native SetPlayerTechMaxAllowed takes player whichPlayer, integer techid, integer maximum returns nothing
// 获取指定玩家指定科技的等级上限
constant native GetPlayerTechMaxAllowed takes player whichPlayer, integer techid returns integer
// 增加指定玩家指定科技的等级
constant native AddPlayerTechResearched takes player whichPlayer, integer techid, integer levels returns nothing
// 设置指定玩家指定科技的等级
// 科技不能倒退，降级可用 BlzDecPlayerTechResearched
constant native SetPlayerTechResearched takes player whichPlayer, integer techid, integer setToLevel returns nothing
// 查询指定玩家指定科技是否已研究
constant native GetPlayerTechResearched takes player whichPlayer, integer techid, boolean specificonly returns boolean
// 查询指定玩家指定科技的等级
constant native GetPlayerTechCount      takes player whichPlayer, integer techid, boolean specificonly returns integer

// 设置指定单位所属玩家
//@ desync handle-op
native SetPlayerUnitsOwner takes player whichPlayer, integer newOwner returns nothing
// 暴露玩家位置(出生点)
// 默认用于对战模式胜负判定规则
//@ desync handle-op
native CripplePlayer takes player whichPlayer, force toWhichPlayers, boolean flag returns nothing

// 允许/禁用 技能(指定玩家) [R]
//@ desync handle-op
native SetPlayerAbilityAvailable        takes player whichPlayer, integer abilid, boolean avail returns nothing

// 设置玩家状态（指定数值）
//@ desync handle-op
native SetPlayerState   takes player whichPlayer, playerstate whichPlayerState, integer value returns nothing
// 踢除玩家
//@ desync handle-op
native RemovePlayer     takes player whichPlayer, playergameresult gameResult returns nothing

// Used to store hero level data for the scorescreen
// before units are moved to neutral passive in melee games
//
// 缓存玩家数据
//@ desync handle-op
native CachePlayerHeroData takes player whichPlayer returns nothing

//============================================================================
//@ desync handle-op 9
// Fog of War API
// 设置迷雾状态(矩形区域) [R]
native  SetFogStateRect      takes player forWhichPlayer, fogstate whichState, rect where, boolean useSharedVision returns nothing
// 设置迷雾状态(圆形范围) (指定坐标)[R]
native  SetFogStateRadius    takes player forWhichPlayer, fogstate whichState, real centerx, real centerY, real radius, boolean useSharedVision returns nothing
// 设置迷雾状态(圆形范围)(指定点) [R]
native  SetFogStateRadiusLoc takes player forWhichPlayer, fogstate whichState, location center, real radius, boolean useSharedVision returns nothing
// 启用/禁用 黑色阴影 [R]
native  FogMaskEnable        takes boolean enable returns nothing
// 查询黑色阴影是否启用
native  IsFogMaskEnabled     takes nothing returns boolean
// 启用/禁用 迷雾 [R]
//@ desync handle-op
native  FogEnable            takes boolean enable returns nothing
// 查询迷雾是否启用
native  IsFogEnabled         takes nothing returns boolean

//@ desync handle-op 12
// 新建可见度修正器(矩形区域) [R]
native CreateFogModifierRect        takes player forWhichPlayer, fogstate whichState, rect where, boolean useSharedVision, boolean afterUnits returns fogmodifier
// 新建可见度修正器(圆形范围) [R]
native CreateFogModifierRadius      takes player forWhichPlayer, fogstate whichState, real centerx, real centerY, real radius, boolean useSharedVision, boolean afterUnits returns fogmodifier
// 新建可见度修正器(圆形范围) [R]
native CreateFogModifierRadiusLoc   takes player forWhichPlayer, fogstate whichState, location center, real radius, boolean useSharedVision, boolean afterUnits returns fogmodifier
// 销毁指定可见度修正器
native DestroyFogModifier           takes fogmodifier whichFogModifier returns nothing
// 启用指定可见度修正器
native FogModifierStart             takes fogmodifier whichFogModifier returns nothing
// 禁用指定可见度修正器
native FogModifierStop              takes fogmodifier whichFogModifier returns nothing

//============================================================================
// Game API
// 获取当前获取版本(版本指混乱之治或冰封王座，并非补丁号)
native VersionGet takes nothing returns version
// 当前游戏版本是否指定版本(版本指混乱之治或冰封王座，并非补丁号)
native VersionCompatible takes version whichVersion returns boolean
// 当前版本是否支持指定版本(版本指混乱之治或冰封王座，并非补丁号)
native VersionSupported takes version whichVersion returns boolean

// 结束游戏
// @param doScoreScreen （游戏结束后）是否显示得分屏，常用于战役地图
//@ desync handle-op
native EndGame takes boolean doScoreScreen returns nothing

// Async only!
// 切换关卡 [R]
//@ desync handle-op 16
// @param doScoreScreen （游戏结束后）是否显示得分屏，常用于战役地图
native          ChangeLevel         takes string newLevel, boolean doScoreScreen returns nothing
// 重新开始游戏(当前关卡)
// @param doScoreScreen （游戏结束后）是否显示得分屏，常用于战役地图
native          RestartGame         takes boolean doScoreScreen returns nothing
// 重新读档(当前存档或最新的检查点(自动)存档)
native          ReloadGame          takes nothing returns nothing
// %%% SetCampaignMenuRace is deprecated.  It must remain to support
// old maps which use it, but all new maps should use SetCampaignMenuRaceEx
// 设置战役菜单种族
// @deprecated 弃用函数，"此方法不建议使用,应使用SetCampaignMenuRaceEx代替"
native          SetCampaignMenuRace takes race r returns nothing
// 设置战役菜单种族
native          SetCampaignMenuRaceEx takes integer campaignIndex returns nothing
// 玩家战役选择画面
native          ForceCampaignSelectScreen takes nothing returns nothing

//@ desync handle-op 26
// 加载存档(手动选择存档)
// @param doScoreScreen （游戏结束后）是否显示得分屏，常用于战役地图
native          LoadGame            takes string saveFileName, boolean doScoreScreen returns nothing
// 查询存档是否存在
native          SaveGame            takes string saveFileName returns nothing
// 重命名存档目录
native          RenameSaveDirectory takes string sourceDirName, string destDirName returns boolean
// 移除存档目录
native          RemoveSaveDirectory takes string sourceDirName returns boolean
// 复制存档目录
native          CopySaveGame        takes string sourceSaveName, string destSaveName returns boolean
native          SaveGameExists      takes string saveName returns boolean
// 同步选择
native          SyncSelections      takes nothing returns nothing
// 设置游戏浮点状态值(指定游戏浮点状态)
// 支持 GAME_STATE_TIME_OF_DAY
native          SetFloatGameState   takes fgamestate whichFloatGameState, real value returns nothing
// 获取游戏浮点状态值(指定游戏浮点状态)
// 支持 GAME_STATE_TIME_OF_DAY
constant native GetFloatGameState   takes fgamestate whichFloatGameState returns real
// 设置游戏整点状态值(指定游戏整点状态)
// 支持 GAME_STATE_DIVINE_INTERVENTION，GAME_STATE_DISCONNECTED
native          SetIntegerGameState takes igamestate whichIntegerGameState, integer value returns nothing
// 获取游戏整点状态值(指定游戏整点状态)
// 支持 GAME_STATE_DIVINE_INTERVENTION，GAME_STATE_DISCONNECTED
constant native GetIntegerGameState takes igamestate whichIntegerGameState returns integer


//============================================================================
//@ desync handle-op 21
// Campaign API
// 保留/清除 战役任务教程
native  SetTutorialCleared      takes boolean cleared returns nothing
// 启用/禁用 战役任务
native  SetMissionAvailable     takes integer campaignNumber, integer missionNumber, boolean available returns nothing
// 启用/禁用 战役(前章未通关不显示后续战役，非同一战役不同关卡，而是新战役)
native  SetCampaignAvailable    takes integer campaignNumber, boolean available  returns nothing
// 允许/禁止 Op电影(战役首关开场电影)
native  SetOpCinematicAvailable takes integer campaignNumber, boolean available  returns nothing
// 允许/禁止 Ed电影(战役末关结尾电影)
native  SetEdCinematicAvailable takes integer campaignNumber, boolean available  returns nothing
// 获取默认游戏难度
native  GetDefaultDifficulty    takes nothing returns gamedifficulty
// 设置默认游戏难度
native  SetDefaultDifficulty    takes gamedifficulty g returns nothing
// 显示/隐藏 自定义战役按钮
native  SetCustomCampaignButtonVisible  takes integer whichButton, boolean visible returns nothing
// 查询自定义战役按钮是否可见
native  GetCustomCampaignButtonVisible  takes integer whichButton returns boolean
// 关闭保存游戏录像功能 [R]
native  DoNotSaveReplay         takes nothing returns nothing

//============================================================================
//@ desync handle-op 18
// Dialog API
// 新建对话框 [R]
native DialogCreate                 takes nothing returns dialog
// 销毁对话框 [R]
native DialogDestroy                takes dialog whichDialog returns nothing
// 清空指定对话框
// 排泄需使用销毁对话框 DialogDestroy，而非清空
native DialogClear                  takes dialog whichDialog returns nothing
// 设置指定对话框标题
native DialogSetMessage             takes dialog whichDialog, string messageText returns nothing
// 添加指定对话框按钮 [R]
// 即使按钮内容是用全局变量写入，按钮内容也不会随变量变化，添加时已经写死，除非清空重新添加按钮
native DialogAddButton              takes dialog whichDialog, string buttonText, integer hotkey returns button
// 添加退出游戏按钮(指定对话框)，可设置按钮文案及快捷键 [R]
// @param doScoreScreen （游戏结束后）是否显示得分屏，常用于战役地图
native DialogAddQuitButton          takes dialog whichDialog, boolean doScoreScreen, string buttonText, integer hotkey returns button
// 显示/隐藏 对话框（指定玩家）[R]
native DialogDisplay                takes player whichPlayer, dialog whichDialog, boolean flag returns nothing

// Creates a new or reads in an existing game cache file stored
// in the current campaign profile dir
//
// 读取所有游戏缓存（从本地硬盘）
//@ desync handle-op
native  ReloadGameCachesFromDisk takes nothing returns boolean

// 新建游戏缓存 [R]
//@ desync handle-op 3
native  InitGameCache    takes string campaignFile returns gamecache
// 保存游戏缓存
//@ nodiscard
native  SaveGameCache    takes gamecache whichCache returns boolean

//@ desync handle-op 10
// 存储整数到游戏缓存
native  StoreInteger					takes gamecache cache, string missionKey, string key, integer value returns nothing
// 存储实数到游戏缓存
native  StoreReal						takes gamecache cache, string missionKey, string key, real value returns nothing
// 存储布尔值到游戏缓存
native  StoreBoolean					takes gamecache cache, string missionKey, string key, boolean value returns nothing
// 存储单位到游戏缓存
native  StoreUnit						takes gamecache cache, string missionKey, string key, unit whichUnit returns boolean
// 存储字符串到缓游戏存
native  StoreString						takes gamecache cache, string missionKey, string key, string value returns boolean

// 同步游戏缓存存储值（整数类别）
native SyncStoredInteger        takes gamecache cache, string missionKey, string key returns nothing
// 同步游戏缓存存储值（实数类别）
native SyncStoredReal           takes gamecache cache, string missionKey, string key returns nothing
// 同步游戏缓存存储值（布尔值类别）
native SyncStoredBoolean        takes gamecache cache, string missionKey, string key returns nothing
// 同步游戏缓存存储值（单位类别）
native SyncStoredUnit           takes gamecache cache, string missionKey, string key returns nothing
// 同步游戏缓存存储值（字符串类别）
native SyncStoredString         takes gamecache cache, string missionKey, string key returns nothing

// 查询游戏缓存是否有存储值（整数类别）
native  HaveStoredInteger					takes gamecache cache, string missionKey, string key returns boolean
// 查询游戏缓存是否有存储值（实数类别）
native  HaveStoredReal						takes gamecache cache, string missionKey, string key returns boolean
// 查询游戏缓存是否有存储值（布尔值类别）
native  HaveStoredBoolean					takes gamecache cache, string missionKey, string key returns boolean
// 查询游戏缓存是否有存储值（单位类别）
native  HaveStoredUnit						takes gamecache cache, string missionKey, string key returns boolean
// 查询游戏缓存是否有存储值（字符串类别）
native  HaveStoredString					takes gamecache cache, string missionKey, string key returns boolean

//@ desync handle-op 16
// 清空指定游戏缓存 [C]
// 清空指定游戏缓存下所有类别，清空缓存后变量不会变为null且需新建缓存
native  FlushGameCache						takes gamecache cache returns nothing
// 清空指定游戏缓存（指定类别）
// 仅清空指定缓存的指定类别，清空后无需新建缓存
native  FlushStoredMission					takes gamecache cache, string missionKey returns nothing
// 清空指定游戏缓存存储值（整数类别）
native  FlushStoredInteger					takes gamecache cache, string missionKey, string key returns nothing
// 清空指定游戏缓存存储值（实数类别）
native  FlushStoredReal						takes gamecache cache, string missionKey, string key returns nothing
// 清空指定游戏缓存存储值（布尔值类别）
native  FlushStoredBoolean					takes gamecache cache, string missionKey, string key returns nothing
// 清空指定游戏缓存存储值（单位类别）
native  FlushStoredUnit						takes gamecache cache, string missionKey, string key returns nothing
// 清空指定游戏缓存存储值（字符串类别）
native  FlushStoredString					takes gamecache cache, string missionKey, string key returns nothing

// Will return 0 if the specified value's data is not found in the cache
// 从游戏缓存读取存储值（整数类别） [C]
// 无数据时返回0
native  GetStoredInteger				takes gamecache cache, string missionKey, string key returns integer
// 从游戏缓存读取存储值（实数类别） [C]
// 无数据时返回0.00
native  GetStoredReal					takes gamecache cache, string missionKey, string key returns real
// 从游戏缓存读取存储值（布尔值类别）[R]
// 无数据时返回false
native  GetStoredBoolean				takes gamecache cache, string missionKey, string key returns boolean
// 从游戏缓存读取存储值（字符串类别） [C]
// 无数据时返回null
native  GetStoredString					takes gamecache cache, string missionKey, string key returns string
// 重新存储单位到游戏缓存 (指定朝向角度)
// 无数据时返回null
native  RestoreUnit						takes gamecache cache, string missionKey, string key, player forWhichPlayer, real x, real y, real facing returns unit


// <1.24> 新建哈希表 [C]
//@ desync handle-op
native  InitHashtable    takes nothing returns hashtable

// <1.24> 保存整数到哈希表 [C]
native  SaveInteger						takes hashtable table, integer parentKey, integer childKey, integer value returns nothing
// <1.24> 保存实数到哈希表 [C]
native  SaveReal						takes hashtable table, integer parentKey, integer childKey, real value returns nothing
// <1.24> 保存布尔值到哈希表 [C]
native  SaveBoolean						takes hashtable table, integer parentKey, integer childKey, boolean value returns nothing
//@ nodiscard 80
// <1.24> 保存字符串到哈希表 [C]
native  SaveStr							takes hashtable table, integer parentKey, integer childKey, string value returns boolean
// <1.24> 保存玩家到哈希表 [C]
native  SavePlayerHandle				takes hashtable table, integer parentKey, integer childKey, player whichPlayer returns boolean
// <1.24> 保存微件/实体(单位/物品/可破坏物)到哈希表 [C]
native  SaveWidgetHandle				takes hashtable table, integer parentKey, integer childKey, widget whichWidget returns boolean
// <1.24> 保存可破坏物到哈希表 [C]
native  SaveDestructableHandle			takes hashtable table, integer parentKey, integer childKey, destructable whichDestructable returns boolean
// <1.24> 保存物品到哈希表 [C]
native  SaveItemHandle					takes hashtable table, integer parentKey, integer childKey, item whichItem returns boolean
// <1.24> 保存单位到哈希表 [C]
native  SaveUnitHandle					takes hashtable table, integer parentKey, integer childKey, unit whichUnit returns boolean
// <1.24> 保存技能到哈希表 [C]
native  SaveAbilityHandle				takes hashtable table, integer parentKey, integer childKey, ability whichAbility returns boolean
// <1.24> 保存计时器到哈希表 [C]
native  SaveTimerHandle					takes hashtable table, integer parentKey, integer childKey, timer whichTimer returns boolean
// <1.24> 保存触发器到哈希表 [C]
native  SaveTriggerHandle				takes hashtable table, integer parentKey, integer childKey, trigger whichTrigger returns boolean
// <1.24> 保存触发条件到哈希表 [C]
native  SaveTriggerConditionHandle		takes hashtable table, integer parentKey, integer childKey, triggercondition whichTriggercondition returns boolean
// <1.24> 保存触发器动作到哈希表 [C]
native  SaveTriggerActionHandle			takes hashtable table, integer parentKey, integer childKey, triggeraction whichTriggeraction returns boolean
// <1.24> 保存触发事件到哈希表 [C]
native  SaveTriggerEventHandle			takes hashtable table, integer parentKey, integer childKey, event whichEvent returns boolean
// <1.24> 保存玩家组到哈希表 [C]
native  SaveForceHandle					takes hashtable table, integer parentKey, integer childKey, force whichForce returns boolean
// <1.24> 保存单位组到哈希表 [C]
native  SaveGroupHandle					takes hashtable table, integer parentKey, integer childKey, group whichGroup returns boolean
// <1.24> 保存点到哈希表 [C]
native  SaveLocationHandle				takes hashtable table, integer parentKey, integer childKey, location whichLocation returns boolean
// <1.24> 保存矩形区域到哈希表 [C]
native  SaveRectHandle					takes hashtable table, integer parentKey, integer childKey, rect whichRect returns boolean
// <1.24> 保存条件表达式到哈希表 [C]
native  SaveBooleanExprHandle			takes hashtable table, integer parentKey, integer childKey, boolexpr whichBoolexpr returns boolean
// <1.24> 保存音效到哈希表 [C]
native  SaveSoundHandle					takes hashtable table, integer parentKey, integer childKey, sound whichSound returns boolean
// <1.24> 保存特效到哈希表 [C]
native  SaveEffectHandle				takes hashtable table, integer parentKey, integer childKey, effect whichEffect returns boolean
// <1.24> 保存单位池到哈希表 [C]
native  SaveUnitPoolHandle				takes hashtable table, integer parentKey, integer childKey, unitpool whichUnitpool returns boolean
// <1.24> 保存物品池到哈希表 [C]
native  SaveItemPoolHandle				takes hashtable table, integer parentKey, integer childKey, itempool whichItempool returns boolean
// <1.24> 保存任务到哈希表 [C]
native  SaveQuestHandle					takes hashtable table, integer parentKey, integer childKey, quest whichQuest returns boolean
// <1.24> 保存任务要求到哈希表 [C]
native  SaveQuestItemHandle				takes hashtable table, integer parentKey, integer childKey, questitem whichQuestitem returns boolean
// <1.24> 保存任务失败条件到哈希表 [C]
native  SaveDefeatConditionHandle		takes hashtable table, integer parentKey, integer childKey, defeatcondition whichDefeatcondition returns boolean
// <1.24> 保存计时器窗口到哈希表 [C]
native  SaveTimerDialogHandle			takes hashtable table, integer parentKey, integer childKey, timerdialog whichTimerdialog returns boolean
// <1.24> 保存排行榜到哈希表 [C]
native  SaveLeaderboardHandle			takes hashtable table, integer parentKey, integer childKey, leaderboard whichLeaderboard returns boolean
// <1.24> 保存多面板到哈希表 [C]
native  SaveMultiboardHandle			takes hashtable table, integer parentKey, integer childKey, multiboard whichMultiboard returns boolean
// <1.24> 保存多面板项目到哈希表 [C]
native  SaveMultiboardItemHandle		takes hashtable table, integer parentKey, integer childKey, multiboarditem whichMultiboarditem returns boolean
// <1.24> 保存可追踪物到哈希表 [C]
native  SaveTrackableHandle				takes hashtable table, integer parentKey, integer childKey, trackable whichTrackable returns boolean
// <1.24> 保存对话框到哈希表 [C]
native  SaveDialogHandle				takes hashtable table, integer parentKey, integer childKey, dialog whichDialog returns boolean
// <1.24> 保存对话框按钮到哈希表 [C]
native  SaveButtonHandle				takes hashtable table, integer parentKey, integer childKey, button whichButton returns boolean
// <1.24> 保存漂浮文字到哈希表 [C]
native  SaveTextTagHandle				takes hashtable table, integer parentKey, integer childKey, texttag whichTexttag returns boolean
// <1.24> 保存闪电效果到哈希表 [C]
native  SaveLightningHandle				takes hashtable table, integer parentKey, integer childKey, lightning whichLightning returns boolean
// <1.24> 保存图像到哈希表 [C]
native  SaveImageHandle					takes hashtable table, integer parentKey, integer childKey, image whichImage returns boolean
// <1.24> 保存地面纹理变化到哈希表 [C]
native  SaveUbersplatHandle				takes hashtable table, integer parentKey, integer childKey, ubersplat whichUbersplat returns boolean
// <1.24> 保存不规则区域到哈希表 [C]
native  SaveRegionHandle				takes hashtable table, integer parentKey, integer childKey, region whichRegion returns boolean
// <1.24> 保存迷雾状态到哈希表 [C]
native  SaveFogStateHandle				takes hashtable table, integer parentKey, integer childKey, fogstate whichFogState returns boolean
// <1.24> 保存可见度修正器到哈希表 [C]
native  SaveFogModifierHandle			takes hashtable table, integer parentKey, integer childKey, fogmodifier whichFogModifier returns boolean
// <1.24> 保存句柄到哈希表 [C]
native  SaveAgentHandle					takes hashtable table, integer parentKey, integer childKey, agent whichAgent returns boolean
// <1.24> 保存哈希表到哈希表 [C]
native  SaveHashtableHandle				takes hashtable table, integer parentKey, integer childKey, hashtable whichHashtable returns boolean


// <1.24> 从哈希表提取整数 [C]
native  LoadInteger					takes hashtable table, integer parentKey, integer childKey returns integer
// <1.24> 从哈希表提取实数 [C]
native  LoadReal					takes hashtable table, integer parentKey, integer childKey returns real
// <1.24> 从哈希表提取布尔值 [C]
native  LoadBoolean				    takes hashtable table, integer parentKey, integer childKey returns boolean
// <1.24> 从哈希表提取字符串 [C]
native  LoadStr 					takes hashtable table, integer parentKey, integer childKey returns string
// <1.24> 从哈希表提取玩家 [C]
native  LoadPlayerHandle			takes hashtable table, integer parentKey, integer childKey returns player
// <1.24> 从哈希表提取微件/实体(单位/物品/可破坏物)[C]
native  LoadWidgetHandle			takes hashtable table, integer parentKey, integer childKey returns widget
// <1.24> 从哈希表提取可破坏物 [C]
native  LoadDestructableHandle		takes hashtable table, integer parentKey, integer childKey returns destructable
// <1.24> 从哈希表提取物品 [C]
native  LoadItemHandle				takes hashtable table, integer parentKey, integer childKey returns item
// <1.24> 从哈希表提取单位 [C]
native  LoadUnitHandle				takes hashtable table, integer parentKey, integer childKey returns unit
// <1.24> 从哈希表提取技能 [C]
native  LoadAbilityHandle			takes hashtable table, integer parentKey, integer childKey returns ability
// <1.24> 从哈希表提取计时器 [C]
// 若仍需继续使用该计时器，请勿排泄
native  LoadTimerHandle				takes hashtable table, integer parentKey, integer childKey returns timer
// <1.24> 从哈希表提取触发器 [C]
native  LoadTriggerHandle			takes hashtable table, integer parentKey, integer childKey returns trigger
// <1.24> 从哈希表提取触发条件 [C]
native  LoadTriggerConditionHandle	takes hashtable table, integer parentKey, integer childKey returns triggercondition
// <1.24> 从哈希表提取触发动作 [C]
native  LoadTriggerActionHandle		takes hashtable table, integer parentKey, integer childKey returns triggeraction
// <1.24> 从哈希表提取触发事件 [C]
native  LoadTriggerEventHandle		takes hashtable table, integer parentKey, integer childKey returns event
// <1.24> 从哈希表提取玩家组 [C]
native  LoadForceHandle				takes hashtable table, integer parentKey, integer childKey returns force
// <1.24> 从哈希表提取单位组 [C]
// 若仍需继续使用该单位组，请勿排泄
native  LoadGroupHandle				takes hashtable table, integer parentKey, integer childKey returns group
// <1.24> 从哈希表提取点 [C]
// 若仍需继续使用该点，请勿排泄
native  LoadLocationHandle			takes hashtable table, integer parentKey, integer childKey returns location
// <1.24> 从哈希表提取矩形区域 [C]
// 若仍需继续使用该区域，请勿排泄
native  LoadRectHandle				takes hashtable table, integer parentKey, integer childKey returns rect
// <1.24> 从哈希表提取条件表达式 [C]
native  LoadBooleanExprHandle		takes hashtable table, integer parentKey, integer childKey returns boolexpr
// <1.24> 从哈希表提取音效 [C]
native  LoadSoundHandle				takes hashtable table, integer parentKey, integer childKey returns sound
// <1.24> 从哈希表提取特效 [C]
native  LoadEffectHandle			takes hashtable table, integer parentKey, integer childKey returns effect
// <1.24> 从哈希表提取单位池 [C]
native  LoadUnitPoolHandle			takes hashtable table, integer parentKey, integer childKey returns unitpool
// <1.24> 从哈希表提取物品池 [C]
native  LoadItemPoolHandle			takes hashtable table, integer parentKey, integer childKey returns itempool
// <1.24> 从哈希表提取任务 [C]
native  LoadQuestHandle				takes hashtable table, integer parentKey, integer childKey returns quest
// <1.24> 从哈希表提取任务要求 [C]
native  LoadQuestItemHandle			takes hashtable table, integer parentKey, integer childKey returns questitem
// <1.24> 从哈希表提取任务失败条件 [C]
native  LoadDefeatConditionHandle	takes hashtable table, integer parentKey, integer childKey returns defeatcondition
// <1.24> 从哈希表提取计时器窗口 [C]
native  LoadTimerDialogHandle		takes hashtable table, integer parentKey, integer childKey returns timerdialog
// <1.24> 从哈希表提取排行榜 [C]
native  LoadLeaderboardHandle		takes hashtable table, integer parentKey, integer childKey returns leaderboard
// <1.24> 从哈希表提取多面板 [C]
native  LoadMultiboardHandle		takes hashtable table, integer parentKey, integer childKey returns multiboard
// <1.24> 从哈希表提取多面板项目 [C]
native  LoadMultiboardItemHandle	takes hashtable table, integer parentKey, integer childKey returns multiboarditem
// <1.24> 从哈希表提取可追踪物 [C]
native  LoadTrackableHandle			takes hashtable table, integer parentKey, integer childKey returns trackable
// <1.24> 从哈希表提取对话框 [C]
native  LoadDialogHandle			takes hashtable table, integer parentKey, integer childKey returns dialog
// <1.24> 从哈希表提取对话框按钮 [C]
native  LoadButtonHandle			takes hashtable table, integer parentKey, integer childKey returns button
// <1.24> 从哈希表提取漂浮文字 [C]
native  LoadTextTagHandle			takes hashtable table, integer parentKey, integer childKey returns texttag
// <1.24> 从哈希表提取闪电效果 [C]
native  LoadLightningHandle			takes hashtable table, integer parentKey, integer childKey returns lightning
// <1.24> 从哈希表提取图象 [C]
native  LoadImageHandle				takes hashtable table, integer parentKey, integer childKey returns image
// <1.24> 从哈希表提取地面纹理变化 [C]
native  LoadUbersplatHandle			takes hashtable table, integer parentKey, integer childKey returns ubersplat
// <1.24> 从哈希表提取不规则区域 [C]
// 如仍需使用该区域，请勿排泄
native  LoadRegionHandle			takes hashtable table, integer parentKey, integer childKey returns region
// <1.24> 从哈希表提取迷雾状态 [C]
native  LoadFogStateHandle			takes hashtable table, integer parentKey, integer childKey returns fogstate
// <1.24> 从哈希表提取可见度修正器 [C]
native  LoadFogModifierHandle		takes hashtable table, integer parentKey, integer childKey returns fogmodifier
// <1.24> 从哈希表提取哈希表 [C]
native  LoadHashtableHandle			takes hashtable table, integer parentKey, integer childKey returns hashtable

// <1.24> 查询指定哈希表的指定位置是否记录了整数
native  HaveSavedInteger					takes hashtable table, integer parentKey, integer childKey returns boolean
// <1.24> 查询指定哈希表的指定位置是否记录了实数
native  HaveSavedReal						takes hashtable table, integer parentKey, integer childKey returns boolean
// <1.24> 查询指定哈希表的指定位置是否记录了布尔值
native  HaveSavedBoolean					takes hashtable table, integer parentKey, integer childKey returns boolean
// <1.24> 查询指定哈希表的指定位置是否记录了字符串
native  HaveSavedString					    takes hashtable table, integer parentKey, integer childKey returns boolean
// <1.24> 查询指定哈希表的指定位置是否记录了句柄
native  HaveSavedHandle     				takes hashtable table, integer parentKey, integer childKey returns boolean

// <1.24> 删除指定哈希表的指定位置记录的整数
native  RemoveSavedInteger					takes hashtable table, integer parentKey, integer childKey returns nothing
// <1.24> 删除指定哈希表的指定位置记录的实数
native  RemoveSavedReal						takes hashtable table, integer parentKey, integer childKey returns nothing
// <1.24> 删除指定哈希表的指定位置记录的布尔值
native  RemoveSavedBoolean					takes hashtable table, integer parentKey, integer childKey returns nothing
// <1.24> 删除指定哈希表的指定位置记录的字符串
native  RemoveSavedString					takes hashtable table, integer parentKey, integer childKey returns nothing
// <1.24> 删除指定哈希表的指定位置记录的句柄
// 删除后，在写入新内容前，查询该位置会返回null
native  RemoveSavedHandle					takes hashtable table, integer parentKey, integer childKey returns nothing

// <1.24> 清空指定哈希表 [C]
// 清空整张表，清空后表变量不会变为null且需新建表
native  FlushParentHashtable						takes hashtable table returns nothing
// <1.24> 清空指定哈希表的指定主索引 [C]
// 仅清空指定主索引，清空后无需新建表
native  FlushChildHashtable					takes hashtable table, integer parentKey returns nothing


//============================================================================
// Randomization API
// 获取随机整数(指定区间)
//@ desync handle-op 3
native GetRandomInt takes integer lowBound, integer highBound returns integer
// 获取随机实数(指定区间)
native GetRandomReal takes real lowBound, real highBound returns real

// 新建单位池 [R]
//@ desync handle-op 11
// 使用完请注意排泄
native CreateUnitPool           takes nothing returns unitpool
// 销毁单位池 [R]
native DestroyUnitPool          takes unitpool whichPool returns nothing
// 添加指定单位ID到指定单位池 [R]
native UnitPoolAddUnitType      takes unitpool whichPool, integer unitId, real weight returns nothing
// 删除指定单位池的指定单位ID [R]
native UnitPoolRemoveUnitType   takes unitpool whichPool, integer unitId returns nothing
// 随机创建单位池的单位(指定单位所属玩家)(指定坐标) [R]
// 默认用于创建随机中立敌对单位
native PlaceRandomUnit          takes unitpool whichPool, player forWhichPlayer, real x, real y, real facing returns unit

//@ desync handle-op 12
// 新建物品池 [R]
// 使用完请注意排泄
native CreateItemPool           takes nothing returns itempool
// 销毁物品池 [R]
native DestroyItemPool          takes itempool whichItemPool returns nothing
// 添加指定物品分类到指定物品池 [R]
native ItemPoolAddItemType      takes itempool whichItemPool, integer itemId, real weight returns nothing
// 删除指定物品池的指定物品分类 [R]
native ItemPoolRemoveItemType   takes itempool whichItemPool, integer itemId returns nothing
// 随机创建物品池的物品(指定坐标) [R]
// 默认用于创建随机掉落物品
native PlaceRandomItem          takes itempool whichItemPool, real x, real y returns item

//@ desync handle-op 16
// Choose any random unit/item. (NP means Neutral Passive)
// 获取随机中立敌对玩家单位的单位类型(指定单位等级)
// 默认用于地图初始化时创建随机中立敌对单位
native ChooseRandomCreep        takes integer level returns integer
// 获取随机中立被动玩家建筑单位的单位类型
// 默认用于地图初始化时创建随机中立被动单位(如商店、泉水等)
native ChooseRandomNPBuilding   takes nothing returns integer
// 随机选择物品-所有等级
// 默认用于市场随机出售物品
native ChooseRandomItem         takes integer level returns integer
// 随机选择物品分类-指定等级
// 默认用于市场随机出售物品分类
native ChooseRandomItemEx       takes itemtype whichType, integer level returns integer
// 设置随机种子
// 默认用于统一电影播放效果
native SetRandomSeed            takes integer seed returns nothing

//============================================================================
//@ desync handle-op 5
// Visual API
// 设置地形迷雾
native SetTerrainFog                takes real a, real b, real c, real d, real e returns nothing
// 重置地形迷雾
native ResetTerrainFog              takes nothing returns nothing

// 设置单位迷雾
//@ desync handle-op 1
native SetUnitFog                   takes real a, real b, real c, real d, real e returns nothing
// 设置地形迷雾 [R]
//@ desync handle-op 1
native SetTerrainFogEx              takes integer style, real zstart, real zend, real density, real red, real green, real blue returns nothing
// 对指定玩家显示文本(自动限时) [R]
native DisplayTextToPlayer          takes player toPlayer, real x, real y, string message returns nothing
// 对指定玩家显示文本(指定时间) [R]
native DisplayTimedTextToPlayer     takes player toPlayer, real x, real y, real duration, string message returns nothing
// 从指定玩家显示文本(指定时间) [R]
native DisplayTimedTextFromPlayer   takes player toPlayer, real x, real y, real duration, string message returns nothing
// 清空文本信息(所有玩家) [R]
native ClearTextMessages            takes nothing returns nothing
// 设置昼夜
// @param terrainDNCFile 迷雾模型文件路径
// @param unitDNCFile 单位模型文件路径
//@ desync handle-op 1
native SetDayNightModels            takes string terrainDNCFile, string unitDNCFile returns nothing
// 设置天空模型
// @param skyModelFile 天空模型文件路径，可在 记录物编的文件 找到
//@ desync handle-op 1
native SetSkyModel                  takes string skyModelFile returns nothing
// 启用/禁用 玩家控制权(所有玩家) [R]
// 启用后被禁玩家的鼠标消失，除 ALT + F4 和 切换桌面 外，其余游戏快捷键不响应
// 该操作对AI无效
//@ desync handle-op 19
native EnableUserControl            takes boolean b returns nothing
// 启用/禁用 玩家UI
native EnableUserUI                 takes boolean b returns nothing
// 暂停/恢复 昼夜交替
native SuspendTimeOfDay             takes boolean b returns nothing
// 设置昼夜交替时间流逝速度 [R]
native SetTimeOfDayScale            takes real r returns nothing
// 获取昼夜交替时间流逝速度
native GetTimeOfDayScale            takes nothing returns real
// 开启/关闭 信箱模式(所有玩家) [R]
// @param flag 显示/隐藏 宽屏UI(所有玩家)，淡入/谈出 游戏UI
// @param fadeDuration 淡入持续时间
native ShowInterface                takes boolean flag, real fadeDuration returns nothing
// 暂停/恢复 游戏 [R]
native PauseGame                    takes boolean flag returns nothing
// 添加闪动指示器(指定单位) [R]
native UnitAddIndicator             takes unit whichUnit, integer red, integer green, integer blue, integer alpha returns nothing
// 添加闪动指示器(指定单位/物品/可破坏物)
native AddIndicator                 takes widget whichWidget, integer red, integer green, integer blue, integer alpha returns nothing
// 发送小地图提示(所有玩家可见) [R]
// 类似单位建造/训练/研究完成的提示，而非盟友之间通信的叹号
native PingMinimap                  takes real x, real y, real duration returns nothing
// 发送小地图提示(指定颜色及是否启用额外特效)(所有玩家可见) [R]
// 类似单位建造/训练/研究完成的提示，而非盟友之间通信的叹号
native PingMinimapEx                takes real x, real y, real duration, integer red, integer green, integer blue, boolean extraEffects returns nothing
//@ desync handle-op 2
// 允许/禁止 闭塞(所有玩家) [R]
native EnableOcclusion              takes boolean flag returns nothing
// 设置介绍文本
native SetIntroShotText             takes string introText returns nothing
// 设置介绍模型（指定路径）
native SetIntroShotModel            takes string introModelPath returns nothing
//@ desync handle-op 2
// 允许/禁止 地图边界迷雾渲染(所有玩家) [R]
native EnableWorldFogBoundary       takes boolean b returns nothing
// 播放指定电影(所有玩家)（按模式名称）
native PlayModelCinematic           takes string modelName returns nothing
// 播放指定电影(所有玩家)（按电影名称）
native PlayCinematic                takes string movieName returns nothing
// 强制玩家按下特定UI键
native ForceUIKey                   takes string key returns nothing
// 强制玩家按下UI ESC键(UI取消键)
native ForceUICancel                takes nothing returns nothing
// 显示选择存档对话框
native DisplayLoadDialog            takes nothing returns nothing
// 设置小地图(任务)图标
native SetAltMinimapIcon            takes string iconPath returns nothing
// 禁用重新开始任务按钮
native DisableRestartMission        takes boolean flag returns nothing

//@ desync handle-op 30
// 新建漂浮文字 [R]
native CreateTextTag                takes nothing returns texttag
// 销毁漂浮文字 [R]
native DestroyTextTag               takes texttag t returns nothing
// 设置漂浮文字文本 [R]
// @param height 文字高度，可使用 TextTagSize2Height(任意实数) 转换字号(字体大小)获得
native SetTextTagText               takes texttag t, string s, real height returns nothing
// 设置漂浮文字位置(指定坐标) [R]
// @param height 文字高度，可使用 TextTagSize2Height(任意实数) 转换字号(字体大小)获得
native SetTextTagPos                takes texttag t, real x, real y, real heightOffset returns nothing
// 设置漂浮文字位置(指定坐标) [R]
// @param height 文字高度，可使用 TextTagSize2Height(任意实数) 转换字号(字体大小)获得
native SetTextTagPosUnit            takes texttag t, unit whichUnit, real heightOffset returns nothing
// 设置漂浮文字颜色 [R]
native SetTextTagColor              takes texttag t, integer red, integer green, integer blue, integer alpha returns nothing
// 设置漂浮文字速度 [R]
native SetTextTagVelocity           takes texttag t, real xvel, real yvel returns nothing
// 显示/隐藏 漂浮文字 (所有玩家) [R]
native SetTextTagVisibility         takes texttag t, boolean flag returns nothing
// 允许/禁止 漂浮文本暂停
native SetTextTagSuspended          takes texttag t, boolean flag returns nothing
// 允许/禁止 漂浮文本永久显示
native SetTextTagPermanent          takes texttag t, boolean flag returns nothing
// 设置漂浮文字已存在时间
native SetTextTagAge                takes texttag t, real age returns nothing
// 设置漂浮文字清除时间(在指定生命周期后自动清除)
// 可替代排泄
native SetTextTagLifespan           takes texttag t, real lifespan returns nothing
// 设置漂浮文字消逝(淡出)时间
native SetTextTagFadepoint          takes texttag t, real fadepoint returns nothing

//@ desync handle-op 18
// 保留英雄按钮(指定左上角英雄图标，F1~FN)
native SetReservedLocalHeroButtons  takes integer reserved returns nothing
// 获取联盟颜色过滤状态
native GetAllyColorFilterState      takes nothing returns integer
// 设置联盟颜色过滤状态
native SetAllyColorFilterState      takes integer state returns nothing
// 获取小地图中立敌对单位营地图标显示状态
native GetCreepCampFilterState      takes nothing returns boolean
// 显示/隐藏 小地图中立敌对单位营地图标(小地图野怪红黄绿点)
native SetCreepCampFilterState      takes boolean state returns nothing
// 启用/禁用 小地图按钮
native EnableMinimapFilterButtons   takes boolean enableAlly, boolean enableCreep returns nothing
// 启用/禁用 框选
native EnableDragSelect             takes boolean state, boolean ui returns nothing
// 启用/禁用 预选
native EnablePreSelect              takes boolean state, boolean ui returns nothing
// 启用/禁用 选择
native EnableSelect                 takes boolean state, boolean ui returns nothing

//============================================================================
// Trackable API
// 创建可追踪物（指定坐标及朝向） [R]
//@ desync handle-op
native CreateTrackable      takes string trackableModelPath, real x, real y, real facing returns trackable

//============================================================================
// Quest API
//@ desync handle-op 10
// 新建任务 [R]
native CreateQuest          takes nothing returns quest
// 销毁任务
native DestroyQuest         takes quest whichQuest returns nothing
// 设置任务标题
native QuestSetTitle        takes quest whichQuest, string title returns nothing
// 设置任务说明
native QuestSetDescription  takes quest whichQuest, string description returns nothing
// 设置任务图标
native QuestSetIconPath     takes quest whichQuest, string iconPath returns nothing

//@ desync handle-op 10
// 设置任务是否必须完成(区分主线或支线任务)
native QuestSetRequired     takes quest whichQuest, boolean required   returns nothing
// 设置任务是否完成
native QuestSetCompleted    takes quest whichQuest, boolean completed  returns nothing
// 设置任务是否被发现(隐藏任务)
native QuestSetDiscovered   takes quest whichQuest, boolean discovered returns nothing
// 设置任务是否失败
native QuestSetFailed       takes quest whichQuest, boolean failed     returns nothing
// 开启/关闭 指定任务 [R]
native QuestSetEnabled      takes quest whichQuest, boolean enabled    returns nothing
    
// 查询任务是否必须完成（主线任务）
native IsQuestRequired     takes quest whichQuest returns boolean
// 查询任务是否已完成
native IsQuestCompleted    takes quest whichQuest returns boolean
// 查询任务是否已被发现
native IsQuestDiscovered   takes quest whichQuest returns boolean
// 查询任务是否已失败
native IsQuestFailed       takes quest whichQuest returns boolean
// 查询任务是否已开启/已激活
native IsQuestEnabled      takes quest whichQuest returns boolean

//@ desync handle-op 6
// 创建任务完成条件
native QuestCreateItem          takes quest whichQuest returns questitem
// 设置任务完成条件说明
native QuestItemSetDescription  takes questitem whichQuestItem, string description returns nothing
// 设置任务完成条件完成/未完成
native QuestItemSetCompleted    takes questitem whichQuestItem, boolean completed returns nothing

// 查询任务完成条件是否已完成
native IsQuestItemCompleted     takes questitem whichQuestItem returns boolean

//@ desync handle-op 6
// 创建任务失败条件
native CreateDefeatCondition            takes nothing returns defeatcondition
// 销毁任务失败条件
native DestroyDefeatCondition           takes defeatcondition whichCondition returns nothing
// 设置任务失败条件说明
native DefeatConditionSetDescription    takes defeatcondition whichCondition, string description returns nothing

// 闪动任务按钮
native FlashQuestDialogButton   takes nothing returns nothing
// 更新任务对话框
native ForceQuestDialogUpdate   takes nothing returns nothing

//============================================================================
// Timer Dialog API
// 新建计时器窗口 [R]
//@ desync handle-op 12
// 不能在游戏初始化事件的触发器内创建，必须有时间差
native CreateTimerDialog                takes timer t returns timerdialog
// 销毁计时器窗口
native DestroyTimerDialog               takes timerdialog whichDialog returns nothing
// 设置计时器窗口标题
native TimerDialogSetTitle              takes timerdialog whichDialog, string title returns nothing
// 设置计时器窗口文字颜色 [R]
native TimerDialogSetTitleColor         takes timerdialog whichDialog, integer red, integer green, integer blue, integer alpha returns nothing
// 设置计时器窗口计时颜色 [R]
native TimerDialogSetTimeColor          takes timerdialog whichDialog, integer red, integer green, integer blue, integer alpha returns nothing
// 设置计时器窗口速率 [R]
native TimerDialogSetSpeed              takes timerdialog whichDialog, real speedMultFactor returns nothing
// 显示/隐藏 计时器窗口(所有玩家) [R]
native TimerDialogDisplay               takes timerdialog whichDialog, boolean display returns nothing
// 查询计时器窗口是否显示
native IsTimerDialogDisplayed           takes timerdialog whichDialog returns boolean
// 设置计时器窗口倒计时
// 可创建另一个计时器(隐藏)，在其倒计时结束后，修改本窗口的倒计时，从而实现正向计时
native TimerDialogSetRealTimeRemaining  takes timerdialog whichDialog, real timeRemaining returns nothing

//============================================================================
// Leaderboard API

// Create a leaderboard object
//@ desync handle-op 5
// 新建排行榜 [R]
// 不能在游戏初始化事件的触发器内创建，必须有时间差
native CreateLeaderboard                takes nothing returns leaderboard
// 销毁排行榜
native DestroyLeaderboard               takes leaderboard lb returns nothing

// 显示/隐藏 排行榜[R]
native LeaderboardDisplay               takes leaderboard lb, boolean show returns nothing
// 查询排行榜是否显示
native IsLeaderboardDisplayed           takes leaderboard lb returns boolean

// 获取指定排行榜行数
native LeaderboardGetItemCount          takes leaderboard lb returns integer

//@ desync handle-op 15
// 设置排行榜行行数
native LeaderboardSetSizeByItemCount    takes leaderboard lb, integer count returns nothing
// 添加指定玩家到指定排行榜
// @param lb 指定玩家在榜上的排名(行数)
// @param label 指定玩家在榜上的名字
// @param value 指定玩家在榜上的分数
// @param p 指定玩家
native LeaderboardAddItem               takes leaderboard lb, string label, integer value, player p returns nothing
// 移除排行榜指定行
native LeaderboardRemoveItem            takes leaderboard lb, integer index returns nothing
// 移除排行榜指定玩家
native LeaderboardRemovePlayerItem      takes leaderboard lb, player p returns nothing
// 清空排行榜 [R]
// 排泄需使用销毁排行榜 DestroyLeaderboard，而非清空
native LeaderboardClear                 takes leaderboard lb returns nothing

// 设置排行榜按分值排序(真为升序，假为降序)
native LeaderboardSortItemsByValue      takes leaderboard lb, boolean ascending returns nothing
// 设置排行榜按玩家排序(真为升序，假为降序)
native LeaderboardSortItemsByPlayer     takes leaderboard lb, boolean ascending returns nothing
// 设置排行榜按文本排序(真为升序，假为降序)
native LeaderboardSortItemsByLabel      takes leaderboard lb, boolean ascending returns nothing

// 查询指定玩家是否已上榜(指定排行榜)
native LeaderboardHasPlayerItem         takes leaderboard lb, player p returns boolean
// 查询指定玩家在排行榜的排名
native LeaderboardGetPlayerIndex        takes leaderboard lb, player p returns integer
// 设置排行榜标题
native LeaderboardSetLabel              takes leaderboard lb, string label returns nothing
// 获取排行榜标题
native LeaderboardGetLabelText          takes leaderboard lb returns string

// 设置指定玩家上榜(指定排行榜) [R]
native PlayerSetLeaderboard             takes player toPlayer, leaderboard lb returns nothing
// 获取指定玩家已登上的排行榜 [R]
native PlayerGetLeaderboard             takes player toPlayer returns leaderboard

// 设置排行榜标题颜色 [R]
native LeaderboardSetLabelColor         takes leaderboard lb, integer red, integer green, integer blue, integer alpha returns nothing
// 设置排行榜数值颜色 [R]
native LeaderboardSetValueColor         takes leaderboard lb, integer red, integer green, integer blue, integer alpha returns nothing
// 设置排行榜显示样式
native LeaderboardSetStyle              takes leaderboard lb, boolean showLabel, boolean showNames, boolean showValues, boolean showIcons returns nothing

//@ desync handle-op 2
// 设置排行榜玩家分值
native LeaderboardSetItemValue          takes leaderboard lb, integer whichItem, integer val returns nothing
// 设置排行榜玩家名字
native LeaderboardSetItemLabel          takes leaderboard lb, integer whichItem, string val returns nothing
// 设置排行榜玩家显示样式
// @param whichItem 玩家在排行榜中的位置
// @param showLabel 是否显示名字
// @param showValue 是否显示分数
// @param showIcon 是否显示图标
native LeaderboardSetItemStyle          takes leaderboard lb, integer whichItem, boolean showLabel, boolean showValue, boolean showIcon returns nothing
// 设置排行榜玩家名字颜色
native LeaderboardSetItemLabelColor     takes leaderboard lb, integer whichItem, integer red, integer green, integer blue, integer alpha returns nothing
// 设置排行榜玩家分值颜色
native LeaderboardSetItemValueColor     takes leaderboard lb, integer whichItem, integer red, integer green, integer blue, integer alpha returns nothing

//============================================================================
// Multiboard API
//============================================================================

// Create a multiboard object
// 新建多面板 [R]
//@ desync handle-op 4
// 不能在游戏初始化事件的触发器内创建，必须有时间差
native CreateMultiboard                 takes nothing returns multiboard
// 销毁多面板
native DestroyMultiboard                takes multiboard lb returns nothing

// 显示/隐藏 多面板 [R]
native MultiboardDisplay                takes multiboard lb, boolean show returns nothing
// 查询多面板是否显示
native IsMultiboardDisplayed            takes multiboard lb returns boolean

// 最大/最小化 多面板 [R]
native MultiboardMinimize               takes multiboard lb, boolean minimize returns nothing
//@ desync danger 2
// 查询多面板是否最小化
native IsMultiboardMinimized            takes multiboard lb returns boolean
// 清空多面板
// 排泄需使用销毁多面板 DestroyMultiboard，而非清空
native MultiboardClear                  takes multiboard lb returns nothing

// 设置多面板标题
native MultiboardSetTitleText           takes multiboard lb, string label returns nothing
// 获取多面板标题
native MultiboardGetTitleText           takes multiboard lb returns string
// 设置多面板标题颜色 [R]
native MultiboardSetTitleTextColor      takes multiboard lb, integer red, integer green, integer blue, integer alpha returns nothing

// 获取多面板行数
native MultiboardGetRowCount            takes multiboard lb returns integer
// 获取多面板列数
native MultiboardGetColumnCount         takes multiboard lb returns integer

// 设置多面板列数
native MultiboardSetColumnCount         takes multiboard lb, integer count returns nothing
// 设置多面板行数
native MultiboardSetRowCount            takes multiboard lb, integer count returns nothing

// broadcast settings to all items
// 设置多面板所有项目显示风格 [R]
native MultiboardSetItemsStyle          takes multiboard lb, boolean showValues, boolean showIcons returns nothing
// 设置多面板所有项目文本 [R]
native MultiboardSetItemsValue          takes multiboard lb, string value returns nothing
// 设置多面板所有项目颜色 [R]
native MultiboardSetItemsValueColor     takes multiboard lb, integer red, integer green, integer blue, integer alpha returns nothing
// 设置多面板所有项目宽度 [R]
native MultiboardSetItemsWidth          takes multiboard lb, real width returns nothing
// 设置多面板所有项目图标 [R]
native MultiboardSetItemsIcon           takes multiboard lb, string iconPath returns nothing


// funcs for modifying individual items
// 获取多面板项目 [R]
native MultiboardGetItem                takes multiboard lb, integer row, integer column returns multiboarditem
//@ desync handle-op 2
// 删除多面板项目 [R]
native MultiboardReleaseItem            takes multiboarditem mbi returns nothing

// 设置多面板指定项目显示风格 [R]
native MultiboardSetItemStyle           takes multiboarditem mbi, boolean showValue, boolean showIcon returns nothing
// 设置多面板指定项目文本 [R]
native MultiboardSetItemValue           takes multiboarditem mbi, string val returns nothing
// 设置多面板指定项目颜色 [R]
native MultiboardSetItemValueColor      takes multiboarditem mbi, integer red, integer green, integer blue, integer alpha returns nothing
// 设置多面板指定项目宽度 [R]
native MultiboardSetItemWidth           takes multiboarditem mbi, real width returns nothing
// 设置多面板指定项目图标（指定图标文件） [R]
native MultiboardSetItemIcon            takes multiboarditem mbi, string iconFileName returns nothing

// meant to unequivocally suspend display of existing and
// subsequently displayed multiboards
//
// 显示/隐藏 所有多面板 [R]
native MultiboardSuppressDisplay        takes boolean flag returns nothing

//============================================================================
// Camera API
// 设置镜头空格键转向点(所有玩家)
native SetCameraPosition            takes real x, real y returns nothing
// 设置镜头空格键转向点(所有玩家)[快速] [R]
native SetCameraQuickPosition       takes real x, real y returns nothing
// 设置可用镜头区域(所有玩家) [R]
native SetCameraBounds              takes real x1, real y1, real x2, real y2, real x3, real y3, real x4, real y4 returns nothing
// 停用镜头(所有玩家) [R]
native StopCamera                   takes nothing returns nothing
// 重置镜头到游戏默认状态(所有玩家) [R]
native ResetToGameCamera            takes real duration returns nothing
// 平移镜头(所有玩家)
native PanCameraTo                  takes real x, real y returns nothing
// 平移镜头(所有玩家)(限时) [R]
native PanCameraToTimed             takes real x, real y, real duration returns nothing
// 平移镜头(所有玩家)(包含z轴)
native PanCameraToWithZ             takes real x, real y, real zOffsetDest returns nothing
// 指定高度平移镜头(所有玩家)(限时) [R]
native PanCameraToTimedWithZ        takes real x, real y, real zOffsetDest, real duration returns nothing
// 播放电影镜头(所有玩家) [R]
native SetCinematicCamera           takes string cameraModelFile returns nothing
// 指定点旋转镜头(所有玩家)(弧度)(限时) [R]
native SetCameraRotateMode          takes real x, real y, real radiansToSweep, real duration returns nothing
// 设置镜头属性(所有玩家)(限时) [R]
native SetCameraField               takes camerafield whichField, real value, real duration returns nothing
// 调整镜头属性(所有玩家)
native AdjustCameraField            takes camerafield whichField, real offset, real duration returns nothing
// 锁定镜头到单位(所有玩家) [R]
native SetCameraTargetController    takes unit whichUnit, real xoffset, real yoffset, boolean inheritOrientation returns nothing
// 锁定镜头到单位(固定镜头源)(所有玩家) [R]
native SetCameraOrientController    takes unit whichUnit, real xoffset, real yoffset returns nothing

// 创建镜头
//@ desync handle-op 3
native CreateCameraSetup                    takes nothing returns camerasetup
// 创建镜头(指定属性)
native CameraSetupSetField                  takes camerasetup whichSetup, camerafield whichField, real value, real duration returns nothing
// 获取镜头属性(指定镜头) [R]
native CameraSetupGetField                  takes camerasetup whichSetup, camerafield whichField returns real
// 设置指定镜头的坐标
native CameraSetupSetDestPosition           takes camerasetup whichSetup, real x, real y, real duration returns nothing
// 获取指定镜头的目标点
// 会创建点，用完请注意排泄
//@ desync handle-op 1
native CameraSetupGetDestPositionLoc        takes camerasetup whichSetup returns location
// 获取指定镜头的 X 坐标
native CameraSetupGetDestPositionX          takes camerasetup whichSetup returns real
// 获取指定镜头的 Y 坐标
native CameraSetupGetDestPositionY          takes camerasetup whichSetup returns real
// 应用镜头
native CameraSetupApply                     takes camerasetup whichSetup, boolean doPan, boolean panTimed returns nothing
// 应用镜头(指定高度)
native CameraSetupApplyWithZ                takes camerasetup whichSetup, real zDestOffset returns nothing
// 应用镜头(所有玩家)(限时) [R]
native CameraSetupApplyForceDuration        takes camerasetup whichSetup, boolean doPan, real forceDuration returns nothing
// 应用镜头(所有玩家)(限时)(指定高度) [R]
native CameraSetupApplyForceDurationWithZ   takes camerasetup whichSetup, real zDestOffset, real forceDuration returns nothing

// 摇晃镜头朝向
native CameraSetTargetNoise             takes real mag, real velocity returns nothing
// 摇晃镜头源
native CameraSetSourceNoise             takes real mag, real velocity returns nothing

// 摇晃镜头目标(所有玩家) [R]
native CameraSetTargetNoiseEx           takes real mag, real velocity, boolean vertOnly returns nothing
// 摇晃镜头源(所有玩家) [R]
native CameraSetSourceNoiseEx           takes real mag, real velocity, boolean vertOnly returns nothing

// 设置镜头平滑参数
native CameraSetSmoothingFactor         takes real factor returns nothing

// 设置滤镜文本内容（从指定文件获取）
native SetCineFilterTexture             takes string filename returns nothing
// 设置滤镜混合模式
native SetCineFilterBlendMode           takes blendmode whichMode returns nothing
// 设置滤镜纹理贴图标志
native SetCineFilterTexMapFlags         takes texmapflags whichFlags returns nothing
// 设置滤镜初始紫外线滤光镜
native SetCineFilterStartUV             takes real minu, real minv, real maxu, real maxv returns nothing
// 设置滤镜结束紫外线滤光镜
native SetCineFilterEndUV               takes real minu, real minv, real maxu, real maxv returns nothing
// 设置滤镜初始颜色
native SetCineFilterStartColor          takes integer red, integer green, integer blue, integer alpha returns nothing
// 设置滤镜结束颜色
native SetCineFilterEndColor            takes integer red, integer green, integer blue, integer alpha returns nothing
// 设置滤镜持续时长
native SetCineFilterDuration            takes real duration returns nothing
// 显示/隐藏 滤镜
native DisplayCineFilter                takes boolean flag returns nothing
// 查询滤镜是否显示
native IsCineFilterDisplayed            takes nothing returns boolean

// 设置电影场景
native SetCinematicScene                takes integer portraitUnitId, playercolor color, string speakerTitle, string text, real sceneDuration, real voiceoverDuration returns nothing
// 结束电影场景
native EndCinematicScene                takes nothing returns nothing
// 开启/关闭 电影字幕显示功能
native ForceCinematicSubtitles          takes boolean flag returns nothing

// 获取镜头指定空白值
native GetCameraMargin                  takes integer whichMargin returns real

//@ desync danger 17
// These return values for the local players camera only...
// 获取可用镜头范围的最小 X 坐标
constant native GetCameraBoundMinX          takes nothing returns real
// 获取可用镜头范围的最小 Y 坐标
constant native GetCameraBoundMinY          takes nothing returns real
// 获取可用镜头范围的最大 X 坐标
constant native GetCameraBoundMaxX          takes nothing returns real
// 获取可用镜头范围的最大 Y 坐标
constant native GetCameraBoundMaxY          takes nothing returns real
// 获取当前镜头的指定属性值
constant native GetCameraField              takes camerafield whichField returns real
// 获取当前镜头目标的 X 坐标
constant native GetCameraTargetPositionX    takes nothing returns real
// 获取当前镜头目标的 Y 坐标
constant native GetCameraTargetPositionY    takes nothing returns real
// 获取当前镜头目标的 Z 坐标
constant native GetCameraTargetPositionZ    takes nothing returns real
// 获取当前镜头目标点
// 会创建点，用完请注意排泄
//@ desync handle-op
//@ desync danger 2
constant native GetCameraTargetPositionLoc  takes nothing returns location
//@ desync danger 6
// 获取当前镜头观察位置的 X 坐标
constant native GetCameraEyePositionX       takes nothing returns real
// 获取当前镜头观察位置的 Y 坐标
constant native GetCameraEyePositionY       takes nothing returns real
// 获取当前镜头观察位置的 Z 坐标
constant native GetCameraEyePositionZ       takes nothing returns real
// 获取当前镜头的观察位置
// 会创建点，用完请注意排泄
//@ desync danger 1
constant native GetCameraEyePositionLoc     takes nothing returns location

//============================================================================
// Sound API
//
// 新天气效果音效
//@ desync handle-op
native NewSoundEnvironment          takes string environmentName returns nothing

//@ desync handle-op 8
// 创建音效
native CreateSound                  takes string fileName, boolean looping, boolean is3D, boolean stopwhenoutofrange, integer fadeInRate, integer fadeOutRate, string eaxSetting returns sound
// 创建音效(指定文件名)
native CreateSoundFilenameWithLabel takes string fileName, boolean looping, boolean is3D, boolean stopwhenoutofrange, integer fadeInRate, integer fadeOutRate, string SLKEntryName returns sound
// 创建音效(指定名字)
native CreateSoundFromLabel         takes string soundLabel, boolean looping, boolean is3D, boolean stopwhenoutofrange, integer fadeInRate, integer fadeOutRate returns sound
// 创建MIDI音效(指定名字)
native CreateMIDISound              takes string soundLabel, integer fadeInRate, integer fadeOutRate returns sound

// 设置音效参数(指定名字)
native SetSoundParamsFromLabel      takes sound soundHandle, string soundLabel returns nothing
// 设置音效截断距离
native SetSoundDistanceCutoff       takes sound soundHandle, real cutoff returns nothing
// 设置音效播放频道
native SetSoundChannel              takes sound soundHandle, integer channel returns nothing
// 设置音效播放音量 [R]
native SetSoundVolume               takes sound soundHandle, integer volume returns nothing
// 设置音效播放速率
native SetSoundPitch                takes sound soundHandle, real pitch returns nothing

// the following method must be called immediately after calling "StartSound" 
// 设置音效播放时间点 [R]
// 使用前必须先调用 StartSound
native SetSoundPlayPosition         takes sound soundHandle, integer millisecs returns nothing

// these calls are only valid if the sound was created with 3d enabled
// 设置3D音效衰减范围
// 仅在使用3D音效时生效
native SetSoundDistances            takes sound soundHandle, real minDist, real maxDist returns nothing
// 设置3D音效音锥角度
// 仅在使用3D音效时生效
native SetSoundConeAngles           takes sound soundHandle, real inside, real outside, integer outsideVolume returns nothing
// 设置3D音效音锥朝向
// 仅在使用3D音效时生效
native SetSoundConeOrientation      takes sound soundHandle, real x, real y, real z returns nothing
// 设置3D音效位置(指定坐标) [R]
// 仅在使用3D音效时生效
native SetSoundPosition             takes sound soundHandle, real x, real y, real z returns nothing
// 设置3D音效播放速度
// 仅在使用3D音效时生效
native SetSoundVelocity             takes sound soundHandle, real x, real y, real z returns nothing
// 设置3D音效位置(指定单位)
// 仅在使用3D音效时生效
native AttachSoundToUnit            takes sound soundHandle, unit whichUnit returns nothing

// 播放音效
native StartSound                   takes sound soundHandle returns nothing
// 停止播放音效(指定是否淡出)
native StopSound                    takes sound soundHandle, boolean killWhenDone, boolean fadeOut returns nothing
// 播放完成时关闭音效
native KillSoundWhenDone            takes sound soundHandle returns nothing

// Music Interface. Note that if music is disabled, these calls do nothing
// 设置地图背景音乐 [R]
// 禁用音乐时没有任何效果
native SetMapMusic                  takes string musicName, boolean random, integer index returns nothing
// 清除地图背景音乐
// 禁用音乐时没有任何效果
native ClearMapMusic                takes nothing returns nothing

// 播放音乐
// 禁用音乐时没有任何效果
native PlayMusic                    takes string musicName returns nothing
// 播放音乐(指定淡入)
// 禁用音乐时没有任何效果
native PlayMusicEx                  takes string musicName, integer frommsecs, integer fadeinmsecs returns nothing
// 暂停音乐
// 禁用音乐时没有任何效果
native StopMusic                    takes boolean fadeOut returns nothing
// 重新播放音乐
// 禁用音乐时没有任何效果
native ResumeMusic                  takes nothing returns nothing

// 播放主题音乐 [C]
native PlayThematicMusic            takes string musicFileName returns nothing
// 跳播主题音乐(指定淡入) [R]
native PlayThematicMusicEx          takes string musicFileName, integer frommsecs returns nothing
// 停止主题音乐[C]
native EndThematicMusic             takes nothing returns nothing

// 设置背景音乐音量 [R]
native SetMusicVolume               takes integer volume returns nothing
// 设置背景音乐播放时间点 [R]
native SetMusicPlayPosition         takes integer millisecs returns nothing
// 设置主题音乐播放时间点 [R]
native SetThematicMusicPlayPosition takes integer millisecs returns nothing

// other music and sound calls
// 设置音效持续时间
native SetSoundDuration             takes sound soundHandle, integer duration returns nothing
//@ desync danger 4
// 获取音效持续时间
native GetSoundDuration             takes sound soundHandle returns integer
// 设置音乐文件持续时间
native GetSoundFileDuration         takes string musicFileName returns integer

// 设置指定声道音量 [R]
native VolumeGroupSetVolume         takes volumegroup vgroup, real scale returns nothing
// 重置所有声道音量 [R]
native VolumeGroupReset             takes nothing returns nothing

// 判断音效是否播放
native GetSoundIsPlaying            takes sound soundHandle returns boolean
// 判断音效是否加载
native GetSoundIsLoading            takes sound soundHandle returns boolean

//@ desync handle-op 4
// 注册矩形区域3D音效
native RegisterStackedSound         takes sound soundHandle, boolean byPosition, real rectwidth, real rectheight returns nothing
// 注销矩形区域3D音效
native UnregisterStackedSound       takes sound soundHandle, boolean byPosition, real rectwidth, real rectheight returns nothing

//============================================================================
// Effects API
//
//@ desync handle-op 7
// 新建天气效果 [R]
// @param effectID 天气特效类型，可在 jass.config.json 找到
native AddWeatherEffect             takes rect where, integer effectID returns weathereffect
// 删除天气效果
native RemoveWeatherEffect          takes weathereffect whichEffect returns nothing
// 打开/关闭 天气效果
native EnableWeatherEffect          takes weathereffect whichEffect, boolean enable returns nothing

// 新建地形变化:弹坑 [R]
// @param radius 半径
// @param depth 深度
// @param duration 持续时间
// @param permanent 临时(false)/永久(true)
//@ desync handle-op
native TerrainDeformCrater          takes real x, real y, real radius, real depth, integer duration, boolean permanent returns terraindeformation
// 新建地形变化:波纹 [R]
// @param radius 结束半径
// @param depth 深度
// @param duration 持续时间
// @param count 记数，默认为1
// @param spaceWaves 分开距离比例(2倍的结束半径 除以 分开距离)
// @param timeWaves 涟漪间隔比例(2倍的持续时间 除以 涟漪间隔)
// @param radiusStartPct 半径比例(变形开始半径 除以 变形结束半径)
// @param limitNeg 普通(false)/下陷(true)
//@ desync handle-op
native TerrainDeformRipple          takes real x, real y, real radius, real depth, integer duration, integer count, real spaceWaves, real timeWaves, real radiusStartPct, boolean limitNeg returns terraindeformation
// 新建地形变化:冲击波 [R]
// @param x 开始点
// @param y 结束点
// @param dirX 坐标比例(结束点 X 坐标 减 开始点 X 坐标 的差 除以 距离)
// @param dirY 坐标比例(结束点 Y 坐标 减 开始点 Y 坐标 的差 除以 距离)
// @param distance 距离(开始点到结束点距离)
// @param speed 速度(持续时间 除以 距离)
// @param radius 结束半径
// @param depth 深度
// @param trailDelay 拖尾延时
// @param count 记数，默认为1
//@ desync handle-op
native TerrainDeformWave            takes real x, real y, real dirX, real dirY, real distance, real speed, real radius, real depth, integer trailTime, integer count returns terraindeformation
// 新建地形变化:随机 [R]
// @param x 开始点
// @param y 结束点
// @param radius 半径
// @param minDelta 最小深度
// @param maxDelta 最大深度
// @param duration 持续时间
// @param updateInterval 更新间隔
//@ desync handle-op
native TerrainDeformRandom          takes real x, real y, real radius, real minDelta, real maxDelta, integer duration, integer updateInterval returns terraindeformation
// 停止指定地形变化 [R]
//@ desync handle-op
native TerrainDeformStop            takes terraindeformation deformation, integer duration returns nothing
// 停止所有地形变化
//@ desync handle-op
native TerrainDeformStopAll         takes nothing returns nothing

//@ desync handle-op 6
// 新建特效(绑定到坐标) [R]
native AddSpecialEffect             takes string modelName, real x, real y returns effect
// 新建特效(绑定到点) [R]
native AddSpecialEffectLoc          takes string modelName, location where returns effect
// 新建特效(绑定到单位/物品/可破坏物) [R]
native AddSpecialEffectTarget       takes string modelName, widget targetWidget, string attachPointName returns effect
//@ desync handle-op 2
// 销毁特效
native DestroyEffect                takes effect whichEffect returns nothing

//@ desync handle-op 12
// 新建特效(按字符串指定技能，绑定到坐标)
native AddSpellEffect               takes string abilityString, effecttype t, real x, real y returns effect
// 新建特效(按字符串指定技能，绑定到点)
native AddSpellEffectLoc            takes string abilityString, effecttype t,location where returns effect
// 按ID新建特效(按ID指定技能，绑定到坐标) [R]
native AddSpellEffectById           takes integer abilityId, effecttype t,real x, real y returns effect
// 新建特效(按ID指定技能，绑定到点) [R]
native AddSpellEffectByIdLoc        takes integer abilityId, effecttype t,location where returns effect
// 新建特效(按字符串指定攻击点，绑定到单位/物品/可破坏物) [R]
native AddSpellEffectTarget         takes string modelName, effecttype t, widget targetWidget, string attachPoint returns effect
// 按ID新建特效(按字符串指定攻击点，绑定到单位/物品/可破坏物) [R]
native AddSpellEffectTargetById     takes integer abilityId, effecttype t, widget targetWidget, string attachPoint returns effect

//@ desync handle-op 12
// 新建闪电特效 [R]
// @param codeName 闪电类型(闪电链 - 主 - "CLPB"、闪电链 - 次 - "CLSB"、汲取 - "DRAB"、生命汲取 - "DRAL"、魔法汲取 - "DRAM"、死亡之指 - "AFOD"、叉状闪电 - "FORK"、医疗波 - 主 - "HWPB"、医疗波 - 次 - "HWSB"、闪电攻击 - "CHIM"、魔法镣铐 - "LEAS"、法力燃烧 - "MBUR"、魔力之焰 - "MFPB"、灵魂锁链 - "SPLK")
native AddLightning                 takes string codeName, boolean checkVisibility, real x1, real y1, real x2, real y2 returns lightning
// 新建闪电特效(指定Z轴) [R]
// @param codeName 闪电类型(闪电链 - 主 - "CLPB"、闪电链 - 次 - "CLSB"、汲取 - "DRAB"、生命汲取 - "DRAL"、魔法汲取 - "DRAM"、死亡之指 - "AFOD"、叉状闪电 - "FORK"、医疗波 - 主 - "HWPB"、医疗波 - 次 - "HWSB"、闪电攻击 - "CHIM"、魔法镣铐 - "LEAS"、法力燃烧 - "MBUR"、魔力之焰 - "MFPB"、灵魂锁链 - "SPLK")
native AddLightningEx               takes string codeName, boolean checkVisibility, real x1, real y1, real z1, real x2, real y2, real z2 returns lightning
// 销毁闪电特效
//@ nodiscard
native DestroyLightning             takes lightning whichBolt returns boolean
// 移动闪电特效
//@ nodiscard
native MoveLightning                takes lightning whichBolt, boolean checkVisibility, real x1, real y1, real x2, real y2 returns boolean
// 移动闪电特效(指定坐标) [R]
native MoveLightningEx              takes lightning whichBolt, boolean checkVisibility, real x1, real y1, real z1, real x2, real y2, real z2 returns boolean
// 获取闪电特效 Alpha色值
native GetLightningColorA           takes lightning whichBolt returns real
// 获取闪电特效 红色值
native GetLightningColorR           takes lightning whichBolt returns real
// 获取闪电特效 绿色值
native GetLightningColorG           takes lightning whichBolt returns real
// 获取闪电特效 蓝色值
native GetLightningColorB           takes lightning whichBolt returns real
// 设置闪电特效颜色
//@ nodiscard
native SetLightningColor            takes lightning whichBolt, real r, real g, real b, real a returns boolean

// 获取技能特效路径(指定技能字符串和索引)
native GetAbilityEffect             takes string abilityString, effecttype t, integer index returns string
// 获取技能特效路径(指定技能ID和索引)
native GetAbilityEffectById         takes integer abilityId, effecttype t, integer index returns string
// 获取技能音效路径(指定技能字符串和音效类型)
native GetAbilitySound              takes string abilityString, soundtype t returns string
// 获取技能音效路径(指定技能ID和音效类型)
native GetAbilitySoundById          takes integer abilityId, soundtype t returns string

//============================================================================
// Terrain API
//
// 获取地形悬崖高度(指定坐标) [R]
// 深水区为0，浅水区为1，平原为2，每升高一层+1，每降低一层-1
native GetTerrainCliffLevel         takes real x, real y returns integer
// 设置水面颜色 [R]
native SetWaterBaseColor            takes integer red, integer green, integer blue, integer alpha returns nothing
// 启用/禁用 水面变形
//@ desync handle-op 1
native SetWaterDeforms              takes boolean val returns nothing
// 获取指定坐标地形类型 [R]
native GetTerrainType               takes real x, real y returns integer
// 获取地形样式(指定坐标) [R]
native GetTerrainVariance           takes real x, real y returns integer
// 设置地形类型(指定坐标) [R]
// @param terrainType 地表纹理，具体类型可在 记录物编的文件 找到
//@ desync handle-op 1
native SetTerrainType               takes real x, real y, integer terrainType, integer variation, integer area, integer shape returns nothing
// 查询路径类型是否指定类型(指定坐标) [R]
native IsTerrainPathable            takes real x, real y, pathingtype t returns boolean
// 设置路径类型状态(指定坐标) [R]
//@ desync handle-op 1
native SetTerrainPathable           takes real x, real y, pathingtype t, boolean flag returns nothing

//============================================================================
// Image API
//
//@ desync handle-op 24
// 新建图像 [R]
// @param imageType 图像类型，可输入 0~5（阴影 - SHADOW、选择 - SELECTION、指示器 - INDICATOR、闭塞标志 - OCCLUSIONMARK、地面纹理变化 - UBERSPLAT、最顶端 - LAST）
native CreateImage                  takes string file, real sizeX, real sizeY, real sizeZ, real posX, real posY, real posZ, real originX, real originY, real originZ, integer imageType returns image
// 销毁图像
native DestroyImage                 takes image whichImage returns nothing
// 显示/隐藏 图像[R]
native ShowImage                    takes image whichImage, boolean flag returns nothing
// 设置图像高度
native SetImageConstantHeight       takes image whichImage, boolean flag, real height returns nothing
// 设置图像位置(指定坐标) [R]
native SetImagePosition             takes image whichImage, real x, real y, real z returns nothing
// 设置图像颜色 [R]
// @param alpha 透明度
native SetImageColor                takes image whichImage, integer red, integer green, integer blue, integer alpha returns nothing
// 允许/禁止 图像渲染
native SetImageRender               takes image whichImage, boolean flag returns nothing
// 允许/禁止 图像永久渲染
native SetImageRenderAlways         takes image whichImage, boolean flag returns nothing
// 允许/禁止 图像在水面显示
// @param useWaterAlpha 允许(使用)/禁止(不使用) 水透明通道
native SetImageAboveWater           takes image whichImage, boolean flag, boolean useWaterAlpha returns nothing
// 设置图像类型
// @param imageType 图像类型，可输入 0~5（对应阴影 - SHADOW、选择 - SELECTION、指示器 - INDICATOR、闭塞标志 - OCCLUSIONMARK、地面纹理变化 - UBERSPLAT、最顶端 - LAST）
native SetImageType                 takes image whichImage, integer imageType returns nothing

//============================================================================
// Ubersplat API
//
// 新建地表纹理 [R]
// @param name 具体纹理可在 记录物编的文件 找到
// @param alpha 透明度
// @param forcePaused 是否禁用暂停状态
// @param noBirthTime 是否启用出生动画
//@ desync handle-op 13
native CreateUbersplat              takes real x, real y, string name, integer red, integer green, integer blue, integer alpha, boolean forcePaused, boolean noBirthTime returns ubersplat
// 销毁地表纹理
native DestroyUbersplat             takes ubersplat whichSplat returns nothing
// 重置地表纹理
native ResetUbersplat               takes ubersplat whichSplat returns nothing
// 结束地表纹理
native FinishUbersplat              takes ubersplat whichSplat returns nothing
// 显示/隐藏 地表纹理[R]
native ShowUbersplat                takes ubersplat whichSplat, boolean flag returns nothing
// 允许/禁止 地表纹理渲染
native SetUbersplatRender           takes ubersplat whichSplat, boolean flag returns nothing
// 允许/禁止 地表纹理永久渲染
native SetUbersplatRenderAlways     takes ubersplat whichSplat, boolean flag returns nothing

//============================================================================
// Blight API
//
//@ desync handle-op 12
// 创建/删除 荒芜地表(不死族)(圆形范围)(指定坐标) [R]
native SetBlight                takes player whichPlayer, real x, real y, real radius, boolean addBlight returns nothing
// 创建/删除 荒芜地表(不死族)(指定矩形区域) [R]
native SetBlightRect            takes player whichPlayer, rect r, boolean addBlight returns nothing
// 创建/删除 荒芜地表(不死族)(指定坐标)
native SetBlightPoint           takes player whichPlayer, real x, real y, boolean addBlight returns nothing
// 创建/删除 荒芜地表(不死族)(指定圆形范围)(指定点)
native SetBlightLoc             takes player whichPlayer, location whichLocation, real radius, boolean addBlight returns nothing
// 新建不死族金矿(指定所属玩家，坐标及朝向) [R]
native CreateBlightedGoldmine   takes player id, real x, real y, real face returns unit
// 查询指定坐标是否被荒芜地表(不死族)覆盖 [R]
native IsPointBlighted          takes real x, real y returns boolean

//============================================================================
// Doodad API
//
// 播放圆形范围内指定类型的地表装饰物动画 [R]
// @param nearestOnly 是否只播放最接近范围内装饰物
// @param animName 动画名称
// @param animRandom 是否随机播放
native SetDoodadAnimation       takes real x, real y, real radius, integer doodadID, boolean nearestOnly, string animName, boolean animRandom returns nothing
// 播放矩形区域内指定类型的地表装饰物动画 [R]
// @param nearestOnly 是否只播放最接近范围内装饰物
// @param animName 动画名称
// @param animRandom 是否随机播放
native SetDoodadAnimationRect   takes rect r, integer doodadID, string animName, boolean animRandom returns nothing

//============================================================================
// Computer AI interface
//
// 启用对战 AI 脚本
// 只对游戏初始化时控制者类型为电脑的玩家生效
// 对战和战役的区别不明，暴雪已经区分了对战和战役脚本，脚本本身调用了不同的代码，因此对脚本本身应该没有影响
//@ desync handle-op
native StartMeleeAI         takes player num, string script                 returns nothing
// 启用战役 AI 脚本
// 只对游戏初始化时控制者类型为电脑的玩家生效
// 对战和战役的区别不明，暴雪已经区分了对战和战役脚本，脚本本身调用了不同的代码，因此对脚本本身应该没有影响
//@ desync handle-op
native StartCampaignAI      takes player num, string script                 returns nothing
// 发送 AI 命令
// 同AI脚本单向通信，脚本需有对应代码监控命令并执行，否则无效
//@ desync handle-op
native CommandAI            takes player num, integer command, integer data returns nothing
// 暂停/恢复 AI脚本运行 [R]
//@ desync handle-op
native PauseCompAI          takes player p,   boolean pause                 returns nothing
// 获取指定AI玩家的难度（只对AI玩家生效）
// 编号从0开始，即玩家1编号为0
//@ desync handle-op
native GetAIDifficulty      takes player num                                returns aidifficulty

// 忽略单位的防守职责，AI几乎不会再控制忽略防守职责的单位，直至恢复(英雄复活后自动恢复)
// 建筑的自动攻击、训练和研究，小精灵自爆不受影响
// 单位仍受代码控制
//@ desync handle-op
native RemoveGuardPosition  takes unit hUnit                                returns nothing
// 恢复单位的防守职责
//@ desync handle-op
native RecycleGuardPosition takes unit hUnit                                returns nothing
// 忽略所有单位的防守职责，AI几乎不会再控制忽略防守职责的单位，直至恢复(英雄复活后自动恢复)
// 建筑的自动攻击、训练和研究，小精灵自爆不受影响
// 单位仍受代码控制
//@ desync handle-op
native RemoveAllGuardPositions takes player num                             returns nothing

//============================================================================
// 作弊码
native Cheat            takes string cheatStr returns nothing
// 查询游戏是否无法胜利（输入了作弊） [R]
native IsNoVictoryCheat takes nothing returns boolean
// 查询游戏是否无法失败（输入了作弊） [R]
native IsNoDefeatCheat  takes nothing returns boolean

// 预载文件
//@ desync handle-op
native Preload          takes string filename returns nothing
// 停止预载（指定时间）
//@ desync handle-op
native PreloadEnd       takes real timeout returns nothing

// 开始预载
//@ desync handle-op
native PreloadStart     takes nothing returns nothing
// 刷新预载
//@ desync handle-op
native PreloadRefresh   takes nothing returns nothing
// 结束预载
//@ desync handle-op
native PreloadEndEx     takes nothing returns nothing

// 清空预载
//@ desync handle-op
native PreloadGenClear  takes nothing returns nothing
// 开始预载
// - 配合PreloadGenEnd使用
//@ desync handle-op
native PreloadGenStart  takes nothing returns nothing
// 结束预载
// @param filename 绝对路径,这个文件的后缀可以是任何类型,因此你可以生成可执行文件的后缀
//@ desync handle-op
native PreloadGenEnd    takes string filename returns nothing
// 预载文件
//@ desync handle-op
native Preloader        takes string filename returns nothing
