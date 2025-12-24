-- [[ TOLHUB SCRIPT - DROPDOWN VERSION ]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "TolHub 🌿",
   LoadingTitle = "TolHub Professional",
   LoadingSubtitle = "by Xizzy",
   ConfigurationSaving = {Enabled = true, FolderName = "TolHubData"},
   KeySystem = false 
})

-- Variabel Default
_G.SpeedValue = 16
_G.SpeedActive = false
_G.JumpValue = 50
_G.JumpActive = false

local MainTab = Window:CreateTab("Main 🏠", 4483362458)

-- 1. BAGIAN DISCORD (PALING ATAS)
MainTab:CreateSection("Community")
MainTab:CreateButton({
   Name = "📋 Salin Link Discord",
   Callback = function()
      setclipboard("https://discord.gg/tolhub") -- Ganti linknya di sini
      Rayfield:Notify({Title = "Berhasil!", Content = "Link Discord disalin.", Duration = 2})
   end,
})

-- 2. SISTEM DROPDOWN KARAKTER
MainTab:CreateSection("Settings")

local CharacterDropdown = MainTab:CreateDropdown({
   Name = "Pilih Menu Karakter",
   Options = {"Atur Speed", "Atur Jump", "Reset Karakter"},
   CurrentOption = {"Atur Speed"},
   MultipleOptions = false,
   Flag = "CharDrop",
   Callback = function(Option)
      -- Ini buat ngasih tau user menu apa yang dipilih
      Rayfield:Notify({Title = "Menu Terpilih", Content = "Sekarang atur " .. Option[1], Duration = 1})
   end,
})

-- 3. INPUT & TOGGLE (YANG MASUK KE LOGIKA DROPDOWN)
MainTab:CreateLabel("--- Konfigurasi Karakter ---")

MainTab:CreateInput({
   Name = "Masukan Angka (Speed/Jump)",
   PlaceholderText = "Ketik angka...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      -- Otomatis mendeteksi: kalo user pilih speed di dropdown, angka ini jadi speed
      local current = CharacterDropdown.CurrentOption[1]
      if current == "Atur Speed" then
         _G.SpeedValue = tonumber(Text) or 16
         if _G.SpeedActive then game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.SpeedValue end
      elseif current == "Atur Jump" then
         _G.JumpValue = tonumber(Text) or 50
         if _G.JumpActive then game.Players.LocalPlayer.Character.Humanoid.JumpPower = _G.JumpValue end
      end
   end,
})

MainTab:CreateToggle({
   Name = "Aktifkan (On/Off)",
   CurrentValue = false,
   Flag = "MasterTog",
   Callback = function(Value)
      local current = CharacterDropdown.CurrentOption[1]
      local hum = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
      
      if current == "Atur Speed" then
         _G.SpeedActive = Value
         hum.WalkSpeed = _G.SpeedActive and _G.SpeedValue or 16
      elseif current == "Atur Jump" then
         _G.JumpActive = Value
         hum.UseJumpPower = true
         hum.JumpPower = _G.JumpActive and _G.JumpValue or 50
      elseif current == "Reset Karakter" then
         hum.WalkSpeed = 16
         hum.JumpPower = 50
         Rayfield:Notify({Title = "Reset", Content = "Karakter kembali normal", Duration = 2})
      end
   end,
})

-- AUTO RESPRAWN
game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1)
    if _G.SpeedActive then char.Humanoid.WalkSpeed = _G.SpeedValue end
end)

Rayfield:Notify({Title = "TolHub Ready", Content = "Pilih menu di dropdown!", Duration = 3})
