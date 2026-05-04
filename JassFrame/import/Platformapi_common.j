//统一获取数据的接口

//获取integer数据
native RequestExtraIntegerData takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns integer

//获取boolean数据
//@ nodiscard 1
native RequestExtraBooleanData takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns boolean

//获取string数据
native RequestExtraStringData takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns string

//获取real数据
native RequestExtraRealData takes integer dataType, player whichPlayer, string param1, string param2, boolean param3, integer param4, integer param5, integer param6 returns real

////////////////////////////////////////////////////////////////////////////////////////
// Data Type
// 取值范围从1开始
////////////////////////////////////////////////////////////////////////////////////////

// EnablePlatformSettings,        //启用平台功能 option = 1 锁定镜头距离，option = 2 显示血、蓝条，option = 3 智能施法，option = 4 改键
function DzAPI_Map_EnablePlatformSettings takes player whichPlayer, integer option, boolean enable returns boolean
    if(whichPlayer==null)then
        return false
    endif
    return RequestExtraBooleanData(43, whichPlayer, null, null, enable, option, 0, 0)
endfunction

// Statistics,                    //平台统计
function DzAPI_Map_Statistics takes player whichPlayer, string eventKey, string eventType, integer value returns nothing
    if(whichPlayer==null)then
        return
    endif
    call RequestExtraBooleanData(34, whichPlayer, eventKey, eventType, false, value, 0, 0)
endfunction

 function DzAPI_Map_Returns takes player whichPlayer,integer label returns boolean
    if(whichPlayer==null)then
        return false
    endif
    return RequestExtraBooleanData(53, whichPlayer, null, null, false, label, 0, 0)
endfunction

function DzAPI_Map_CommentCount takes player whichPlayer returns integer
    if(whichPlayer==null)then
        return 0
    endif
    return RequestExtraIntegerData(46, whichPlayer, null, null, false, 0, 0, 0)
endfunction

function DzAPI_Map_GetForumData takes player whichPlayer,integer whichData returns integer
    if(whichPlayer==null)then
        return 0
    endif
    return RequestExtraIntegerData(65, whichPlayer, null, null, false, whichData, 0, 0)
endfunction

function DzAPI_Map_GetMallItemCount takes player whichPlayer,string key returns integer
    if(whichPlayer==null)then
        return 0
    endif
    return RequestExtraIntegerData(41, whichPlayer, key, null, false, 0, 0, 0)
endfunction

function DzAPI_Map_ConsumeMallItem takes player whichPlayer,string key,integer count returns boolean
    if(whichPlayer==null)then
        return false
    endif
    return RequestExtraBooleanData(42, whichPlayer, key, null, false, count, 0, 0)
endfunction