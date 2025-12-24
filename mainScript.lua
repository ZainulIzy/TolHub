-- [[ TOLHUB SCRIPT - REDZ V5 VERSION ]]
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()

local Window = redzlib:MakeWindow({
  Title = "TolHub 🌿",
  SubTitle = "by Xizzy",
  SaveFolder = "TolHub_Config.lua"
})

-- Tombol Minimize (Buka/Tutup Menu)
Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://71014873973869", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

-- Variabel Penampung Angka
_G.SpeedAngka = 16
_G.JumpAngka = 50

-- Membuat Tab Utama
local Tab1 = Window:MakeTab({"Main 🏠", "home"})

-- Section Character
Tab1:AddSection({"Character Settings"})

-- 1. Input Box untuk Speed
Tab1:AddTextBox({
  Name = "Input Speed",
  Description = "Ketik angka lalu klik tombol Aktifkan", 
  PlaceholderText = "Contoh: 100",
  Callback = function(Value)
     _G.SpeedAngka = tonumber(Value)
  end
})

-- 2. Button untuk Aktifkan Speed
Tab1:AddButton({"Aktifkan Speed", function()
    if _G.SpeedAngka then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.SpeedAngka
    end
end})

-- 3. Input Box untuk Jump
Tab1:AddTextBox({
  Name = "Input JumpPower",
  Description = "Ketik angka lalu klik tombol Aktifkan", 
  PlaceholderText = "Contoh: 100",
  Callback = function(Value)
     _G.JumpAngka = tonumber(Value)
  end
})

-- 4. Button untuk Aktifkan Jump
Tab1:AddButton({"Aktifkan Jump", function()
    if _G.JumpAngka then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = _G.JumpAngka
    end
end})

-- Section Automation
local Tab2 = Window:MakeTab({"Farm 🚜", "tractor"})

Tab2:AddSection({"Auto Features"})

-- Auto Clicker Toggle
Tab2:AddToggle({
    Name = "Auto Clicker",
    Default = false,
    Callback = function(Value)
        _G.AutoClick = Value
        spawn(function()
            while _G.AutoClick do
                local vim = game:GetService("VirtualInputManager")
                vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
                task.wait(0.1)
            end
        end)
    end
})

-- Anti-AFK Toggle
Tab2:AddToggle({
    Name = "Anti-AFK",
    Default = false,
    Callback = function(Value)
        _G.AntiAFK = Value
        local vu = game:GetService("VirtualUser")
        game.Players.LocalPlayer.Idled:Connect(function()
            if _G.AntiAFK then
                vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end
        end)
    end
})

-- Pilih Tab Default saat dibuka
Window:SelectTab(Tab1)
