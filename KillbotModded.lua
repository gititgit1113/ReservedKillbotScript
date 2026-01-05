-- delta fix 2
loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()
wait(7)
loadstring(game:HttpGet("https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/KillbotDefault.lua"))()

spawn(function()
    local audioUrl = "https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/kbot.mp3"
    
    print("📥 downloading cool song")
    
    local audioData = game:HttpGet(audioUrl, true)
    
    local fileName = "kbot_song.mp3"
    if writefile then
        writefile(fileName, audioData)
        print("✅ saved to: " .. fileName)
        
        local sound = Instance.new("Sound")
        sound.SoundId = "file://" .. fileName  -- THIS WORKS!
        sound.Looped = true
        sound.Volume = 0.5
        sound.Parent = workspace
        
        for i = 1, 10 do
            if sound.IsLoaded then break end
            wait(0.5)
            print("alright loading up " .. i)
        end
        
        sound:Play()
        print("🎵 playing")
    else
        print("❌ writefile not available in this executor")
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "yippee",
    Text = "audio downloading so uhh ye",
    Duration = 5
})

print("\n⚠️ audio saved locally")
