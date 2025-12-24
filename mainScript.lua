-- [[ TOLHUB SCRIPT - ORION VERSION ]]
-- Memanggil Library Orion
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Membuat Window Utama
local Window = OrionLib:MakeWindow({
    Name = "TolHub 🌿", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "TolHubData",
    IntroText = "Loading TolHub by Xizzy..."
})

-- Variabel Global (Penyimpanan angka sementara)
_G.SpeedInput = 16
_G.JumpInput = 50

-- ==========================================
-- [[ TAB MAIN ]]
-- ==========================================
local MainTab = Window:MakeTab({
	Name = "Main 🏠",
	Icon = "rbxassetid://4483362458",
	PremiumOnly = false
})

MainTab:AddSection({
	Name = "Speed Settings"
})

-- Kotak Input untuk angka Speed
MainTab:AddTextbox({
	Name = "Masukan Angka Kecepatan",
	Default = "16",
	TextDisappear = false,
	Callback = function(Value)
		_G.SpeedInput = tonumber(Value)
	end	  
})

-- Tombol untuk mengaktifkan Speed
MainTab:AddButton({
	Name = "Aktifkan Speed",
	Callback = function()
        if _G.SpeedInput then
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = _G.SpeedInput
                -- Notifikasi sukses khas Orion
                OrionLib:MakeNotification({
                    Name = "Speed Aktif!",
                    Content = "Kecepatan diatur ke: " .. _G.SpeedInput,
                    Image = "rbxassetid://4483362458",
                    Time = 3
                })
            end
        end
  	end    
})

MainTab:AddSection({
	Name = "Jump Settings"
})

-- Kotak Input untuk angka Jump
MainTab:AddTextbox({
	Name = "Masukan Angka Lompatan",
	Default = "50",
	TextDisappear = false,
	Callback = function(Value)
		_G.JumpInput = tonumber(Value)
	end	  
})

-- Tombol untuk mengaktifkan Jump
MainTab:AddButton({
	Name = "Aktifkan Lompatan",
	Callback = function()
        if _G.JumpInput then
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.JumpPower = _G.JumpInput
            end
        end
  	end    
})

MainTab:AddSection({
	Name = "Extra"
})

-- Fitur Loncat Terus-menerus
MainTab:AddToggle({
	Name = "Infinite Jump",
	Default = false,
	Callback = function(Value)
		_G.InfJump = Value
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if _G.InfJump then
                local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState("Jumping")
                end
            end
        end)
	end    
})

-- ==========================================
-- [[ TAB FARM ]]
-- ==========================================
local FarmTab = Window:MakeTab({
	Name = "Farm 🚜",
	Icon = "rbxassetid://4483362458",
	PremiumOnly = false
})

FarmTab:AddSection({
	Name = "Automation"
})

-- Fitur Klik Otomatis
local clicking = false
FarmTab:AddToggle({
	Name = "Auto Clicker",
	Default = false,
	Callback = function(Value)
		clicking = Value
        task.spawn(function()
            while clicking do
                local vim = game:GetService("VirtualInputManager")
                vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
                task.wait(0.1) -- Kecepatan klik
            end
        end)
	end    
})

-- Fitur Anti-Kick (Anti-AFK)
FarmTab:AddToggle({
	Name = "Anti-AFK",
	Default = false,
	Callback = function(Value)
        _G.AntiAFK = Value
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            if _G.AntiAFK then
                vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end
        end)
	end    
})

-- ==========================================
-- [[ TAB LAINNYA ]]
-- ==========================================
local PetTab = Window:MakeTab({
	Name = "Pet 🐶",
	Icon = "rbxassetid://4483362458",
	PremiumOnly = false
})

local WebhookTab = Window:MakeTab({
	Name = "Webhook 🔗",
	Icon = "rbxassetid://4483362458",
	PremiumOnly = false
})

-- Menjalankan Library (Wajib di akhir kode Orion)
OrionLib:Init()
