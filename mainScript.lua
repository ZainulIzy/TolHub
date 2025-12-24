-- [[ TOLHUB SCRIPT - RAYFIELD EDITION ]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "TolHub 🌿",
   LoadingTitle = "TolHub Script",
   LoadingSubtitle = "by Xizzy",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "TolHubData" 
   },
   KeySystem = false 
})

-- Variabel Penampung Angka
_G.SpeedInput = 16
_G.JumpInput = 50

-- [[ TAB MAIN ]]
local MainTab = Window:CreateTab("Main 🏠", 4483362458)

MainTab:CreateSection("Karakter Settings")

-- Input Box untuk Speed
MainTab:CreateInput({
   Name = "Set WalkSpeed",
   PlaceholderText = "Ketik angka (Contoh: 100)",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      _G.SpeedInput = tonumber(Text)
   end,
})

-- Tombol Aktifkan Speed
MainTab:CreateButton({
   Name = "Aktifkan Speed",
   Callback = function()
      local char = game.Players.LocalPlayer.Character
      if char and char:FindFirstChild("Humanoid") and _G.SpeedInput then
         char.Humanoid.WalkSpeed = _G.SpeedInput
         Rayfield:Notify({
            Title = "Sukses!",
            Content = "Speed diatur ke: " .. _G.SpeedInput,
            Duration = 2,
            Image = 4483362458,
         })
      end
   end,
})

-- Input Box untuk Jump
MainTab:CreateInput({
   Name = "Set JumpPower",
   PlaceholderText = "Ketik angka (Contoh: 100)",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      _G.JumpInput = tonumber(Text)
   end,
})

-- Tombol Aktifkan Jump
MainTab:CreateButton({
   Name = "Aktifkan Jump",
   Callback = function()
      local char = game.Players.LocalPlayer.Character
      if char and char:FindFirstChild("Humanoid") and _G.JumpInput then
         char.Humanoid.JumpPower = _G.JumpInput
      end
   end,
})

-- [[ TAB FARM ]]
local FarmTab = Window:CreateTab("Farm 🚜", 4483362458)

local clicking = false
FarmTab:CreateToggle({
   Name = "Auto Clicker",
   CurrentValue = false,
   Flag = "AutoClick",
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
   end,
})

FarmTab:CreateToggle({
   Name = "Anti-AFK",
   CurrentValue = false,
   Flag = "AntiAFK",
   Callback = function(Value)
      _G.AntiAFK = Value
      local vu = game:GetService("VirtualUser")
      game:GetService("Players").LocalPlayer.Idled:connect(function()
         if _G.AntiAFK then
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
         end
      end)
   end,
})

-- Notifikasi Akhir
Rayfield:Notify({
   Title = "NathHub Ready!",
   Content = "Menu Rayfield siap digeser, Bos!",
   Duration = 5,
   Image = 4483362458,
})
