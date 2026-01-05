-- added debug
-- holy shit how many commits did i leave in the history
-- alright thanks to deepseek for the help (chatgpt sucks)
-- made by reserved (OGChatUnlocker on Roblox)

print("=== AUDIO DEBUGGER ===")

local audioUrl = "https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/kbot.mp3"

print("1. Testing URL access...")
local success, data = pcall(function()
    return game:HttpGet(audioUrl, true)
end)

if success then
    print("✅ URL accessible | Data size: " .. #data .. " bytes")
    
    if writefile then
        print("✅ writefile available")
        
        local fileName = "debug_audio.mp3"
        writefile(fileName, data)
        print("✅ File saved: " .. fileName)
        
        if readfile then
            local fileData = readfile(fileName)
            print("✅ File readable | Size: " .. #fileData .. " bytes")
        end
        
        print("\n5. Testing playback methods...")
        
        local soundA = Instance.new("Sound")
        soundA.SoundId = "file://" .. fileName
        soundA.Volume = 0.5
        soundA.Parent = workspace
        
        print("Method A: file://" .. fileName)
        
        local soundB = Instance.new("Sound")
        soundB.Volume = 0.5
        soundB.Parent = workspace
        
        if soundB.LoadAsync then
            pcall(function()
                soundB:LoadAsync("file://" .. fileName)
                print("✅ LoadAsync available")
            end)
        end
        
        wait(3)
        
        print("\n=== STATUS ===")
        print("Sound A Loaded: " .. tostring(soundA.IsLoaded))
        print("Sound A Playing: " .. tostring(soundA.IsPlaying))
        print("Sound B Loaded: " .. tostring(soundB.IsLoaded))
        print("Sound B Playing: " .. tostring(soundB.IsPlaying))
        
        if not soundA.IsPlaying then
            print("\n🎵 Force playing sound A...")
            soundA:Play()
            wait(1)
            print("Now playing: " .. tostring(soundA.IsPlaying))
        end
        
        local soundC = Instance.new("Sound")
        soundC.SoundId = "file://" .. fileName
        soundC.Volume = 0.7
        soundC.Parent = game:GetService("SoundService") -- Try SoundService instead
        wait(1)
        soundC:Play()
        print("Sound C (in SoundService) playing: " .. tostring(soundC.IsPlaying))
        
    else
        print("❌ writefile not available")
    end
else
    print("❌ URL not accessible: " .. data)
end

print("\n=== CHECK YOUR SPEAKERS ===")
print("1. Is your computer volume up?")
print("2. Is Roblox volume up? (check in-game settings)")
print("3. Try playing any YouTube video to test speakers")
