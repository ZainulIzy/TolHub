-- [[ TOLHUB SCRIPT - PREMIUM VERSION ]]
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
local DiscordLink = "https://discord.gg/redzhub" -- Ganti pake link discord lo

-- [[ TAB UTAMA ]]
local MainTab = Window:CreateTab("Home 🏠", 4483362458)

-- 1. TOMBOL DISCORD (DI PALING ATAS)
MainTab:CreateSection("Community")

MainTab:CreateButton({
   Name = "📋 Salin Link Discord TolHub",
   Callback = function()
      setclipboard(DiscordLink) -- Fungsi otomatis copy ke HP
      Rayfield:Notify({
         Title = "Berhasil Salin!",
         Content = "Link Discord sudah disalin ke papan klip.",
         Duration = 3,
         Image = 4483362458,
      })
   end,
})

-- 2. DROPDOWN / SECTION KARAKTER
local CharSection = MainTab:CreateSection("Karakter")

-- Bagian Speed di dalam Karakter
MainTab:CreateInput({
   Name = "Input Angka Speed",
   PlaceholderText = "Ketik Speed...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      _G.SpeedValue = tonumber(Text) or 16
      if _G.SpeedActive then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.SpeedValue
      end
   end,
})

MainTab:CreateToggle({
   Name = "Lari (On/Off)",
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

-- Bagian Jump di dalam Karakter
MainTab:CreateInput({
   Name = "Input Angka Lompat",
   PlaceholderText = "Ketik Jump...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      _G.JumpValue = tonumber(Text) or 50
      if _G.JumpActive then
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = _G.JumpValue
      end
   end,
})

MainTab:CreateToggle({
   Name = "Lompat (On/Off)",
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

-- Sistem Auto-Respawn (Biar kalau mati tetep aktif)
game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid")
    task.wait(0.5)
    if _G.SpeedActive then hum.WalkSpeed = _G.SpeedValue end
    if _G.JumpActive then 
        hum.UseJumpPower = true
        hum.JumpPower = _G.JumpValue 
    end
end)

Rayfield:Notify({
   Title = "TolHub Loaded",
   Content = "Selamat datang, Bos Xizzy!",
   Duration = 5
})
