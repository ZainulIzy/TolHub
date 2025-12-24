-- [[ TOLHUB SCRIPT - REDZ LIBRARY VERSION ]]
local RedzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDZHUB/RedzLibV5/main/Source.Lua"))()

-- Membuat Window Utama
local Window = RedzLib:MakeWindow({
  Title = "TolHub 🌿",
  SubTitle = "by Xizzy",
  SaveFolder = "TolHubConfig.json" -- Menyimpan pengaturan otomatis
})

-- Tombol Melayang untuk Buka/Tutup Menu (Sangat penting buat pengguna Delta!)
Window:AddMinimizeButton({
  Button = { 
    Image = "rbxassetid://4483362458", -- Bisa ganti ID icon sesukamu
    BackgroundColor3 = Color3.fromRGB(25, 25, 25) 
  },
  Corner = { CornerRadius = UDim.new(0, 10) }
})

-- Variabel Penampung Angka
_G.SpeedInput = 16
_G.JumpInput = 50

-- ==========================================
-- [[ TAB MAIN ]]
-- ==========================================
local MainTab = Window:MakeTab("Main", "home") -- Nama Tab & Icon (Home)

MainTab:AddSection("Speed Settings")

-- Kotak Ketik Angka Speed
MainTab:AddTextBox({
  Name = "Angka Kecepatan",
  Default = "16",
  PlaceholderText = "Masukkan angka (Contoh: 100)",
  Callback = function(Text)
    _G.SpeedInput = tonumber(Text) -- Simpan ke variabel
  end
})

-- Tombol Aktifkan Speed
MainTab:AddButton({
  Name = "Aktifkan Speed",
  Callback = function()
    if _G.SpeedInput then
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.SpeedInput
    end
  end
})

MainTab:AddSection("Jump Settings")

-- Kotak Ketik Angka Jump
MainTab:AddTextBox({
  Name = "Angka Lompatan",
  Default = "50",
  PlaceholderText = "Contoh: 100",
  Callback = function(Text)
    _G.JumpInput = tonumber(Text)
  end
})

-- Tombol Aktifkan Jump
MainTab:AddButton({
  Name = "Aktifkan Lompatan",
  Callback = function()
    if _G.JumpInput then
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = _G.JumpInput
    end
  end
})

MainTab:AddSection("Extra")

-- Fitur Loncat Tanpa Batas (Toggle)
MainTab:AddToggle({
  Name = "Infinite Jump",
  Default = false,
  Callback = function(Value)
    _G.InfJump = Value
    game:GetService("UserInputService").JumpRequest:Connect(function()
      if _G.InfJump then
        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
      end
    end)
  end
})

-- ==========================================
-- [[ TAB FARM ]]
-- ==========================================
local FarmTab = Window:MakeTab("Farm", "tractor")

FarmTab:AddSection("Automation")

-- Auto Clicker
local clicking = false
FarmTab:AddToggle({
  Name = "Auto Clicker",
  Default = false,
  Callback = function(Value)
    clicking = Value
    spawn(function()
      while clicking do
        local VirtualInputManager = game:GetService("VirtualInputManager")
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
        task.wait(0.1)
      end
    end)
  end
})

-- Anti-AFK (Agar tidak disconnect)
FarmTab:AddToggle({
  Name = "Anti-AFK",
  Default = false,
  Callback = function(Value)
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
       if Value then
          vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
          task.wait(1)
          vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
       end
    end)
  end
})

-- ==========================================
-- [[ TAB LAINNYA ]]
-- ==========================================
local PetTab = Window:MakeTab("Pet", "dog")
local WebhookTab = Window:MakeTab("Webhook", "link")

-- Notifikasi Berhasil Dimuat
RedzLib:SetNotify({
  Title = "TolHub Ready!",
  Content = "Script Berhasil Dijalankan, Bos!",
  Time = 5
})
