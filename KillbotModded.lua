-- Killbot Script with Robust Audio System
-- ==============================================================================
-- This is supposed to be a DeltaFix4 as I commited A LOT OF CHANGES to this file
-- if you look at the history

-- ORIGINAL SCRIPT FROM GITHUB
-- MADE BY RESERVED, THANKS TO DEEPSEEK FOR DA HELP
-- gonna leave deepseek's comment here... reserved on top
-- ==============================================================================


-- Enjoy.
-- if it doesnt work ill commit more than 30+ changes till I fix the audio

loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()
wait(7)
loadstring(game:HttpGet("https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/KillbotDefault.lua"))()

local function playKillbotAudio()
    local songUrl = "https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/kbot.mp3"
    local fileName = "killbot_audio.mp3"
    
    print("🔊 Initializing audio system...")
    
    -- METHOD 1: Direct play (simplest)
    local sound1 = Instance.new("Sound")
    sound1.Name = "KillbotTheme"
    sound1.Looped = true
    sound1.Volume = 0.7
    sound1.Parent = workspace
    
    -- Try the URL directly first
    sound1.SoundId = songUrl
    wait(2)
    
    if sound1.IsLoaded then
        sound1:Play()
        print("✅ METHOD 1: Direct URL works!")
        return sound1
    end
    
    print("❌ METHOD 1 failed, trying METHOD 2...")
    
    -- METHOD 2: Download and use file://
    if writefile and readfile then
        print("📥 Downloading audio...")
        local success, audioData = pcall(function()
            return game:HttpGet(songUrl, true)
        end)
        
        if success and audioData then
            writefile(fileName, audioData)
            print("✅ Downloaded: " .. #audioData .. " bytes")
            
            local sound2 = Instance.new("Sound")
            sound2.Name = "KillbotLocal"
            sound2.Looped = true
            sound2.Volume = 0.7
            sound2.Parent = workspace
            
            -- Try file:// protocol
            sound2.SoundId = "file://" .. fileName
            wait(3)
            
            if sound2.IsLoaded then
                sound2:Play()
                print("✅ METHOD 2: file:// protocol works!")
                sound1:Destroy()
                return sound2
            else
                print("❌ file:// not working")
                sound2:Destroy()
            end
        end
    end
    
    print("❌ METHOD 2 failed, trying METHOD 3...")
    
    -- METHOD 3: Use a working Roblox audio ID as fallback
    local fallbackIDs = {
        9096765392,  -- something i left here heh...
        9111348332,  -- Epic music
        1847248709,  -- LoFi
        6951256309,  -- Synth
        311739919    -- Default
    }
    
    for _, id in ipairs(fallbackIDs) do
        local sound3 = Instance.new("Sound")
        sound3.SoundId = "rbxassetid://" .. id
        sound3.Looped = true
        sound3.Volume = 0.5
        sound3.Parent = workspace
        
        wait(2)
        if sound3.IsLoaded then
            sound3:Play()
            print("✅ METHOD 3: Using Roblox ID: " .. id)
            sound1:Destroy()
            return sound3
        else
            sound3:Destroy()
        end
    end
    
    print("❌ All audio methods failed!")
    sound1:Destroy()
    return nil
end

-- Start audio
spawn(function()
    local music = playKillbotAudio()
    if music then
        print("🎵 alright its done")
    else
        print("⚠️ failed buddy, at least the script works right")
        print("ok im done bye")
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Killbot Active",
    Text = "ENJOY! :D",
    Duration = 5
})

print("\n=== I AM F#####G DONE ===")
