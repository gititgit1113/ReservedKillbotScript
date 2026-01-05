-- KILLBOTS ARE TAKING OVER ROBLOX
-- This is a server-sided script (but it doesn't work in a lot of games)
-- Supported games I tested is Mega Run Marble Pit game and Piano Keyboard v1.1
-- Enjoy. Made by Reserved

if not game:IsLoaded() then game.Loaded:Wait() end

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
                    wait(3)
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
