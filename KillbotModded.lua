-- THE DEFINITION OF ANNOYING (something random from my mind)
-- ok DeltaFix6

if not game:IsLoaded() then game.Loaded:Wait() end
loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()
wait(15)
loadstring(game:HttpGet("https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/KillbotDefault.lua"))()

local url = "https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/kbot.mp3"
local data = game:HttpGet(url, true)
writefile("kbot.mp3", data)

local sound = Instance.new("Sound")
sound.SoundId = "file://kbot.mp3"
sound.Looped = true
sound.Volume = 0.5
sound.Parent = workspace
sound:Play()

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "yippee",
    Text = "i hope you clicked Take me there if the game isnt supported (in under 10 secs)",
    Duration = 5
})
