--[[
    脚本标题：前端性能测试，建立4个文明不同等级城堡，移动到同一个坐标附近
    ==========================
    执行过程
    1、下载配置 --为了保证留下上次测试脚本，不丢失
    2、选择配置文件，上传
    3、开始序号：建立机器人开始的序号 --建立前，需要上传脚本，会读脚本中的机器人名字配置
    4、结束序号：建立机器人结束的序号
    5、开始执行
    6、关闭执行
    7、获取日志：可以填写获取日志的行数，点击按钮下载
    ==========================
--]]

--------------------------------------------------------------------------
module("config", package.seeall)

-- game 标识、唯一ID
Game = "tis"
Map = tonumber(os.getenv("MAPID")) or 1
Tips = "robot" .. "_" .. Map

-- 入口文件
StartScript = "forqc/main.lua"

-- 是否机器人模式
IsRobot = true
UseCpu = 3

-- 是否守护进程模式：0 关闭；1 开启
Daemon = 0

-- Develop / Release
Release = os.getenv("RELEASE") == "true"

-- 是否加载 debugger.lua
Debugger = false


-- gate 地址
GateHost = os.getenv("GATEHOST") or "10.23.0.85"
GatePort = tonumber(os.getenv("GATEPORT")) or 20002

-- 预分配内存大小，推荐2048
BuddySize = 128

-- 时区
TimeZone = "GMT0"

-- 日志
LogLevel = tonumber(os.getenv("LOGLEVEL")) or 2
Log = { Tips, "../log_3/", 1440, 30, 1440, 30, 1440, 30 }

TaskList = os.getenv("TASKLIST") or "case_login"

-- Autobot
Autobot = {}

NoReceive = 0 -- 1 不接收数据
OpenProtocol = {loadData = 1, onLogin = 1, getTime = 1}

-- case_login 控制参数
Autobot.Login = {
    from_idx = 3901, -- 起始账号序号
    all = 1300,   -- 总量
    --max_online = 100, -- 最大在线
    max_online = 600, -- 最大在线
    do_loaddata = 1,  -- load必要数据

    -- stream = {{0, 10}, {2, 30}, {5, 60}}, --{{启动后多少秒, 本次登录账号数}} 例: 启动登录100个账号, 2秒后登录300，5秒后登录600
    average = 3, -- 平均每秒登录数量

    -- case_login.do_login_old 老的混合
    do_blend = {3000, 3000, 3000, 1000},     -- 混合模式  战斗, 城建各种建造升级解锁, moveEye, 简单保持在线
    -- case_login.do_login 新的混合
    smoke = {
        battle = 3000, -- 派一只部队战斗的权重
        look   = 3000, -- 地图上到处看的权重
        logout = 50, -- 下线一段时间后再上线的权重
        union  = {200, 9000}, -- {200(创建联盟的概率), 9000(没有创建的话，主动加入联盟的概率)}
    }

    -- [[
    --    qa_union = {
    --        uid = 1, -- 加入指定的联盟
    --    }
    --]]

}

-- case_pvp 控制参数
Autobot.Pvp = {
    from_idx  = 10, -- 基础账号序号
    scene_num = 10,  -- 战场数量
    troop_num = 10, -- 每场战斗的部队数量
}

Autobot.Road = {
    scene_num = 400, -- scene_num 个点位 互相寻路
    average = 200, -- 平均每秒寻路次数
}

Autobot.Eye = {
    from_idx = 1, -- 玩家idx
    num = 100, -- 多少个眼
}

