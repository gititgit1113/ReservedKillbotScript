-- this works finally (release 1.0?)
-- MADE BY RESERVED AS ALWAYS :3

if not game:IsLoaded() then game.Loaded:Wait() end

local function playKillbotSong()
    -- Download the MP3 file
    local soundUrl = "https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/kbot.mp3"
    
    local sound = Instance.new("Sound")
    sound.SoundId = soundUrl
    sound.Volume = 1
    sound.Looped = false
    sound.Name = "KillbotTheme"
    
    sound.Parent = game:GetService("Workspace")
    
    sound:Play()
    
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
    
    sound:GetPropertyChangedSignal("Playing"):Connect(function()
        if not sound.Playing then
            task.wait(2)
            if sound then
                sound:Destroy()
            end
        end
    end)
end

playKillbotSong()

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
