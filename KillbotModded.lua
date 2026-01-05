-- DELTA AUDIO HACK VERSION
loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()
wait(7)
loadstring(game:HttpGet("https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/KillbotDefault.lua"))()

spawn(function()
    local audioUrl = "https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/kbot.mp3"
    
    local success, audioData = pcall(function()
        return game:HttpGet(audioUrl)
    end)
    
    if success then
        local audioScript = [[
            local sound = Instance.new("Sound")
            sound.Name = "DeltaAudio"
            sound.Looped = true
            sound.Volume = 0.5
            sound.Parent = workspace
            
            sound.SoundId = "]] .. audioUrl .. [["
            
            task.wait(1)
            sound:Play()
            
            task.wait(3)
            if not sound.IsPlaying then
                sound:Stop()
                sound:Play()
            end
        ]]
        
        loadstring(audioScript)()
    end
end)

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "yippee",
    Text = "Audio might take a moment to load...",
    Duration = 5
})
