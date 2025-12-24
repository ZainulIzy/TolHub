-- Pastikan kodenya bersih dari karakter aneh
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

local Window = OrionLib:MakeWindow({
    Name = "NathHub Garden", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "OrionTest",
    IntroText = "Selamat Datang Bos!"
})

-- Halaman Utama
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

-- Halaman Farm
local FarmTab = Window:MakeTab({
    Name = "Farm",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

-- Halaman Pet
local PetTab = Window:MakeTab({
    Name = "Pet",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

-- Halaman Webhook
local WebhookTab = Window:MakeTab({
    Name = "Webhook",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

-- Fitur Speed
MainTab:AddSlider({
    Name = "Speed",
    Min = 16,
    Max = 300, -- Gue naikin dikit biar berasa kencengnya
    Default = 16,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Speed",
    Callback = function(Value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end    
})

OrionLib:Init()
