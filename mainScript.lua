-- [[ TOLHUB SCRIPT - BY XIZZY ]]
-- Memanggil Library Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Membuat Window Utama
local Window = Rayfield:CreateWindow({
   Name = "TolHub 🌿",
   LoadingTitle = "TolHub Script",
   LoadingSubtitle = "by Xizzy",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "TolHubData" -- Nama folder buat nyimpen settingan
   },
   KeySystem = false -- Tidak pakai sistem kunci (Key)
})

-- Variabel Global (Penyimpanan angka sementara)
_G.SpeedInput = 16
_G.JumpInput = 50

-- ==========================================
-- [[ TAB MAIN ]]
-- ==========================================
local MainTab = Window:CreateTab("Main 🏠", 4483362458)

MainTab:CreateSection("Speed Settings")

-- Kotak Input untuk angka Speed
MainTab:CreateInput({
   Name = "Angka Kecepatan",
   PlaceholderText = "Contoh: 100",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      _G.SpeedInput = tonumber(Text) -- Merubah teks input jadi angka
   end,
})

-- Tombol untuk mengaktifkan Speed
MainTab:CreateButton({
   Name = "Aktifkan Speed",
   Callback = function()
      if _G.SpeedInput then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.SpeedInput
         -- Notifikasi sukses
         Rayfield:Notify({
            Title = "Speed Aktif!",
            Content = "Kecepatan diatur ke: " .. _G.SpeedInput,
            Duration = 2,
            Image = 4483362458,
         })
      end
   end,
})

MainTab:CreateSection("Jump Settings")

-- Kotak Input untuk angka Jump
MainTab:CreateInput({
   Name = "Angka Lompatan",
   PlaceholderText = "Contoh: 100",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      _G.JumpInput = tonumber(Text)
   end,
})

-- Tombol untuk mengaktifkan Jump
MainTab:CreateButton({
   Name = "Aktifkan Lompatan",
   Callback = function()
      if _G.JumpInput then
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = _G.JumpInput
      end
   end,
})

MainTab:CreateSection("Extra")

-- Fitur Loncat Terus-menerus
MainTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "InfJump",
   Callback = function(Value)
      _G.InfJump = Value
      game:GetService("UserInputService").JumpRequest:Connect(function()
         if _G.InfJump then
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
         end
      end)
   end,
})

-- ==========================================
-- [[ TAB FARM ]]
-- ==========================================
local FarmTab = Window:CreateTab("Farm 🚜", 4483362458)

FarmTab:CreateSection("Automation")

-- Fitur Klik Otomatis
local clicking = false
FarmTab:CreateToggle({
   Name = "Auto Clicker",
   CurrentValue = false,
   Flag = "AutoClick",
   Callback = function(Value)
      clicking = Value
      spawn(function()
         while clicking do
            local VirtualInputManager = game:GetService("VirtualInputManager")
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
            wait(0.1) -- Delay klik
         end
      end)
   end,
})

-- Fitur Anti-Kick karena diam terlalu lama
FarmTab:CreateToggle({
   Name = "Anti-AFK",
   CurrentValue = false,
   Flag = "AntiAFK",
   Callback = function(Value)
      local vu = game:GetService("VirtualUser")
      game:GetService("Players").LocalPlayer.Idled:connect(function()
         if Value then
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
         end
      end)
   end,
})

-- ==========================================
-- [[ TAB LAINNYA ]]
-- ==========================================
local PetTab = Window:CreateTab("Pet 🐶", 4483362458)
local WebhookTab = Window:CreateTab("Webhook 🔗", 4483362458)

-- Notifikasi saat script selesai dimuat semua
Rayfield:Notify({
   Title = "TolHub Ready!",
   Content = "Selamat pakai scriptnya, Bos!",
   Duration = 5,
   Image = 4483362458,
})
