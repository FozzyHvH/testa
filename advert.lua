

local placeid = 126884695634066

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local rs = game:GetService("RunService")

local function Hop()
    warn("Hopping to a new random server...")
    game:GetService('TeleportService'):Teleport(placeid, Players.LocalPlayer)
end

local TextChatService = game:GetService("TextChatService")

local function message(m)
    local channel = TextChatService.TextChannels and TextChatService.TextChannels.RBXGeneral
    if channel then
        channel:SendAsync(m)
    else
        warn("Default chat channel not found!")
    end
end




local function tptoplayer(targetplayer)
    if targetplayer.Character and targetplayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character:SetPrimaryPartCFrame(targetplayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0))
    end
end

local messages = {env.msg, env.msg2, env.msg3}

local function advertise()
    if #Players:GetPlayers() < env.minimumplayers then
        warn("Not enough players to advertise! (" .. #Players:GetPlayers() .. "/" .. env.minimumplayers .. ")")
        Hop()
        return
    end
    local idx = 1
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local connection
            connection = rs.Heartbeat:Connect(function()
                tptoplayer(player)
            end)
            message(messages[idx] or env.msg)
            task.wait(7)
            if connection then
                connection:Disconnect()
            end
            idx = idx + 1
            if idx > #messages then idx = 1 end
        end
    end
    Hop()
end

task.spawn(advertise)
