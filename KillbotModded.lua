-- minimal version (delta friendly)
loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()
wait(15)
loadstring(game:HttpGet("https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/KillbotDefault.lua"))()

spawn(function()
    local sound = Instance.new("Sound")
    sound.SoundId = "https://github.com/gititgit1113/ReservedKillbotScript/raw/refs/heads/main/kbot.mp3"
    sound.Looped = true
    sound.Volume = 0.5
    sound.Parent = workspace
    sound:Play()
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "yippee",
    Text = "i hope you clicked Take me there if the game isnt supported (in under 10 secs)",
    Duration = 5
})
