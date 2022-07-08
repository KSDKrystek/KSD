-- I KNOW THERE IS SOURCE BUT OBFUSCATOR IS BROKEN AND THAT GAME TOO WITH INGAME FUNCTIONS TO BYPASS
local HwidCheck = tostring(game:GetService("RbxAnalyticsService"):GetClientId())
local hwidListPosPet = loadstring(game:HttpGet("https://raw.githubusercontent.com/KrystekYTpv/AJOVFusfvboasjfbosfpoazsfnasfafa/main/hwidListPosPet.lua"))()
if table.find(hwidListPosPet,HwidCheck) then
-- LIBRARY
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Pet Posse By KSD", "DarkTheme")

if GlownyLoop then
    GlownyLoop:Disconnect()
end

-- UPPER TABS
local CreditsTab = Window:NewTab("Credits")
local CreditsSection1 = CreditsTab:NewSection("DEVELOPER:")
CreditsSection1:NewLabel("!KrystekYT#8687")
local CreditsSection2 = CreditsTab:NewSection("SPECIAL THANKS:")
CreditsSection2:NewLabel("!KrystekYT#8687 - For motivation to my self")
local CreditsSection3 = CreditsTab:NewSection("TESTERS:")
CreditsSection3:NewLabel("!KrystekYT#8687")
CreditsSection3:NewLabel("Gigant#0001")

-- MAIN TABS
local FarmingTab = Window:NewTab("Farming")
local InstabreakSection1 = FarmingTab:NewSection("Insta Break")
local FarmingSection1 = FarmingTab:NewSection("Farming")
local RebirthSection1 = FarmingTab:NewSection("Auto Rebirth")
local EggsTab = Window:NewTab("Eggs")
local EggsSection1 = EggsTab:NewSection("Auto Open Eggs")
local MiscTab = Window:NewTab("Misc")
local MiscSection1 = MiscTab:NewSection("Addons")
local MiscSection2 = MiscTab:NewSection("Remote Menu")
getgenv().CodesTab = Window:NewTab("Codes (DEV)")
getgenv().CodesSection1 = CodesTab:NewSection("Print Codes")
getgenv().CodesSection2 = CodesTab:NewSection("Print Codes And Redeem")
getgenv().CodesSectionSuccess = true
local SettingsTab = Window:NewTab("Settings")
local SettingsSection1 = SettingsTab:NewSection("Settings")
-- FUNCTIONS
local closestCoin = nil
local lastCoin = math.huge
spawn(function()
    while task.wait(1) do
        local plrWorld = tostring(game:GetService("Players").LocalPlayer.Leaderstats.currentWorld.Value)
        local a = game:GetService("Workspace")["__THINGS"].Coins[plrWorld]:GetChildren()
        local b = game.Players.LocalPlayer.Character.HumanoidRootPart
        lastCoin = math.huge
        for i,v in pairs(a) do
            if v ~= nil and v:FindFirstChild("Coin") ~= nil and game:GetService("Workspace")["__THINGS"].Coins:FindFirstChild(plrWorld)  then
                local distance = (b.Position - v.Coin.Position).magnitude
                if distance < lastCoin then
                    closestCoin = v
                    lastCoin = distance
                end
            end
        end
    end   
end)



local function CheckArena()
        for i,v in pairs(game:GetService("Workspace")["__MAP"].Areas:GetChildren()) do
            getgenv().ArenaInstaBreak = v
        end
        
        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Buttons:GetDescendants()) do
            if v:IsA("Frame") and v.Parent:IsA("BillboardGui") then
                v.Visible = false
            end
        end
end

function InstaBreakLoop()
    if getgenv().InstaDestroy == true then
        task.wait(0.5)
        local ListaButton = game:GetService("Players").LocalPlayer.PlayerGui.Buttons
        ListaButton.ChildAdded:connect(function(button)
            getgenv().ButtonNumber = button
        end)

        if ButtonNumber == nil then
            return wait()
        else
            if not workspace.__THINGS.Coins[tostring(ArenaInstaBreak)]:FindFirstChild(tostring(ButtonNumber)) or not workspace.__THINGS.Coins[tostring(ArenaInstaBreak)][tostring(ButtonNumber)]:FindFirstChild("Coin") then
                getgenv().ButtonNumber = nil
            end
            local t1 = workspace.__THINGS.Coins[tostring(ArenaInstaBreak)][tostring(ButtonNumber)].Coin
            local t2 = workspace.__THINGS.Coins[tostring(ArenaInstaBreak)][tostring(ButtonNumber)]
            workspace.__THINGS.__REMOTES.clickedButton:FireServer(t1, t2)
        end
    end
end

function AutoFarmNearestFunction()
    if getgenv().AutoFarmNearest1 == true then
        local a = closestCoin
        local plrArea = game:GetService("Players").LocalPlayer.Leaderstats.currentWorld.Value
        repeat
            wait()
            if a and a:FindFirstChild("Coin") and a.Coin:FindFirstChild("ClickDetector") then
                fireclickdetector(a.Coin.ClickDetector)
            end
        until a == nil or a:FindFirstChild("Coin") == nil or AutoFarmNearest1 == false
        lastCoin = math.huge
    end
end

-- FARMING SCRIPTS
InstabreakSection1:NewToggle("Instant Destroy", "Super Fast Farming", function(instadestroy)
    if instadestroy == true then
        getgenv().InstaDestroy = true
    else
        getgenv().InstaDestroy = false
    end
end)



FarmingSection1:NewToggle("Autofarm", "AutoFarming Coins and Exp", function(autofarmnearest)
    if autofarmnearest == true then
        getgenv().AutoFarmNearest1 = true
    else
        getgenv().AutoFarmNearest1 = false
    end

    repeat
    task.wait(1)
        AutoFarmNearestFunction()
        getgenv().AutoFarmNearest1 = true
    until getgenv().AutoFarmNearest1 == false
end)



RebirthSection1:NewToggle("Auto Rebirth", "Auto Rebirth", function(autorebirthbetter)
    if autorebirthbetter == true then
        getgenv().AutoRebirthBetter1 = true
    else
        getgenv().AutoRebirthBetter1 = false
    end
    
    while wait(1) and getgenv().AutoRebirthBetter1 do
        local MaxLevel = game:GetService("Players").LocalPlayer.PlayerGui.Notifications.Level.Text
        if MaxLevel == "MAX LEVEL!" then
            --print("MaxLevel")
            getgenv().InstaDestroy = false
            getgenv().AutoFarmNearest1 = false
            for i = 0,10 do
                game:GetService("Workspace").__THINGS.__REMOTES.rebirth:InvokeServer(game:GetService("Players").LocalPlayer)
            end
        else
            getgenv().InstaDestroy = true
            getgenv().AutoFarmNearest1 = true
            --print("Kontynuacja")
        end
    end
end)


getgenv().GlownyLoop = game:GetService"RunService".RenderStepped:Connect(function()
    if getgenv().InstaDestroy == true then
        CheckArena()
        InstaBreakLoop()
    end
    --if AutoFarmNearest1 == true then
    --    AutoFarmNearestFunction()
    --end
end)


-- EGGS SCRIPTS
local ListaJajek = {}
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Billboards.Eggs:GetChildren()) do
	table.insert(ListaJajek, v.Name)
end
EggsSection1:NewDropdown("Select Egg", "Select egg what want to open", ListaJajek, function(selectegg)
    if selectegg then
        getgenv().EggToOpen = selectegg
    end
end)
EggsSection1:NewToggle("Use Triple Gamepass", "Use Triple Gamepass", function(usetriple)
    if usetriple == true then
        getgenv().UseTripleGamepass = true
    else
        getgenv().UseTripleGamepass = false
    end
end)
getgenv().UseTripleGamepass = false
EggsSection1:NewToggle("Auto Open Egg", "Auto Open Egg", function(openegg)
    if openegg == true then
        getgenv().AutoOpenEgg = true
    else
        getgenv().AutoOpenEgg = false
    end
    
    while task.wait(1) and getgenv().AutoOpenEgg do
        if UseTripleGamepass == false then
            game:GetService("Workspace").__THINGS.__REMOTES.buyEgg:InvokeServer(getgenv().EggToOpen)
        elseif UseTripleGamepass == true then
            game:GetService("Workspace").__THINGS.__REMOTES.buyEgg:InvokeServer(getgenv().EggToOpen, "tripleEgg")
        end
    end
end)
-- MISC SCRIPTS
MiscSection1:NewToggle("Disable Coins Pop Ups", "Disable Coin and exp animation", function(disablepopups)
    if disablepopups == true then
        getgenv().DisablePopUps1 = true
    else
        getgenv().DisablePopUps1 = false
    end
    
    if DisablePopUps1 == true then
        for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Billboards:GetChildren()) do
            if v:IsA("BillboardGui") then
                v.Enabled = false
            end
        end
    else
        for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Billboards:GetChildren()) do
            if v:IsA("BillboardGui") then
                v.Enabled = true
            end
        end
    end
end)
MiscSection1:NewToggle("Auto Redeem Rewards", "Auto Redeem Rewards", function(redeemrewards)
    if redeemrewards == true then
        getgenv().RedeemRewards = true
    else
        getgenv().RedeemRewards = false
    end
    
    while wait(0.5) and getgenv().RedeemRewards do
        for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ExclusiveShop.Frame.Container.Gifts:GetDescendants()) do
            if v:IsA("TextLabel") and v.Name == "Time" then
                if v.Text == "Claim" then
                    getgenv().AutoRebirthBetter1 = false
                    getgenv().AutoFarmNearest1 = false
                    getgenv().InstaDestroy = false
                    wait(2)
                    workspace.__THINGS.__REMOTES.claimGift:InvokeServer(tostring(v.Parent.Parent))
                    wait(1)
                    getgenv().AutoRebirthBetter1 = true
                    getgenv().AutoFarmNearest1 = true
                    getgenv().InstaDestroy = true
                end
            end
        end
    end
end)
MiscSection1:NewButton("Give Gamepass", "That will give you temporary gamepasses", function()
    game:GetService("Players").LocalPlayer.Leaderstats.teleport.Value = true
    game:GetService("Players").LocalPlayer.Leaderstats.tripleEggs.Value = true
    game:GetService("Players").LocalPlayer.Leaderstats.fastHatch.Value = true
    game:GetService("Players").LocalPlayer.Leaderstats.autoHatch.Value = true
end)
MiscSection2:NewButton("Merchant", "Open Merchant Remotely", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Merchant.Enabled = not game:GetService("Players").LocalPlayer.PlayerGui.Merchant.Enabled
end)
MiscSection2:NewButton("Upgrade", "Open Upgrade Remotely", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Upgrade.Enabled = not game:GetService("Players").LocalPlayer.PlayerGui.Upgrade.Enabled
end)
MiscSection2:NewButton("Teleport", "Open Teleport Remotely", function()
    game:GetService("Players").LocalPlayer.PlayerGui.Teleport.Enabled = not game:GetService("Players").LocalPlayer.PlayerGui.Teleport.Enabled
end)
MiscSection2:NewButton("Huge Machine", "Open Huge Machine Remotely", function()
    game:GetService("Players").LocalPlayer.PlayerGui.HugeMachine.Enabled = not game:GetService("Players").LocalPlayer.PlayerGui.HugeMachine.Enabled
end)
MiscSection2:NewButton("Pet Information", "Open Pet Information Remotely", function()
    game:GetService("Players").LocalPlayer.PlayerGui.PetInfo.Enabled = not game:GetService("Players").LocalPlayer.PlayerGui.PetInfo.Enabled
end)
-- CODES SCRIPTS
local GraczName = game.Players.LocalPlayer.DisplayName
CodesSection1:NewButton("Check Code Spawn", "", function()
    if GraczName == "KrystekYT" or GraczName == "KnGraphics" then
        for i,v in pairs(game:GetService("Workspace")["__MAP"].Areas.SpawnWorld:GetDescendants()) do
            if v:IsA("TextLabel") and v.Parent:IsA("SurfaceGui") then
        		print(v.Text)
        	end
        end
    end
end)
CodesSection1:NewButton("Check Code Sea", "", function()
    if GraczName == "KrystekYT" or GraczName == "KnGraphics" then
        for i,v in pairs(game:GetService("Workspace")["__MAP"].Areas.SeaWorld:GetDescendants()) do
            if v:IsA("TextLabel") and v.Parent:IsA("SurfaceGui") then
        		print(v.Text)
        	end
        end
    end
end)
CodesSection2:NewButton("Check Code Spawn and Redeem", "", function()
    if GraczName == "KrystekYT" or GraczName == "KnGraphics" then
        for i,v in pairs(game:GetService("Workspace")["__MAP"].Areas.SpawnWorld:GetDescendants()) do
            if v:IsA("TextLabel") and v.Parent:IsA("SurfaceGui") then
        		print(v.Text)
        		workspace.__THINGS.__REMOTES.redeemCode:InvokeServer(v.Text)
        	end
        end
    end
end)
CodesSection2:NewButton("Check Code Sea and Redeem", "", function()
    if GraczName == "KrystekYT" or GraczName == "KnGraphics" then
        for i,v in pairs(game:GetService("Workspace")["__MAP"].Areas.SeaWorld:GetDescendants()) do
            if v:IsA("TextLabel") and v.Parent:IsA("SurfaceGui") then
        		print(v.Text)
        		workspace.__THINGS.__REMOTES.redeemCode:InvokeServer(v.Text)
        	end
        end
    end
end)
-- SETTINGS SCRIPTS
SettingsSection1:NewButton("Rejoin Game", "Just Rejoin Game", function()
    local ts = game:GetService("TeleportService")
    local p = game:GetService("Players").LocalPlayer
    ts:Teleport(game.PlaceId, p)
end)
SettingsSection1:NewKeybind("Change Toggle Key", "Change Toggle Key", Enum.KeyCode.RightShift, function()
	Library:ToggleUI()
end)
else
    print("Buy Access From !KrystekYT#8687")
end