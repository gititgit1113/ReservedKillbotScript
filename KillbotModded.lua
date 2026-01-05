-- fix PLEASESEEASESEASEAEARWDADARFFWFGAFGA WT TG AT AEG AG DAG 
-- by reserved and ai DeepSeek
loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()
wait(15)
loadstring(game:HttpGet("https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/KillbotDefault.lua"))()

spawn(function()
    print("🎵 Testing Audio ID: 9096765392")
    
    local sound = Instance.new("Sound")
    sound.Name = "ChaseTheme"
    sound.SoundId = "rbxassetid://9096765392"
    sound.Looped = true
    sound.Volume = 0.7
    sound.Parent = workspace
    
    print("Audio created, waiting to load...")
    
    local loaded = false
    local startTime = tick()
    
    while tick() - startTime < 10 do
        if sound.IsLoaded then
            loaded = true
            break
        end
        wait(0.5)
        print("Loading... " .. math.floor(tick() - startTime) .. "s")
    end
    
    if loaded then
        print("✅ Audio loaded successfully!")
        sound:Play()
        print("🔊 Now playing: " .. sound.Name)
        
        while true do
            wait(5)
            if not sound.IsPlaying then
                print("🔄 Restarting audio...")
                sound:Play()
            end
        end
    else
        print("❌ Audio failed to load in time")
        print("Possible issues:")
        print("1. ID 9096765392 doesn't exist")
        print("2. You don't have permission to access it")
        print("3. Audio is private/not published")
        
        print("\n🔄 Trying fallback audio IDs...")
        
        local fallbackIDs = {
            9111348332,  -- Epic music
            1847248709,  -- LoFi
            6951256309,  -- Synth
            1661283595   -- Chill
        }
        
        for _, id in ipairs(fallbackIDs) do
            local testSound = Instance.new("Sound")
            testSound.SoundId = "rbxassetid://" .. id
            testSound.Volume = 0.5
            testSound.Parent = workspace
            
            wait(2)
            if testSound.IsLoaded then
                testSound.Looped = true
                testSound:Play()
                print("✅ Fallback ID " .. id .. " works!")
                break
            else
                testSound:Destroy()
            end
        end
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Audio Test",
    Text = "Trying ID 9096765392... check console",
    Duration = 5
})
