
-- I KNOW THERE IS SOURCE BUT OBFUSCATOR IS BROKEN AND THAT GAME TOO WITH INGAME FUNCTIONS TO BYPASS
local HwidCheck = tostring(game:GetService("RbxAnalyticsService"):GetClientId())
local hwidListPosPet = loadstring(game:HttpGet("https://raw.githubusercontent.com/KrystekYTpv/AJOVFusfvboasjfbosfpoazsfnasfafa/main/hwidListPosPet.lua"))()

if table.find(hwidListPosPet,HwidCheck) then

-- LIBRARY
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Pet Posse By KSD", "DarkTheme")

if LoopInsta then
    getgenv().LoopInsta:Disconnect()
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
--local AutoFullSection1 = FarmingTab:NewSection("FULL AUTOMATIC")
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



function CheckArena()
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
        
        if ButtonNumber == nil then
            return wait()
        else
            if not workspace.__THINGS.Coins[tostring(ArenaInstaBreak)]:FindFirstChild(tostring(ButtonNumber)) or not workspace.__THINGS.Coins[tostring(ArenaInstaBreak)][tostring(ButtonNumber)]:FindFirstChild("Coin") then
                getgenv().ButtonNumber = nil
            else
                local t1 = workspace.__THINGS.Coins[tostring(ArenaInstaBreak)][tostring(ButtonNumber)].Coin
                local t2 = workspace.__THINGS.Coins[tostring(ArenaInstaBreak)][tostring(ButtonNumber)]
                workspace.__THINGS.__REMOTES.clickedButton:FireServer(t1, t2)
            end
        end
    end
end



-- FARMING SCRIPTS
--AutoFullSection1:NewToggle("Auto Rebirth/Farm/Insta", "Special Easy function", function(autofullfarm)
--    if autofullfarm == true then
--        getgenv().AutomaticFarmFull = true
--        coroutine.resume(coroutine.create(function() FullToggleUpdateOn() end))
--    else
--        getgenv().AutomaticFarmFull = false
--        coroutine.resume(coroutine.create(function() FullToggleUpdateOff() end))
--    end
--    
--    while wait(1) and getgenv().AutomaticFarmFull == true do
--        local MaxLevel = game:GetService("Players").LocalPlayer.PlayerGui.Notifications.Level.Text
--        if MaxLevel == "MAX LEVEL!" then
--            coroutine.resume(coroutine.create(function() RebirthFarmingToggleUpdate() end))
--        else
--            coroutine.resume(coroutine.create(function() ContinueFarmingToggleUpdate() end))
--        end
--    end
--end)


function InstaBRAKE()
    if getgenv().InstaDestroy1 == true then
        getgenv().LoopInsta = game:GetService"RunService".RenderStepped:Connect(function()
            if ButtonNumber == nil then
                return wait()
            else
                if not workspace.__THINGS.Coins[tostring(ArenaInstaBreak)]:FindFirstChild(tostring(ButtonNumber)) or not workspace.__THINGS.Coins[tostring(ArenaInstaBreak)][tostring(ButtonNumber)]:FindFirstChild("Coin") then
                    getgenv().ButtonNumber = nil
                else
                    local t1 = workspace.__THINGS.Coins[tostring(ArenaInstaBreak)][tostring(ButtonNumber)].Coin
                    local t2 = workspace.__THINGS.Coins[tostring(ArenaInstaBreak)][tostring(ButtonNumber)]
                    workspace.__THINGS.__REMOTES.clickedButton:FireServer(t1, t2)
                end
            end
        end)
    end
end

InstabreakSection1:NewDropdown("Select Insta Mode", "Select Insta mode to farm", {"One", "All", "Actual Coins"}, function(instaoption)
    if instaoption then
        getgenv().InstaSelectedOption = instaoption
    end
end)


getgenv().InstaDestroything = false
local InstaFarming = InstabreakSection1:NewToggle("Instant Destroy", "Super Fast Farming", function(instadestroy)
    getgenv().InstaDestroything = instadestroy
    if instadestroy == true then
        getgenv().InstaDestroy1 = true
    else
        getgenv().LoopInsta:Disconnect()
        getgenv().InstaDestroy1 = false
    end

    local ListaButton = game:GetService("Players").LocalPlayer.PlayerGui.Buttons
    ListaButton.ChildAdded:connect(function(button)
        coroutine.resume(coroutine.create(function() CheckArena() end))
        getgenv().ButtonNumber = button
    end)
    
    if getgenv().InstaSelectedOption == "All" then
        while task.wait() and getgenv().InstaDestroy1 == true do
            for _,v in pairs(game:GetService("Workspace")["__THINGS"].Coins[tostring(ArenaInstaBreak)]:GetChildren()) do
                if v:FindFirstChild('Coin') then
                    local args = {
                        [1] = workspace["__THINGS"].Coins[tostring(ArenaInstaBreak)][v.Name].Coin,
                        [2] = workspace["__THINGS"].Coins[tostring(ArenaInstaBreak)][v.Name],
                    }
                    workspace["__THINGS"]["__REMOTES"].clickedButton:FireServer(unpack(args))   
                    task.wait()
                end
            end
        end
    
    elseif getgenv().InstaSelectedOption == "One" then
        if getgenv().InstaDestroy1 == true then
            getgenv().LoopInsta = game:GetService"RunService".RenderStepped:Connect(function()
                if ButtonNumber == nil then
                    return wait()
                else
                    if not workspace.__THINGS.Coins[tostring(ArenaInstaBreak)]:FindFirstChild(tostring(ButtonNumber)) or not workspace.__THINGS.Coins[tostring(ArenaInstaBreak)][tostring(ButtonNumber)]:FindFirstChild("Coin") then
                        getgenv().ButtonNumber = nil
                    else
                        local t1 = workspace.__THINGS.Coins[tostring(ArenaInstaBreak)][tostring(ButtonNumber)].Coin
                        local t2 = workspace.__THINGS.Coins[tostring(ArenaInstaBreak)][tostring(ButtonNumber)]
                        workspace.__THINGS.__REMOTES.clickedButton:FireServer(t1, t2)
                    end
                end
            end)
        end
        
    elseif getgenv().InstaSelectedOption == "Actual Coins" then
        while task.wait() and getgenv().InstaDestroy1 == true do
            for _,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Buttons:GetChildren()) do
                local args = {
                    [1] = workspace["__THINGS"].Coins[tostring(ArenaInstaBreak)][v.Name].Coin,
                    [2] = workspace["__THINGS"].Coins[tostring(ArenaInstaBreak)][v.Name],
                }
                workspace["__THINGS"]["__REMOTES"].clickedButton:FireServer(unpack(args))   
                task.wait()
            end
        end
    end
end)



FarmingSection1:NewDropdown("Select Farm Mode", "Select Farm mode to farm", {"Normal", "Multi Target (In Progress)"}, function(farmoption)
    if farmoption then
        getgenv().FarmSelectedOption = farmoption
    end
end)



getgenv().autofarmnearestthing = false
local FarmingToggle = FarmingSection1:NewToggle("Autofarm", "AutoFarming Coins and Exp", function(autofarmnearest)
    getgenv().autofarmnearestthing = autofarmnearest
    if autofarmnearest == true then
        getgenv().AutoFarmNearest1 = true
    else
        getgenv().AutoFarmNearest1 = false
    end
    
    if getgenv().FarmSelectedOption == "Normal" then
        while task.wait(0.5) and getgenv().AutoFarmNearest1 == true do
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
    elseif getgenv().FarmSelectedOption == "Multi Target" then
        
    end
end)


getgenv().autorebirthbetterthing = false
local FarmingRebirth = RebirthSection1:NewToggle("Auto Rebirth", "Auto Rebirth", function(autorebirthbetter)
    getgenv().autorebirthbetterthing = autorebirthbetter
    if autorebirthbetter == true then
        getgenv().AutoRebirthBetter1 = true
    else
        getgenv().AutoRebirthBetter1 = false
    end
    
    while wait(1) and getgenv().AutoRebirthBetter1 do
        local MaxLevel = game:GetService("Players").LocalPlayer.PlayerGui.Notifications.Level.Text
        if MaxLevel == "MAX LEVEL!" then
            repeat
            wait(0.5)
            getgenv().InstaDestroy1 = false
            getgenv().AutoFarmNearest1 = false
            coroutine.resume(coroutine.create(function() FarmingToggle:UpdateToggle("Autofarm", false) end))
            coroutine.resume(coroutine.create(function() InstaFarming:UpdateToggle("Instant Destroy", false) end))
            until getgenv().InstaDestroy1 == false and getgenv().AutoFarmNearest1 == false
            wait(1.5)
            game:GetService("Workspace").__THINGS.__REMOTES.rebirth:InvokeServer(game:GetService("Players").LocalPlayer)
            game:GetService("Workspace").__THINGS.__REMOTES.rebirth:InvokeServer(game:GetService("Players").LocalPlayer)
            game:GetService("Workspace").__THINGS.__REMOTES.rebirth:InvokeServer(game:GetService("Players").LocalPlayer)
        else
            repeat
            wait(0.5)
            getgenv().InstaDestroy1 = false
            getgenv().AutoFarmNearest1 = false
            coroutine.resume(coroutine.create(function() FarmingToggle:UpdateToggle("Autofarm", true) end))
            coroutine.resume(coroutine.create(function() InstaFarming:UpdateToggle("Instant Destroy", true) end))
            until getgenv().InstaDestroy1 == true and getgenv().AutoFarmNearest1 == true
        end
    end
end)

-- FUNKCJE FULL AUTO
function RebirthOsobnyOn()
    coroutine.resume(coroutine.create(function() FarmingToggle:UpdateToggle("Autofarm", false) end))
    coroutine.resume(coroutine.create(function() FarmingRebirth:UpdateToggle("Auto Rebirth", true) end))
    coroutine.resume(coroutine.create(function() InstaFarming:UpdateToggle("Instant Destroy", false) end))
end

function FullToggleUpdateOn()
    coroutine.resume(coroutine.create(function() FarmingToggle:UpdateToggle("Autofarm", true) end))
    coroutine.resume(coroutine.create(function() FarmingRebirth:UpdateToggle("Auto Rebirth", true) end))
    coroutine.resume(coroutine.create(function() InstaFarming:UpdateToggle("Instant Destroy", true) end))
end

function FullToggleUpdateOff()
    coroutine.resume(coroutine.create(function() FarmingToggle:UpdateToggle("Autofarm", false) end))
    coroutine.resume(coroutine.create(function() InstaFarming:UpdateToggle("Instant Destroy", false) end))
    coroutine.resume(coroutine.create(function() FarmingRebirth:UpdateToggle("Auto Rebirth", false) end))
end

function ContinueFarmingToggleUpdate()
    coroutine.resume(coroutine.create(function() InstaFarming:UpdateToggle("Instant Destroy", true) end))
    coroutine.resume(coroutine.create(function() FarmingToggle:UpdateToggle("Autofarm", true) end))
end

function RebirthFarmingToggleUpdate()
    coroutine.resume(coroutine.create(function() InstaFarming:UpdateToggle("Instant Destroy", false) end))
    coroutine.resume(coroutine.create(function() FarmingToggle:UpdateToggle("Autofarm", false) end))
    coroutine.resume(coroutine.create(function() FarmingRebirth:UpdateToggle("Auto Rebirth", true) end))
end


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
                    coroutine.resume(coroutine.create(function() InstaFarming:UpdateToggle("Instant Destroy", false) end))
                    coroutine.resume(coroutine.create(function() FarmingToggle:UpdateToggle("Autofarm", false) end))
                    coroutine.resume(coroutine.create(function() FarmingRebirth:UpdateToggle("Auto Rebirth", false) end))
                    wait(2)
                    workspace.__THINGS.__REMOTES.claimGift:InvokeServer(tostring(v.Parent.Parent))
                    wait(1)
                    coroutine.resume(coroutine.create(function() InstaFarming:UpdateToggle("Instant Destroy", true) end))
                    coroutine.resume(coroutine.create(function() FarmingToggle:UpdateToggle("Autofarm", true) end))
                    coroutine.resume(coroutine.create(function() FarmingRebirth:UpdateToggle("Auto Rebirth", true) end))
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
    if GraczName == "KrystekYT" or GraczName == "KnGraphics" or GraczName == "Restio2018" then
        for i,v in pairs(game:GetService("Workspace")["__MAP"].Areas.SpawnWorld:GetDescendants()) do
            if v:IsA("TextLabel") and v.Parent:IsA("SurfaceGui") then
        		print(v.Text)
        	end
        end
    end
end)

CodesSection1:NewButton("Check Code Sea", "", function()
    if GraczName == "KrystekYT" or GraczName == "KnGraphics" or GraczName == "Restio2018" then
        for i,v in pairs(game:GetService("Workspace")["__MAP"].Areas.SeaWorld:GetDescendants()) do
            if v:IsA("TextLabel") and v.Parent:IsA("SurfaceGui") then
        		print(v.Text)
        	end
        end
    end
end)

CodesSection2:NewButton("Check Code Spawn and Redeem", "", function()
    if GraczName == "KrystekYT" or GraczName == "KnGraphics" or GraczName == "Restio2018" then
        for i,v in pairs(game:GetService("Workspace")["__MAP"].Areas.SpawnWorld:GetDescendants()) do
            if v:IsA("TextLabel") and v.Parent:IsA("SurfaceGui") then
        		print(v.Text)
        		workspace.__THINGS.__REMOTES.redeemCode:InvokeServer(v.Text)
        	end
        end
    end
end)

CodesSection2:NewButton("Check Code Sea and Redeem", "", function()
    if GraczName == "KrystekYT" or GraczName == "KnGraphics" or GraczName == "Restio2018" then
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