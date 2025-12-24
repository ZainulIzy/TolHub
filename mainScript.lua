-- 1. Panggil jeroannya dulu
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- 2. Bikin Window Utama
local Window = OrionLib:MakeWindow({
    Name = "NathHub Garden", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "OrionTest",
    IntroText = "Selamat Datang Bos!"
})

-- 3. Tambahin Tab (Nama variabelnya dibedain: MainTab, FarmTab, dll)
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

local FarmTab = Window:MakeTab({
    Name = "Farm",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

local PetTab = Window:MakeTab({
    Name = "Pet",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

local WebhookTab = Window:MakeTab({
    Name = "Webhook",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

-- 4. CONTOH CARA NGITSI FITURNYA (Biar gak nyasar)
MainTab:AddSlider({
	Name = "Speed",
	Min = 16,
	Max = 100,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

-- 5. Akhiri dengan Init biar muncul
OrionLib:Init()