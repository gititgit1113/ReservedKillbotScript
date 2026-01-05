-- alright i added audio hope you enjoy
-- made by Reserved
-- thanks to DeepSeek AI for helping
if not game:IsLoaded() then game.Loaded:Wait() end

local function playKillbotSong()
    print("🎵 Playing Killbot theme...")
    
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://125479500950400"
    sound.Volume = 2
    sound.Pitch = 1.0
    sound.PlaybackSpeed = 0.2
    sound.Name = "KillbotTheme"
    sound.Looped = true
    sound.Parent = game:GetService("Workspace")
    
    local success, err = pcall(function()
        sound:Play()
    end)
    
    if success then
        print("✅ Audio is playing (looped)!")
        print("   Volume: 2 | Pitch: 1.0 | Speed: 0.2")
        
        task.delay(60, function()
            if sound and sound.Playing then
                sound:Stop()
                sound:Destroy()
                print("⏹️ Audio stopped after 60 seconds")
            end
        end)
    else
        print("❌ Audio failed:", err)
        print("⚠ Make sure Audio ID 125479500950400 is valid and accessible")
        sound:Destroy()
    end
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

loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/Pendulum-Fixed-AND-Others-Scripts/refs/heads/main/Killbot%20V2"))()
