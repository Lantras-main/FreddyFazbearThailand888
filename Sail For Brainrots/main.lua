-- Lib
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Window
local Window = Fluent:CreateWindow({
    Title = "FreddyFazbear - Sail For Brainrots",
    SubTitle = "by bxyth",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

-- Tabs
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Teleports = Window:AddTab({ Title = "Teleports", Icon = "" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "" }),
}

-- Variables
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local IslandsFolder = workspace.Map.Islands

local Options = Fluent.Options

-- Islands Variables
local Banana = IslandsFolder.Banana
local Basic = IslandsFolder.Basic
local Bloxy = IslandsFolder.Bloxy
local Coil = IslandsFolder.Coil
local Fido = IslandsFolder.Fido
local House = IslandsFolder.House
local Moai = IslandsFolder.Moai
local Ship = IslandsFolder.Ship
local UFO = IslandsFolder.UFO

-- Script
local AutoCollectRemote = ReplicatedStorage.Shared.Classes.Remote.Remotes.BaseShared_ClaimSlotBalance
local BuySpeedRemote = ReplicatedStorage.Shared.Classes.Remote.Remotes.VehicleShared_BuySpeedUpgrade
local UpgradeBaseRemote = ReplicatedStorage.Shared.Classes.Remote.Remotes.BaseShared_UpgradeBase
local UpgradeBrainrotsRemote = ReplicatedStorage.Shared.Classes.Remote.Remotes.BaseShared_UpgradeSlot

do
    -- Mains
    local SelectZone = Tabs.Main:AddDropdown("SelectZone", {
        Title = "Select Zone",
        Values = {"None", "Zone2", "Zone3", "Zone4", "Zone5", "Zone6", "Zone7", "Zone8", "Zone9", "Zone10", "Zone11", "Zone12", "Zone13"},
        Multi = false,
        Default = "None",
    })

    local AutoFarm = Tabs.Main:AddToggle("AutoFarm", {Title = "Auto Farm", Default = false })
    AutoFarm:OnChanged(function()
        while Options.AutoFarm.Value do
            local Selected = Workspace.Zones:FindFirstChild(Options.SelectZone.Value)
            if not Selected then return end

            local char = Player.Character
            if not char then continue end

            for _, brainrot in pairs(Selected.Objects:GetChildren()) do
                if not Options.AutoFarm.Value then return end
                 char:MoveTo(brainrot.PrimaryPart.Position)
                 wait(1)
                 repeat
                     fireproximityprompt(brainrot.ProximityPrompt)
                    task.wait()
                  until brainrot == nil or brainrot.Parent ~= Options.SelectZone.Value or not Options.AutoFarm.Value

                char:MoveTo(workspace.Bases[Player.Name].Root.Position)
                 task.wait(0.5)
            end

             task.wait(1)
        end
    end)

    local AutoCollectCash = Tabs.Main:AddToggle("AutoCollectCash", {Title = "Auto Collect Cash", Default = false })
    AutoCollectCash:OnChanged(function()
        if Options.AutoCollectCash.Value then
            repeat
                AutoCollectRemote:FireServer(
                    1
                )
                task.wait(0.25)
                AutoCollectRemote:FireServer(
                    2
                )
                task.wait(0.25)
                AutoCollectRemote:FireServer(
                    3
                )
                task.wait(0.25)
                AutoCollectRemote:FireServer(
                    4
                )
                AutoCollectRemote:FireServer(
                    5
                )
                task.wait(0.25)
                AutoCollectRemote:FireServer(
                    6
                )
                task.wait(0.25)
                AutoCollectRemote:FireServer(
                    7
                )
                task.wait(0.25)
                AutoCollectRemote:FireServer(
                    8
                )
                task.wait(0.25)
                AutoCollectRemote:FireServer(
                    9
                )
                task.wait(0.25)
                AutoCollectRemote:FireServer(
                    10
                )
            until not Options.AutoCollectCash.Value
        end
    end)

    local AutoUpgradeBrainrots = Tabs.Main:AddToggle("AutoUpgradeBrainrots", {Title = "Auto Upgrade Brainrots", Default = false })
    AutoUpgradeBrainrots:OnChanged(function()
        if Options.AutoUpgradeBrainrots.Value then
            repeat
                task.wait(0.10)
                UpgradeBrainrotsRemote:FireServer(
                    1
                )
                task.wait(0.10)
                UpgradeBrainrotsRemote:FireServer(
                    2
                )
                task.wait(0.10)
                UpgradeBrainrotsRemote:FireServer(
                    3
                )
                task.wait(0.10)
                UpgradeBrainrotsRemote:FireServer(
                    4
                )
                task.wait(0.10)
                UpgradeBrainrotsRemote:FireServer(
                    5
                )
                task.wait(0.10)
                UpgradeBrainrotsRemote:FireServer(
                    6
                )
                task.wait(0.10)
                UpgradeBrainrotsRemote:FireServer(
                    7
                )
                task.wait(0.10)
                UpgradeBrainrotsRemote:FireServer(
                    8
                )
                task.wait(0.10)
                UpgradeBrainrotsRemote:FireServer(
                    9
                )
                task.wait(0.10)
                UpgradeBrainrotsRemote:FireServer(
                    10
                )
            until not Options.AutoUpgradeBrainrots.Value
        end
    end)

    local AutoBuySpeed = Tabs.Main:AddToggle("AutoBuySpeed", {Title = "Auto Buy Speed", Default = false })
    AutoBuySpeed:OnChanged(function()
        if Options.AutoBuySpeed.Value then
            repeat
                task.wait(0.10)
                BuySpeedRemote:FireServer(
                    5
                )
            until not Options.AutoBuySpeed.Value
        end
    end)

    local AutoUpgradeBase = Tabs.Main:AddToggle("AutoUpgradeBase", {Title = "Auto Upgrade Base", Default = false })
    AutoUpgradeBase:OnChanged(function()
        if Options.AutoUpgradeBase.Value then
            repeat
                task.wait(0.10)
                UpgradeBaseRemote:FireServer()
            until not Options.AutoUpgradeBase.Value
        end
    end)

    -- Teleports
    Tabs.Teleports:AddButton({
        Title = "Banana Island",
        Description = "Teleports you to Banana Island",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Banana.Banana.CFrame
        end
    })

    Tabs.Teleports:AddButton({
        Title = "Basic Island",
        Description = "Teleports you to Basic Island",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Basic.Grass.CFrame
        end
    })

    Tabs.Teleports:AddButton({
        Title = "Bloxy Island",
        Description = "Teleports you to Bloxy Island",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Bloxy.Bloxy.CFrame
        end
    })

    Tabs.Teleports:AddButton({
        Title = "Coil Island",
        Description = "Teleports you to Coil Island",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Coil.Grass.CFrame
        end
    })

    Tabs.Teleports:AddButton({
        Title = "Fido Island",
        Description = "Teleports you to Fido Island",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Fido.Grass.CFrame
        end
    })

    Tabs.Teleports:AddButton({
        Title = "House Island",
        Description = "Teleports you to House Island",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = House.Grass.CFrame
        end
    })

    Tabs.Teleports:AddButton({
        Title = "Moai Island",
        Description = "Teleports you to Moai Island",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Moai.Grass.CFrame
        end
    })

    Tabs.Teleports:AddButton({
        Title = "Ship Island",
        Description = "Teleports you to Ship Island",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Ship.Grass.CFrame
        end
    })

    Tabs.Teleports:AddButton({
        Title = "UFO Island",
        Description = "Teleports you to UFO Island",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = UFO.FloorOoze.CFrame
        end
    })

    -- Misc
    Tabs.Misc:AddButton({
        Title = "Rejoin",
        Description = "Rejoins the server",
        Callback = function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
        end
    })

    Tabs.Misc:AddButton({
        Title = "Redeem All Codes",
        Description = "Redeems all available codes",
        Callback = function()
            local codes = {"Stop Looking", "TommysHouse", "Phew", "GoldStatue", "FreeSpin", "DiscordDiamond", "Egg"}

            for i, v in pairs(codes) do
                local Event = game:GetService("ReplicatedStorage").Shared.Classes.RemoteFunction.Remotes.CodeShared_Redeem
                Event:InvokeServer(v)
                task.wait()
            end
        end
    })
end