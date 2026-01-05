if not game:IsLoaded() then game.Loaded:Wait() end

loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()

local msgs = {
    "I was designed to be a Killbot.",
    "But they never turned me into one.",
    "Along with the consequences you will experience.",
    "You are not alone.",
    "You are about to experience the consequences no one ever experienced.",
    "Killbot... Awaken."
}

for i = 1, 6 do
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msgs[i], "All")
    wait(1)
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/Pendulum-Fixed-AND-Others-Scripts/refs/heads/main/Killbot%20V2"))()
