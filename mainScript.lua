-- [[ TOLHUB - REDZ V5 OFFICIAL ]]
local status, RedzLib = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/REDZHUB/RedzLibV5/main/Source.Lua"))()
end)

if not status then
    warn("Library Error: " .. tostring(RedzLib))
    return
end

local Window = RedzLib:MakeWindow({
  Title = "TolHub 🌿",
  SubTitle = "by Xizzy",
  SaveFolder = "TolHub_Data.lua"
})

-- Tombol Buka/Tutup (Minimize)
Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://71014873973869", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

-- Simpanan Angka
_G.SpeedAngka = 16
_G.JumpAngka = 50

-- [[ TAB UTAMA ]]
local Tab1 = Window:MakeTab({"Main 🏠", "home"})

Tab1:AddSection({"Speed Settings"})

Tab1:AddTextBox({
  Name = "Input Speed",
  Description = "Ketik angka lalu klik Aktifkan", 
  PlaceholderText = "Contoh: 100",
  Callback = function(Value)
     _G.SpeedAngka = tonumber(Value)
  end
})

Tab1:AddButton({"Aktifkan Speed", function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") and _G.SpeedAngka then
        char.Humanoid.WalkSpeed = _G.SpeedAngka
    end
end})

Tab1:AddSection({"Jump Settings"})

Tab1:AddTextBox({
  Name = "Input Jump",
  Description = "Ketik angka lalu klik Aktifkan", 
  PlaceholderText = "Contoh: 100",
  Callback = function(Value)
     _G.JumpAngka = tonumber(Value)
  end
})

Tab1:AddButton({"Aktifkan Jump", function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") and _G.JumpAngka then
        char.Humanoid.JumpPower = _G.JumpAngka
    end
end})

-- [[ TAB FARM ]]
local Tab2 = Window:MakeTab({"Farm 🚜", "tractor"})

Tab2:AddToggle({
    Name = "Auto Clicker",
    Default = false,
    Callback = function(Value)
        _G.AutoClick = Value
        task.spawn(function()
            while _G.AutoClick do
                local vim = game:GetService("VirtualInputManager")
                vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
                task.wait(0.1)
            end
        end)
    end
})

Window:SelectTab(Tab1)
