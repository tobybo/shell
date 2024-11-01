module("config", package.seeall)

-- game 标识、唯一ID
Game = "tis"
Map = tonumber(os.getenv("MAPID")) or 1
Tips = Game .. "_" .. Map

-- 入口文件
StartScript = "frame/frame.lua"

-- 是否守护进程模式：0 关闭；1 开启
Daemon = 0

-- Develop / Release
Release = os.getenv("RELEASE") == "true"

-- 是否加载 debugger.lua
Debugger = false

-- db 信息
Mongo = {
    Auth = {
        -- username = "",
        -- password = "",
        -- authmod = "",    -- "MONGODB-CR" or "SCRAM-SHA-1"
        -- authdb = "",
    },
    Game = {
        {host="127.0.0.1", port=27017},
    },
    Global = {
        {host="127.0.0.1", port=27017},
    },
}

-- gate 地址
GateHost = os.getenv("GATEHOST") or "127.0.0.1"
GatePort = tonumber(os.getenv("GATEPORT")) or 20001

TlogSwitch = true
FilterSwitch = true

-- 预分配内存大小，推荐2048
BuddySize = 128

-- 战斗线程数量
BattleThreadNum = 3

-- 流控：登录、在线
MaxOnlineNum = 5000
MaxPlayer = 30000
LoadNumPreSec = 2

-- 客户端最低版本
Version = 0

-- 时区
TimeZone = "GMT0"

-- 日志
LogLevel = tonumber(os.getenv("LOGLEVEL")) or 3
Log = { Tips, "../log/", 1440, 30, 1440, 30, 1440, 30 }

-- gm
-- GM_CBT_SPEED          = -- 战斗部队速度
-- GM_GATHER_SPEED       = -- 采集部队速度
-- GM_RECON_SPEED        = -- 侦察部队速度
-- GM_COMMON_SPEED       = -- 通用速度（一些没有自己设置速度的部队）
GM_FORMULA = true          -- 属性计算详情打印
-- GM_NO_MAP_REFRESH     = -- 不要刷地图
-- GM_ATLAS_AI_RUNNING   = -- 大地图AI数量
GM_CHAT_CLOSE = true
GM_NAVMESH_LOG_SWITCH = 0 -- 0 关 1 开 nav日志
GM_GIFT_PUSH_CLOSE = true -- 关闭礼包推送
