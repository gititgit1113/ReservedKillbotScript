-- made by Reserved
-- enjoy and if it doesn't say "This game isn't supported!" then it will be server sided

if not game:IsLoaded() then game.Loaded:Wait() end

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

-- Wait for chat events
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
                -- Play audio AFTER killbot script
                playKillbotAudio()
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

local function playKillbotAudio()
    wait(1)
    
    print("🎵 Playing Killbot theme after activation...")
    
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://125479500950400"
    sound.Volume = 2
    sound.Pitch = 1.0
    sound.PlaybackSpeed = 0.2
    sound.Name = "KillbotTheme"
    sound.Looped = true
    sound.Parent = game:GetService("Workspace")
    
    -- Try to play
    local success, err = pcall(function()
        sound:Play()
    end)
    
    if success then
        print("✅ Killbot theme playing! (Volume: 2 | Speed: 0.2)")
    else
        print("❌ Audio failed:", err)
        sound:Destroy()
    end
end

playKillbotAudio()
