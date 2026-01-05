loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()
wait(7)
loadstring(game:HttpGet("https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/KillbotDefault.lua"))()

spawn(function()
    local audioUrl = "https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/kbot.mp3"
    
    print("📥 downloading song...")
    local audioData = game:HttpGet(audioUrl, true)
    
    local fileName = "kbot_song.ogg"
    writefile(fileName, audioData)
    print("✅ saved as: " .. fileName)

    local sound = Instance.new("Sound")
    sound.Name = "BackgroundMusic"
    sound.Looped = true
    sound.Volume = 0.7
    sound.Parent = workspace
    
    sound.SoundId = "file://" .. fileName
    
    print("🔄 loading audio (wait 5 secs)")
    
    for i = 1, 10 do
        wait(0.5)
        print("loading... " .. i * 0.5 .. "s")
    end
    
    sound:Play()
    print("🎵 attempting to play")
    
    wait(2)
    print("audio status:")
    print("- IsPlaying: " .. tostring(sound.IsPlaying))
    print("- IsLoaded: " .. tostring(sound.IsLoaded))
    print("- TimeLength: " .. tostring(sound.TimeLength))
    
    if not sound.IsPlaying then
        print("🔄 restarting audio...")
        sound:Stop()
        wait(0.5)
        sound:Play()
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "yippee",
    Text = "song downloaded! check console for status",
    Duration = 5
})

spawn(function()
    wait(3)
    local UserGameSettings = UserSettings():GetService("UserGameSettings")
    pcall(function()
        UserGameSettings.MasterVolume = 1.0
        print("🔊 volume set to max")
    end)
end)
