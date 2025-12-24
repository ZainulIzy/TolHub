-- [[ TOLHUB SCRIPT - COLLAPSIBLE DROPDOWN VERSION ]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "TolHub 🌿",
   LoadingTitle = "TolHub Professional",
   LoadingSubtitle = "by Xizzy",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "TolHubData" 
   },
   KeySystem = false 
})

-- Variabel Default
_G.SpeedValue = 16
_G.SpeedActive = false
_G.JumpValue = 50
_G.JumpActive = false

-- [[ TAB UTAMA ]]
local MainTab = Window:CreateTab("Home 🏠", 4483362458)

-- 1. TOMBOL DISCORD (PALING ATAS)
MainTab:CreateSection("Community")
MainTab:CreateButton({
   Name = "📋 Salin Link Discord",
   Callback = function()
      setclipboard("https://discord.gg/tolhub")
      Rayfield:Notify({
         Title = "Berhasil Salin!",
         Content = "Link Discord sudah disalin.",
         Duration = 2,
      })
   end,
})

-- 2. DROPDOWN KARAKTER SETTING (Menggunakan Section)
local CharSection = MainTab:CreateSection("Karakter Setting")

-- Input Speed
MainTab:CreateInput({
   Name = "Input Speed",
   PlaceholderText = "Ketik angka...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      _G.SpeedValue = tonumber(Text) or 16
      if _G.SpeedActive then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.SpeedValue
      end
   end,
})

-- Toggle Speed
MainTab:CreateToggle({
   Name = "Aktifkan Speed (On/Off)",
   CurrentValue = false,
   Flag = "SpeedTog",
   Callback = function(Value)
      _G.SpeedActive = Value
      local hum = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
      if hum then
         hum.WalkSpeed = _G.SpeedActive and _G.SpeedValue or 16
      end
   end,
})

-- Pembatas Kecil
MainTab:CreateLabel("----------------------------")

-- Input Jump
MainTab:CreateInput({
   Name = "Input Jump",
   PlaceholderText = "Ketik angka...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      _G.JumpValue = tonumber(Text) or 50
      if _G.JumpActive then
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = _G.JumpValue
      end
   end,
})

-- Toggle Jump
MainTab:CreateToggle({
   Name = "Aktifkan Jump (On/Off)",
   CurrentValue = false,
   Flag = "JumpTog",
   Callback = function(Value)
      _G.JumpActive = Value
      local hum = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
      if hum then
         hum.UseJumpPower = true
         hum.JumpPower = _G.JumpActive and _G.JumpValue or 50
      end
   end,
})

-- [[ TAB FARM ]]
local FarmTab = Window:CreateTab("Farm 🚜", 4483362458)
FarmTab:CreateSection("Automation")

FarmTab:CreateToggle({
   Name = "Auto Clicker",
   CurrentValue = false,
   Flag = "AutoClick",
   Callback = function(Value)
      _G.Clicking = Value
      task.spawn(function()
         while _G.Clicking do
            local vim = game:GetService("VirtualInputManager")
            vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
            vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
            task.wait(0.1)
         end
      end)
   end,
})

-- Notifikasi Akhir
Rayfield:Notify({
   Title = "TolHub Loaded",
   Content = "Karakter Setting siap dikonfigurasi!",
   Duration = 3
})
