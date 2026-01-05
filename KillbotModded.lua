-- Okay I hope this works
-- Made by Reserved (OGChatUnlocker on Roblox)
-- DeepSeek AI (creds to him cuz he helped me)
-- ENJOY (and I hope this works again)

loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()
wait(7)
loadstring(game:HttpGet("https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/KillbotDefault.lua"))()

local function downloadAndPlayAudio(filename, url)
    if not writefile or not readfile then
        print("❌ File system access not available")
        return nil
    end
    
    print("📥 Downloading: " .. filename)
    
    local audioData = game:HttpGet(url, true)
    
    writefile(filename, audioData)
    print("✅ Saved as: " .. filename)
    
    repeat
        task.wait(0.1)
    until isfile(filename)
    
    local sound = Instance.new("Sound")
    sound.Name = "KillbotMusic"
    sound.Looped = true
    sound.Volume = 0.7
    sound.Parent = workspace
   
    if getcustomasset then
        sound.SoundId = getcustomasset(filename)
        print("🔗 Using getcustomasset: " .. sound.SoundId)
    else
        sound.SoundId = "file://" .. filename
        print("🔗 Using file:// protocol")
    end

    local startTime = tick()
    while tick() - startTime < 10 and not sound.IsLoaded do
        task.wait(0.5)
        print("Loading audio...")
    end
    
    if sound.IsLoaded then
        sound:Play()
        print("🎵 Audio playing successfully!")
        return sound
    else
        print("❌ Audio failed to load")
        sound:Destroy()
        return nil
    end
end

spawn(function()
    local songFile = "killbot_theme.mp3"
    local songUrl = "https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/kbot.mp3"
    
    local music = downloadAndPlayAudio(songFile, songUrl)
    
    if not music then
        print("🔄 Trying alternative method...")

        local sound = Instance.new("Sound")
        sound.Name = "BackupMusic"
        sound.Looped = true
        sound.Volume = 0.5
        sound.Parent = workspace
        
        local formats = {
            "https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/kbot.mp3",
            "rbxassetid://9096765392",  -- Your ID
            "rbxassetid://9111348332",  -- Fallback
        }
        
        for _, url in ipairs(formats) do
            pcall(function()
                sound.SoundId = url
                wait(2)
                if sound.IsLoaded then
                    sound:Play()
                    print("✅ Playing from: " .. url)
                    break
                end
            end)
        end
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Killbot Loaded",
    Text = "FINALLY BRO",
    Duration = 5
})
