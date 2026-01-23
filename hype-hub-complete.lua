-- HYPE HUB Script v2.0
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- Key System
local validKeys = {"HYPE2024", "ADMIN123", "VIP999", "PREMIUM2024"}

-- GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "HypeHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Key Frame
local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 350, 0, 200)
keyFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
keyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
keyFrame.BorderSizePixel = 0
keyFrame.Active = true
keyFrame.Draggable = true
keyFrame.Parent = screenGui

local keyCorner = Instance.new("UICorner")
keyCorner.CornerRadius = UDim.new(0, 10)
keyCorner.Parent = keyFrame

local keyTitle = Instance.new("TextLabel")
keyTitle.Size = UDim2.new(1, 0, 0, 50)
keyTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
keyTitle.Text = "🔑 HYPE HUB - KEY SYSTEM"
keyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
keyTitle.Font = Enum.Font.GothamBold
keyTitle.TextSize = 18
keyTitle.Parent = keyFrame

local keyTitleCorner = Instance.new("UICorner")
keyTitleCorner.CornerRadius = UDim.new(0, 10)
keyTitleCorner.Parent = keyTitle

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(0, 310, 0, 40)
keyInput.Position = UDim2.new(0, 20, 0, 70)
keyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
keyInput.Text = ""
keyInput.PlaceholderText = "Digite a key aqui..."
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.Font = Enum.Font.Gotham
keyInput.TextSize = 14
keyInput.Parent = keyFrame

local keyInputCorner = Instance.new("UICorner")
keyInputCorner.CornerRadius = UDim.new(0, 8)
keyInputCorner.Parent = keyInput

local keySubmit = Instance.new("TextButton")
keySubmit.Size = UDim2.new(0, 310, 0, 40)
keySubmit.Position = UDim2.new(0, 20, 0, 120)
keySubmit.BackgroundColor3 = Color3.fromRGB(20, 80, 20)
keySubmit.Text = "VERIFICAR KEY"
keySubmit.TextColor3 = Color3.fromRGB(255, 255, 255)
keySubmit.Font = Enum.Font.GothamBold
keySubmit.TextSize = 16
keySubmit.Parent = keyFrame

local keySubmitCorner = Instance.new("UICorner")
keySubmitCorner.CornerRadius = UDim.new(0, 8)
keySubmitCorner.Parent = keySubmit

local keyStatus = Instance.new("TextLabel")
keyStatus.Size = UDim2.new(1, 0, 0, 20)
keyStatus.Position = UDim2.new(0, 0, 1, -25)
keyStatus.BackgroundTransparency = 1
keyStatus.Text = ""
keyStatus.TextColor3 = Color3.fromRGB(150, 150, 150)
keyStatus.Font = Enum.Font.Gotham
keyStatus.TextSize = 10
keyStatus.Parent = keyFrame

-- Main Frame (hidden initially)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 620)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -310)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Visible = false
mainFrame.Parent = screenGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 50)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
title.Text = "HYPE HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = mainFrame
Instance.new("UICorner", title).CornerRadius = UDim.new(0, 10)

-- Minimize Button
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 35, 0, 35)
minimizeBtn.Position = UDim2.new(1, -40, 0, 7.5)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 24
minimizeBtn.ZIndex = 2
minimizeBtn.Parent = mainFrame
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 8)

-- Create buttons helper
local function createButton(text, position, parent)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 260, 0, 40)
    btn.Position = UDim2.new(0, 20, 0, position)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.Parent = parent
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    return btn
end

local flyBtn = createButton("FLY: OFF", 70, mainFrame)
local noclipBtn = createButton("NOCLIP: OFF", 120, mainFrame)
local speedBtn = createButton("SPEED BOOST", 170, mainFrame)
local jumpBtn = createButton("INFINITE JUMP: OFF", 220, mainFrame)
local aimkillBtn = createButton("AIMKILL: OFF", 270, mainFrame)
local aimbotBtn = createButton("AIMBOT MURDERER [E]", 320, mainFrame)
local espBtn = createButton("ESP: OFF", 370, mainFrame)
local bombJumpBtn = createButton("AUTO FARM: OFF", 420, mainFrame)
local autoGunBtn = createButton("AUTO GRAB GUN: ON", 470, mainFrame)
autoGunBtn.BackgroundColor3 = Color3.fromRGB(20, 80, 20)
local closeBtn = createButton("CLOSE", 520, mainFrame)
closeBtn.BackgroundColor3 = Color3.fromRGB(60, 20, 20)
closeBtn.Font = Enum.Font.GothamBold

-- Variables
local flying, noclip, aimkill, infJump, espEnabled, autoGun, autoFarm = false, false, false, false, false, true, false
local speed = 50
local espCache = {}
local bodyVelocity, bodyGyro

-- Functions
local function getCharacter() return player.Character or player.CharacterAdded:Wait() end
local function getRootPart() return getCharacter():WaitForChild("HumanoidRootPart") end
local function getHumanoid() return getCharacter():WaitForChild("Humanoid") end

-- Keybind INSERT
local keyAuthenticated = false

keySubmit.MouseButton1Click:Connect(function()
    local key = keyInput.Text
    local valid = string.find(string.upper(key), "HYPE") ~= nil
    
    if valid then
        keyStatus.Text = "✓ Key válida! Carregando..."
        keyStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
        wait(1)
        keyFrame:Destroy()
        mainFrame.Visible = true
        keyAuthenticated = true
    else
        keyStatus.Text = "✗ Key inválida!"
        keyStatus.TextColor3 = Color3.fromRGB(255, 0, 0)
        keyInput.Text = ""
        wait(2)
        keyStatus.Text = ""
        keyStatus.TextColor3 = Color3.fromRGB(150, 150, 150)
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Insert and keyAuthenticated then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

-- Fly
local function toggleFly()
    flying = not flying
    if flying then
        flyBtn.Text = "FLY: ON"
        flyBtn.BackgroundColor3 = Color3.fromRGB(20, 80, 20)
        bodyVelocity = Instance.new("BodyVelocity", getRootPart())
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        bodyGyro = Instance.new("BodyGyro", getRootPart())
        bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        bodyGyro.P = 9e4
    else
        flyBtn.Text = "FLY: OFF"
        flyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
        if bodyVelocity then bodyVelocity:Destroy() end
        if bodyGyro then bodyGyro:Destroy() end
    end
end

RunService.RenderStepped:Connect(function()
    if flying and bodyVelocity and bodyGyro then
        local camera = workspace.CurrentCamera
        local moveDirection = Vector3.new(0, 0, 0)
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDirection = moveDirection + camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDirection = moveDirection - camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDirection = moveDirection - camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDirection = moveDirection + camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDirection = moveDirection + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDirection = moveDirection - Vector3.new(0, 1, 0) end
        bodyVelocity.Velocity = moveDirection * speed
        bodyGyro.CFrame = camera.CFrame
    end
end)

-- Noclip
local function toggleNoclip()
    noclip = not noclip
    noclipBtn.Text = noclip and "NOCLIP: ON" or "NOCLIP: OFF"
    noclipBtn.BackgroundColor3 = noclip and Color3.fromRGB(20, 80, 20) or Color3.fromRGB(40, 40, 60)
end

RunService.Stepped:Connect(function()
    if noclip then
        pcall(function()
            for _, part in pairs(getCharacter():GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end)
    end
end)

-- Speed
speedBtn.MouseButton1Click:Connect(function()
    pcall(function()
        getHumanoid().WalkSpeed = 100
        speedBtn.BackgroundColor3 = Color3.fromRGB(20, 80, 20)
        wait(0.2)
        speedBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    end)
end)

-- Infinite Jump
jumpBtn.MouseButton1Click:Connect(function()
    infJump = not infJump
    jumpBtn.Text = infJump and "INFINITE JUMP: ON" or "INFINITE JUMP: OFF"
    jumpBtn.BackgroundColor3 = infJump and Color3.fromRGB(20, 80, 20) or Color3.fromRGB(40, 40, 60)
end)

UserInputService.JumpRequest:Connect(function()
    if infJump then pcall(function() getHumanoid():ChangeState(Enum.HumanoidStateType.Jumping) end) end
end)

-- Aimkill
local function toggleAimkill()
    aimkill = not aimkill
    aimkillBtn.Text = aimkill and "AIMKILL: ON" or "AIMKILL: OFF"
    aimkillBtn.BackgroundColor3 = aimkill and Color3.fromRGB(20, 80, 20) or Color3.fromRGB(40, 40, 60)
end

RunService.RenderStepped:Connect(function()
    if aimkill then
        pcall(function()
            local character = getCharacter()
            for _, target in pairs(Players:GetPlayers()) do
                if target ~= player and target.Character then
                    local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
                    if targetRoot then
                        local tool = character:FindFirstChildOfClass("Tool")
                        if tool and tool:FindFirstChild("Handle") then
                            tool:Activate()
                            firetouchinterest(tool.Handle, targetRoot, 0)
                            firetouchinterest(tool.Handle, targetRoot, 1)
                        end
                    end
                end
            end
        end)
    end
end)

-- ESP
local function toggleESP()
    espEnabled = not espEnabled
    espBtn.Text = espEnabled and "ESP: ON" or "ESP: OFF"
    espBtn.BackgroundColor3 = espEnabled and Color3.fromRGB(20, 80, 20) or Color3.fromRGB(40, 40, 60)
    if not espEnabled then
        for _, cache in pairs(espCache) do
            pcall(function()
                if cache.highlight then cache.highlight:Destroy() end
                if cache.billboard then cache.billboard:Destroy() end
            end)
        end
        espCache = {}
    end
end

local function createESP(target)
    if espCache[target] or not target.Character then return end
    pcall(function()
        if not target.Character:FindFirstChild("Head") then return end
        local highlight = Instance.new("Highlight", target.Character)
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0
        local billboardGui = Instance.new("BillboardGui", target.Character.Head)
        billboardGui.AlwaysOnTop = true
        billboardGui.Size = UDim2.new(0, 100, 0, 50)
        billboardGui.StudsOffset = Vector3.new(0, 2, 0)
        local nameLabel = Instance.new("TextLabel", billboardGui)
        nameLabel.Size = UDim2.new(1, 0, 1, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = target.Name
        nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextSize = 14
        nameLabel.TextStrokeTransparency = 0.5
        espCache[target] = {highlight = highlight, billboard = billboardGui, label = nameLabel}
    end)
end

RunService.RenderStepped:Connect(function()
    if espEnabled then
        for _, target in pairs(Players:GetPlayers()) do
            if target ~= player and target.Character and target.Character:FindFirstChild("Head") then
                if not espCache[target] then createESP(target) end
                local cache = espCache[target]
                if cache and cache.highlight and cache.label then
                    pcall(function()
                        if target.Character:FindFirstChild("Knife") or (target.Backpack and target.Backpack:FindFirstChild("Knife")) then
                            cache.highlight.FillColor = Color3.fromRGB(255, 0, 0)
                            cache.label.Text = target.Name .. "\n[MURDERER]"
                            cache.label.TextColor3 = Color3.fromRGB(255, 0, 0)
                        elseif target.Character:FindFirstChild("Gun") or target.Character:FindFirstChild("Revolver") or (target.Backpack and (target.Backpack:FindFirstChild("Gun") or target.Backpack:FindFirstChild("Revolver"))) then
                            cache.highlight.FillColor = Color3.fromRGB(0, 0, 255)
                            cache.label.Text = target.Name .. "\n[SHERIFF]"
                            cache.label.TextColor3 = Color3.fromRGB(0, 100, 255)
                        else
                            cache.highlight.FillColor = Color3.fromRGB(0, 255, 0)
                            cache.label.Text = target.Name .. "\n[INNOCENT]"
                            cache.label.TextColor3 = Color3.fromRGB(0, 255, 0)
                        end
                    end)
                end
            end
        end
    end
end)

-- Aimbot Murderer
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.E then
        pcall(function()
            local character = getCharacter()
            local tool = character:FindFirstChildOfClass("Tool")
            if tool and (tool.Name == "Gun" or tool.Name == "Revolver") then
                for _, target in pairs(Players:GetPlayers()) do
                    if target ~= player and target.Character then
                        local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
                        if targetRoot and (target.Character:FindFirstChild("Knife") or (target.Backpack and target.Backpack:FindFirstChild("Knife"))) then
                            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, targetRoot.Position)
                            task.wait(0.05)
                            tool:Activate()
                            break
                        end
                    end
                end
            end
        end)
    end
end)

-- Auto Grab Gun
local function toggleAutoGun()
    autoGun = not autoGun
    autoGunBtn.Text = autoGun and "AUTO GRAB GUN: ON" or "AUTO GRAB GUN: OFF"
    autoGunBtn.BackgroundColor3 = autoGun and Color3.fromRGB(20, 80, 20) or Color3.fromRGB(40, 40, 60)
end

-- Auto Farm
local function toggleAutoFarm()
    autoFarm = not autoFarm
    bombJumpBtn.Text = autoFarm and "AUTO FARM: ON" or "AUTO FARM: OFF"
    bombJumpBtn.BackgroundColor3 = autoFarm and Color3.fromRGB(20, 80, 20) or Color3.fromRGB(40, 40, 60)
end

RunService.Heartbeat:Connect(function()
    if autoFarm then
        pcall(function()
            for _, coin in pairs(workspace:GetDescendants()) do
                if coin.Name == "Coin" or coin.Name == "CoinContainer" then
                    local root = getRootPart()
                    if coin:IsA("BasePart") then
                        firetouchinterest(root, coin, 0)
                        firetouchinterest(root, coin, 1)
                    elseif coin:FindFirstChild("Coin") then
                        firetouchinterest(root, coin.Coin, 0)
                        firetouchinterest(root, coin.Coin, 1)
                    end
                end
            end
        end)
    end
end)

workspace.ChildAdded:Connect(function(child)
    task.wait(0.1)
    if autoGun and child.Name == "GunDrop" then
        pcall(function()
            firetouchinterest(getRootPart(), child, 0)
            firetouchinterest(getRootPart(), child, 1)
        end)
    end
end)

-- Minimize
local minimized = false
minimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    mainFrame.Size = minimized and UDim2.new(0, 300, 0, 50) or UDim2.new(0, 300, 0, 620)
    minimizeBtn.Text = minimized and "+" or "-"
    for _, child in pairs(mainFrame:GetChildren()) do
        if child ~= title and child ~= minimizeBtn and child:IsA("TextButton") then
            child.Visible = not minimized
        end
    end
end)

-- Keybind INSERT (moved to key system section above)

-- Button Connections
flyBtn.MouseButton1Click:Connect(toggleFly)
noclipBtn.MouseButton1Click:Connect(toggleNoclip)
aimkillBtn.MouseButton1Click:Connect(toggleAimkill)
espBtn.MouseButton1Click:Connect(toggleESP)
bombJumpBtn.MouseButton1Click:Connect(toggleAutoFarm)
autoGunBtn.MouseButton1Click:Connect(toggleAutoGun)
closeBtn.MouseButton1Click:Connect(function()
    if flying then toggleFly() end
    if noclip then toggleNoclip() end
    if aimkill then toggleAimkill() end
    if espEnabled then toggleESP() end
    if autoFarm then toggleAutoFarm() end
    if autoGun then toggleAutoGun() end
    screenGui:Destroy()
end)

-- Character Respawn Handler
player.CharacterAdded:Connect(function()
    task.wait(1)
    if flying then flying = false toggleFly() end
end)
