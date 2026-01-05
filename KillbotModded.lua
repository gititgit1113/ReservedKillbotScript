-- THIS WORKS
-- thanks to deepseek for help. made by Reserved

if not game:IsLoaded() then game.Loaded:Wait() end

local discordUrl = "https://cdn.discordapp.com/attachments/1457717148884406385/1457717419069018235/kbot.mp3"

local function playKillbotSong()
    print("🎵 Playing Killbot theme from Discord CDN...")
    
    local sound = Instance.new("Sound")
    sound.SoundId = discordUrl
    sound.Volume = 1
    sound.Name = "KillbotTheme"
    sound.Looped = true
    sound.Parent = game:GetService("Workspace")
    
    local success, err = pcall(function()
        sound:Play()
    end)
    
    if success then
        print("✅ Audio is playing!")
        
        sound.Ended:Connect(function()
            task.wait(2)
            if sound then
                sound:Destroy()
            end
        end)
        
        task.delay(30, function()
            if sound and sound.Parent then
                sound:Destroy()
            end
        end)
    else
        print("❌ Audio failed:", err)
        
        sound.SoundId = "https://cdn.discordapp.com/attachments/1457717148884406385/1457717419069018235/kbot.mp3?ex=695d04a3&is=695bb323&hm=de865bb02c64929ffeb2c18a5a8a4f32296fc0b3f40b969d45b145240a05be41&"
        sound:Play()
        print("🔄 Trying with full URL...")
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
