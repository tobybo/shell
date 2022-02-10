local map   = tonumber(arg[1])
local itype = tonumber(arg[2]) -- 不同的机器人功能
local num   = tonumber(arg[3])
local uid   = tonumber(arg[4])

E_TYPE_JOIN_UNION = 1 -- 加入联盟

local file_name = "robot.lua.example"
dofile(file_name)
local serpent = dofile("../script/frame/serpent.lua")
local file_content = [[
    module("config", package.seeall)

]]

math.randomseed(os.time())

config.Map = map

if itype == E_TYPE_JOIN_UNION then
    -- toby@2021-11-30 11:06:19: 加入联盟
    config.Autobot.Login.from_idx = math.random(1,9999999)
    print("随机数: ", config.Autobot.Login.from_idx)
    config.Autobot.Login.all = num
    config.Autobot.Login.average = 2
    config.Autobot.Login.smoke.union = {200, 10000}
    config.Autobot.Login.qa_union = {}
    if uid then
        -- toby@2021-11-30 11:06:35: 指定联盟
        config.Autobot.Login.qa_union.uid = uid
    else
        -- toby@2021-11-30 11:06:43: 随机
    end
end

local file = io.open("robot_qa.lua", "w+")
io.output(file)
io.write(file_content)
for k, v in pairs(config) do
    if k ~= "_NAME" and k ~= "_M" then
        local content = string.format("%s = %s\n", k, serpent.line(v, {comment=false, nocode=false, compact=false, maxlevel=5}))
        io.write(content)
    end
end
io.close(file)
