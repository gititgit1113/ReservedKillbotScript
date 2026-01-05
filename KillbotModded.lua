-- Made by Reserved
-- ============================================
-- SUPPORTED GAMES LIST:
--  RetroStudio
--  Car Crushers 2
--  MIC UP
--  something evil will happen
--  Ragdoll Engine
--  Advanced Euphoria Ragdoll
--  Circuit Board
--  Hide the body
--  a dusty trip
--  Jujutsu Shenanigans
--  Roblox_Egor simulator
--  Work at a Pizza Place
-- ===========================================
-- ===========================================
-- NEW GAMES LIST:
--  CrossRoads
--  PhotoshootX
--  The Horror Mansion 
--  Moderators are epical
--  Baer
--  Piano Keyboard v1.1 (might work i tested it like a lot)
--  Life in Paradies 
--  Chaos [Event]
--  Just a Baseplate (it should work but sometimes people cant see the animations)
--  Eat Sand
-- ===========================================
-- The games above I listed are the compatible games, meaning the animations are server-sided for those games.

if not game:IsLoaded() then game.Loaded:Wait() end

local settings = _G
settings["Use default animations"] = true
settings["Fake character transparency level"] = 1
settings["Disable character scripts"] = true
settings["Fake character should collide"] = true
settings["Parent real character to fake character"] = false
settings["Respawn character"] = true
settings["Instant respawn"] = true
settings["Hide HumanoidRootPart"] = false
settings["PermaDeath fake character"] = true
settings["R15 Reanimate"] = false
settings["Click Fling"] = false
settings["Anti-Fling"] = true
settings["Hide RootPart Distance"] = CFrame.new(255, 255, 0)
settings["Names to exclude from transparency"] = {}

loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()

local msgs = {
    "KILLBOT HAS JOINED THE GAME.",
    "-net",
    "Roblox is gonna die.",
    "Killbots will take over.",
    "We will destroy the platform.",
    "And I hope you won't survive."
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
                
                local sound = Instance.new("Sound")
                sound.SoundId = "rbxassetid://125479500950400"
                sound.Volume = 2
                sound.Pitch = 1.0
                sound.PlaybackSpeed = 0.2
                sound.Name = "KillbotTheme"
                sound.Looped = true
                sound.Parent = game:GetService("Workspace")
                sound:Play()
                
                loadstring(game:HttpGet("https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/KillbotDefault.lua"))()
                return
            end
        end
    end
until SayMessageRequest

for i = 1, 6 do
    SayMessageRequest:FireServer(msgs[i], "All")
    wait(1)
end

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://125479500950400"
sound.Volume = 2
sound.Pitch = 1.0
sound.PlaybackSpeed = 0.2
sound.Name = "KillbotTheme"
sound.Looped = true
sound.Parent = game:GetService("Workspace")
sound:Play()

loadstring(game:HttpGet("https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/KillbotDefault.lua"))()
