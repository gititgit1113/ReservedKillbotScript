-- never saw this one (SUPER IDOL- jk)
-- Made by Reserved
-- DeepSeek AI is helping me cuz idk how do I play audio from github url
-- so i hope u enjoy

loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()
wait(6)
loadstring(game:HttpGet("https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/KillbotDefault.lua"))()

-- NOTIFICATION
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "yippee",
    Text = "i hope you clicked Take me there if the game isnt supported (in under 10 secs)",
    Duration = 5
})

-- GITHUB MEDIA PLAYER FUNCTION (FROM THE SCRIPT YOU FOUND)
local function playAudioFromGitHub()
    -- This function downloads and plays audio from GitHub
    local audioUrl = "https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/kbot.mp3"
    local fileName = "killbot_music.mp3"
    
    print("🎵 Initializing GitHub Media Player...")
    
    -- Check if executor has file functions
    if writefile and readfile then
        print("📥 Downloading audio from GitHub...")
        
        -- Download the audio file
        local success, audioData = pcall(function()
            return game:HttpGet(audioUrl, true)
        end)
        
        if success and audioData then
            -- Save to file
            writefile(fileName, audioData)
            print("✅ Audio downloaded: " .. #audioData .. " bytes")
            
            local sound = Instance.new("Sound")
            sound.Name = "GitHubAudio"
            sound.Looped = true
            sound.Volume = 0.7
            sound.Parent = workspace
            
            local methods = {
                function() 
                    sound.SoundId = "file://" .. fileName 
                    print("Trying file:// protocol")
                end,
                function()
                    if getcustomasset then
                        sound.SoundId = getcustomasset(fileName)
                        print("Trying getcustomasset")
                    end
                end,
                function()
                    if _G and _G.PlayAudio then
                        _G.PlayAudio(audioUrl, true, 0.7)
                        print("Using executor audio function")
                        return true
                    end
                    return false
                end
            }
            
            for i, method in ipairs(methods) do
                local success = pcall(method)
                if success then
                    print("✅ Method " .. i .. " succeeded")
                    break
                end
            end
        
            wait(2)
            sound:Play()
            
            wait(3)
            if sound.IsPlaying then
                print("🎵 GitHub audio playing successfully!")
                return sound
            else
                print("❌ Audio loaded but not playing")
                sound:Destroy()
                return nil
            end
        else
            print("❌ Failed to download audio")
        end
    else
        print("❌ File system not available")
    end
    
    return nil
end

-- Start audio
spawn(function()
    local music = playAudioFromGitHub()
    
    if not music then
        print("🔄 Trying alternative audio method...")
        
        if syn and syn.audio then
            syn.audio.play("https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/kbot.mp3", {
                Looped = true,
                Volume = 0.5
            })
            print("✅ Using executor's audio system")
        elseif fluxus and fluxus.audio then
            fluxus.audio.play("https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/kbot.mp3", {
                Looped = true,
                Volume = 0.5
            })
            print("✅ Using Fluxus audio")
        else
            print("⚠️ Audio may not play - executor limitations")
            print("Download manually: " .. "https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/kbot.mp3")
        end
    end
end)
