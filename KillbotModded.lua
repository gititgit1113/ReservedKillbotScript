-- please i need this
loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()
wait(7)
loadstring(game:HttpGet("https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/KillbotDefault.lua"))()

spawn(function()
    print("🔊 Setting up audio workaround...")
    
    local gameSounds = workspace:GetDescendants()
    local foundSound = nil
    
    for _, obj in pairs(gameSounds) do
        if obj:IsA("Sound") and obj.SoundId ~= "" then
            foundSound = obj
            break
        end
    end
    
    if foundSound then
        print("✅ Found game sound: " .. foundSound.Name)
        local music = foundSound:Clone()
        music.Name = "BackgroundMusic"
        music.Looped = true
        music.Volume = 0.5
        music.Parent = workspace
        music:Play()
        print("🎵 Playing modified game sound")
    else
        local uiSound = Instance.new("Sound")
        uiSound.SoundId = "rbxasset://sounds/action_get_up.mp3"
        uiSound.Looped = true
        uiSound.Volume = 0.3
        uiSound.Parent = workspace
        
        for i = 1, 5 do
            wait(2)
            pcall(function()
                uiSound:Play()
                print("Attempt " .. i .. ": Playing built-in sound")
            end)
        end
    end
    
    -- METHOD 3: Visual indicator since audio is blocked
    local warning = Instance.new("Message")
    warning.Text = "🎵 Audio blocked by Roblox security"
    warning.Parent = workspace
    wait(3)
    warning:Destroy()
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Scripts Loaded!",
    Text = "what the hell is wrong with the audio...",
    Duration = 5
})
