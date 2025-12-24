-- [[ TOLHUB - ORION EDITION STABLE ]]
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "TolHub 🌿", 
    HidePremium = false, 
    SaveConfig = true, 
    ConfigFolder = "TolHub"
})

-- Variabel Penampung Data
_G.SpeedInput = 16
_G.JumpInput = 50

-- [[ TAB MAIN ]]
local Tab1 = Window:MakeTab({
	Name = "Main 🏠",
	Icon = "rbxassetid://4483362458",
	PremiumOnly = false
})

Tab1:AddSection({
	Name = "Karakter Settings"
})

-- Input untuk angka Speed
Tab1:AddTextbox({
	Name = "Set WalkSpeed",
	Default = "16",
	TextDisappear = false,
	Callback = function(Value)
		_G.SpeedInput = tonumber(Value)
	end	  
})

-- Tombol untuk aktifin Speed
Tab1:AddButton({
	Name = "Aktifkan Speed",
	Callback = function()
        if _G.SpeedInput then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.SpeedInput
            OrionLib:MakeNotification({
                Name = "Sukses!",
                Content = "Speed diatur ke: " .. _G.SpeedInput,
                Time = 2
            })
        end
  	end    
})

-- Input untuk angka Jump
Tab1:AddTextbox({
	Name = "Set JumpPower",
	Default = "50",
	TextDisappear = false,
	Callback = function(Value)
		_G.JumpInput = tonumber(Value)
	end	  
})

-- Tombol untuk aktifin Jump
Tab1:AddButton({
	Name = "Aktifkan Jump",
	Callback = function()
        if _G.JumpInput then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = _G.JumpInput
        end
  	end    
})

-- [[ TAB FARM ]]
local Tab2 = Window:MakeTab({
	Name = "Farm 🚜",
	Icon = "rbxassetid://4483362458",
	PremiumOnly = false
})

Tab2:AddSection({
	Name = "Automation"
})

-- Auto Clicker
local clicking = false
Tab2:AddToggle({
	Name = "Auto Clicker",
	Default = false,
	Callback = function(Value)
		clicking = Value
        task.spawn(function()
            while clicking do
                local vim = game:GetService("VirtualInputManager")
                vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
                task.wait(0.1)
            end
        end)
	end    
})

-- Anti-AFK
Tab2:AddToggle({
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

-- Memberitahu library bahwa setup selesai
OrionLib:Init()
