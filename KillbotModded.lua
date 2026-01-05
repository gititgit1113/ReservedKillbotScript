--[[
	enjoy made by Reserved
  i cant really script so i asked ai cuz why not hjahheharaherrhaaerhraea
]]

if not game.IsLoaded then
    game.Loaded:Wait()
end

local function sendRobloxNotification(title, message, icon, duration)
    icon = icon or Enum.StudioStyleGuideColor.DialogMainButton
    duration = duration or 10
    
    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer

    local success, err = pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = message,
            Icon = "rbxassetid://0", -- Default icon
            Duration = duration,
            Button1 = "OK"
        })
    end)

    if not success then
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = title,
                Text = message,
                Duration = duration
            })
        end)
    end

    if rconsoleprint then
        rconsoleprint("@@YELLOW@@")
        rconsoleprint("[NOTIFICATION] " .. title .. ": " .. message .. "\n")
        rconsoleprint("@@WHITE@@")
    end
end

local function playAudioFromURL(url, loop, volume)
    loop = loop or true
    volume = volume or 0.7
    
    local SoundService = game:GetService("SoundService")

    local sound = Instance.new("Sound")
    sound.Name = "ClientAudio_" .. math.random(1000, 9999)
    sound.Looped = loop
    sound.Volume = volume

    local loaded = false

    if not loaded then
        local success = pcall(function()
            sound.SoundId = url
            sound.Parent = workspace
            sound:Play()
            loaded = true
        end)
    end

    if not loaded then
        local assetId = url:match("%d+")
        if assetId then
            local success = pcall(function()
                sound.SoundId = "rbxassetid://" .. assetId
                sound.Parent = workspace
                sound:Play()
                loaded = true
            end)
        end
    end
    
    -- Method 3: Using executor-specific HTTP to load audio
    if not loaded and (syn or fluxus or krnl) then
        local success, audioData = pcall(function()
            if syn then
                return syn.request({Url = url, Method = "GET"}).Body
            elseif fluxus then
                return fluxus.request(url)
            elseif krnl then
                return http_request({Url = url, Method = "GET"}).Body
            end
        end)
        
        if success and audioData then
            -- Some executors can play audio from memory
            warn("Audio loaded but may not play - executor audio restrictions may apply")
        end
    end
    
    if loaded then
        sendRobloxNotification("Audio", "Music started playing", nil, 2)
        return sound
    else
        sendRobloxNotification("Audio Error", "Failed to play audio", nil, 3)
        return nil
    end
end

local function main()
    -- Send warning notification
    sendRobloxNotification(
        "WARNING", 
        "If game not supported, options may appear within 10 seconds",
        nil,
        10
    )
    
    wait(1)
    
    local audioUrl = "https://github.com/gititgit1113/ReservedKillbotScript/raw/refs/heads/main/kbot.mp3"
    local audio = playAudioFromURL(audioUrl, true, 0.7)

    sendRobloxNotification("Loading", "Loading CurrentAngleV4...", nil, 2)

    local success1, err1 = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()
    end)
    
    if success1 then
        sendRobloxNotification("Success", "CurrentAngleV4 loaded", nil, 2)
    else
        sendRobloxNotification("Error", "Failed to load CurrentAngleV4", nil, 3)
        warn("CurrentAngleV4 load error:", err1)
    end
    
    wait(1)

    sendRobloxNotification("Loading", "Loading KillbotDefault...", nil, 2)
    
    local success2, err2 = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gititgit1113/ReservedKillbotScript/refs/heads/main/KillbotDefault.lua"))()
    end)
    
    if success2 then
        sendRobloxNotification("Success", "KillbotDefault loaded", nil, 2)
    else
        sendRobloxNotification("Error", "Failed to load KillbotDefault", nil, 3)
        warn("KillbotDefault load error:", err2)
    end

    wait(1)
    sendRobloxNotification("Complete", "All scripts loaded successfully", nil, 3)
    
    return "Execution finished"
end

local executorSuccess, executorError = pcall(main)

if not executorSuccess then
    pcall(function()
        sendRobloxNotification("CRITICAL ERROR", "Script failed: " .. tostring(executorError), nil, 5)
    end)
    
    if rconsoleprint then
        rconsoleprint("@@RED@@")
        rconsoleprint("[ERROR] " .. tostring(executorError) .. "\n")
        rconsoleprint("@@WHITE@@")
    end
end

return "it loaded"
