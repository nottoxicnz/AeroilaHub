-- // VARIRABLES //
local player = game.Players.LocalPlayer
local hrp = player.Character.HumanoidRootPart

-- // TABLES / DROPDOWN TEXT //
local tooltextdropdown = "Combat"
local mobtextdropdown = "  "
local selectedIsland = " "
local islands = {"Starter Island", "Desert", "Jungle Island", "Hima Island", "Island of Zou","Cursed Island", "Orange Town"}
local quests = {"Thief Quest", "Buff Thief Quest", "Desert Thief Quest", "Desert Swordsmand Quest", "Monkey Quest", "Buff Monkey Quest", "Blizzard Bandit Quest", "Yeti Quest", "Mink Quest", "Pro Mink Quest", "Pirate Quest", "Pro Pirate Quest"}
local mobs = {"Thief", "Buff Thief", "Desert Thief", "Desert Swordsman", "Monkey", "Buff Monkey", "Blizzard bandit", "Yeti", "Mink", "Pro Mink", "Pirate", "Pro Pirate"}
local tools = {}

-- // GLOBALS //
getgenv().mob = nil
getgenv().autograbquest = false
getgenv().instakill = false
getgenv().quest = nil



for i,v in pairs(player.Backpack:GetChildren()) do
        if v:IsA("Tool") then
        insert = true
        for i,v2 in pairs(tools) do if v2 == v.Name then insert = false end end
        if insert then table.insert(tools, v.Name) end
    end
end
for i,players in pairs(game.Players:GetPlayers()) do
    for i,v in pairs(mobs) do
        if v == players.Name then
            table.remove(mobs, i)
        end
    end
end
-- // ANTI AFK //
for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v:Disable()
end
-- // INSTANT PROXIMITY PROMPT / /
game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
    prompt.HoldDuration = 0
end)

-- // FUNCTION //
function IslandsTp()
    if selectedIsland == "Starter Island" then
		hrp.CFrame = CFrame.new(-23.2552795, 116.013466, 269.995972)
	elseif 
	selectedIsland == "Desert" then
		hrp.CFrame = CFrame.new(-419.57431, 117.407639, -1898.2561)
	elseif 
	selectedIsland == "Jungle Island" then
		hrp.CFrame = CFrame.new(1389.97729, 93.1349182, -1897.78186)
	elseif 
	selectedIsland == "Hima Island" then
		hrp.CFrame = CFrame.new(-2622.52173, 113.539871, -1223.94434)
	elseif
	selectedIsland == "Island of Zou" then
		hrp.CFrame = CFrame.new(-267.20636, 91.4027939, -4583.92139)
	elseif 
	selectedIsland == "Cursed Island" then
		hrp.CFrame = CFrame.new(1506.03223, 121.317871, -3511.9370)
	elseif
	selectedIsland == "Orange Town" then
		hrp.CFrame = CFrame.new(-2308.80518, 93.5842667, -4217.13232)
	end
end


local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Aeroila Hub | Pro Piece PRO MAX", HidePremium = false, IntroText = "Aeroila Hub | Pro Piece PRO MAX", SaveConfig = false, ConfigFolder = "OrionTest"})
local FarmTab = Window:MakeTab({
	Name = "Auto Farm",
	Icon = "rbxassetid://9836076474",
	PremiumOnly = false
})
local QuestTab = Window:MakeTab({
	Name = "Auto Quest",
	Icon = "rbxassetid://9836076474",
	PremiumOnly = false
})
local PlayerTab = Window:MakeTab({
	Name = "Player Stuff",
	Icon = "rbxassetid://9836076474",
	PremiumOnly = false
})
local MiscTab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://9836076474",
	PremiumOnly = false
})
local FarmSection = FarmTab:AddSection({
	Name = "                                         AUTO FARM"
})
local mobdropdown = FarmTab:AddDropdown({
	Name = "Choose mob to farm",
	Default = mobtextdropdown,
	Options = mobs,
	Callback = function(Value)
		mobtextdropdown = Value
	end    
})
FarmTab:AddToggle({
	Name = "Toggle Farm",
	Default = false,
	Callback = function(Value)
		getgenv().mob = Value
	end    
})
FarmTab:AddToggle({
	Name = "Toggle InstaKill",
	Default = false,
	Callback = function(Value)
		getgenv().instakill = Value
	end    
})
local QuestSection = QuestTab:AddSection({
	Name = "                                         AUTO QUEST"
})
local questdropdown = QuestTab:AddDropdown({
	Name = "Choose quest to farm",
	Default = questtextdropdown,
	Options = quests,
	Callback = function(Value)
		getgenv().quest = Value
	end    
})
QuestTab:AddToggle({
	Name = "Auto Quest",
	Default = false,
	Callback = function(Value)
        getgenv().autograbquest = Value
	end    
})
local PlayerSection = PlayerTab:AddSection({
	Name = "                                         PLAYER STUFF"
})
PlayerTab:AddSlider({
	Name = "WalkSpeed Slider",
	Min = 0,
	Max = 300,
	Default = 35,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = " ",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})
PlayerTab:AddSlider({
	Name = "JumpPower Slider",
	Min = 0,
	Max = 300,
	Default = 35,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = " ",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})
local PlayerSection = PlayerTab:AddSection({
	Name = "                        DEVIL FRUIT SNIPER (COMING SOON)"
})
local MiscSection = MiscTab:AddSection({
	Name = "                                         ISLAND TELEPORTS"
})
local Miscdropdown = MiscTab:AddDropdown({
	Name = "Choose Island To Teleport To",
	Default = selectedIsland,
	Options = islands,
	Callback = function(Value)
		selectedIsland = Value
	end    
})
MiscTab:AddButton({
	Name = "Teleport To Selected Island!",
	Callback = function()
      		IslandsTp()
  	end    
})
task.spawn(function ()
while task.wait() do
        if getgenv().mob then
                for i,v in pairs(workspace.World.Live:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v.Name == mobdropdown.Value then 
                    repeat
                        pcall(function()
                            player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,5)
                        end)
                        wait()
                        pcall(function()
                            workspace.World.Live[player.Name].Combat.Server.RemoteEvent:FireServer("M1")
                        end)
                    until v == nil or v.Parent == nil or not v:FindFirstChild("Humanoid") or v.Humanoid.Health <= 0 or not getgenv().mob
                end
            end
        end
    end
end)

task.spawn(function ()
    while task.wait() do
        if getgenv().instakill then
            for i,v in pairs(game:GetService("Workspace").World.Live:GetDescendants()) do
                local Humanoid = v:FindFirstChildOfClass("Humanoid")
                    if Humanoid and v:FindFirstChild("Info") and v.Info:FindFirstChild("Tags") and v.Info.Tags:FindFirstChild(player.Name) then
                    Humanoid.Health = 0
                end
            end
        end
    end
end)

task.spawn(function ()
    while task.wait(0.5) do
        if getgenv().autograbquest then
        if player.PlayerGui.MainGui.QuestBar.Visible == false then
            if getgenv().quest == "Thief Quest" then
                game:GetService("Players").LocalPlayer.PlayerGui.DialougeGui.DialogModule.Sending:FireServer({["Key"] = "GetQuest",["QuestID"] = 1})
            elseif
            getgenv().quest == "Buff Thief Quest" then
                game:GetService("Players").LocalPlayer.PlayerGui.DialougeGui.DialogModule.Sending:FireServer({["Key"] = "GetQuest",["QuestID"] = 3})
            elseif
            getgenv().quest == "Desert Thief Quest" then
                game:GetService("Players").LocalPlayer.PlayerGui.DialougeGui.DialogModule.Sending:FireServer({["Key"] = "GetQuest",["QuestID"] = 2})
            elseif
            getgenv().quest == "Desert Swordsmand Quest" then
                game:GetService("Players").LocalPlayer.PlayerGui.DialougeGui.DialogModule.Sending:FireServer({["Key"] = "GetQuest",["QuestID"] = 4})
            elseif
            getgenv().quest == "Monkey Quest" then
                    game:GetService("Players").LocalPlayer.PlayerGui.DialougeGui.DialogModule.Sending:FireServer({["Key"] = "GetQuest",["QuestID"] = 5})
            elseif
            getgenv().quest == "Buff Monkey Quest" then
                game:GetService("Players").LocalPlayer.PlayerGui.DialougeGui.DialogModule.Sending:FireServer({["Key"] = "GetQuest",["QuestID"] = 6})
            elseif
            getgenv().quest == "Blizzard Bandit Quest" then
                game:GetService("Players").LocalPlayer.PlayerGui.DialougeGui.DialogModule.Sending:FireServer({["Key"] = "GetQuest",["QuestID"] = 7})
            elseif
            getgenv().quest == "Yeti Quest" then
                game:GetService("Players").LocalPlayer.PlayerGui.DialougeGui.DialogModule.Sending:FireServer({["Key"] = "GetQuest",["QuestID"] = 8})
            elseif
            getgenv().quest == "Mink Quest" then
                game:GetService("Players").LocalPlayer.PlayerGui.DialougeGui.DialogModule.Sending:FireServer({["Key"] = "GetQuest",["QuestID"] = 9})
            elseif
            getgenv().quest == "Pro Mink Quest" then
                game:GetService("Players").LocalPlayer.PlayerGui.DialougeGui.DialogModule.Sending:FireServer({["Key"] = "GetQuest",["QuestID"] = 10})
            elseif
	    getgenv().quest == "Pirate Quest" then
		game:GetService("Players").LocalPlayer.PlayerGui.DialougeGui.DialogModule.Sending:FireServer({["Key"] = "GetQuest",["QuestID"] = 11})
	    elseif getgenv().quest == "Pro Pirate Quest" then
		game:GetService("Players").LocalPlayer.PlayerGui.DialougeGui.DialogModule.Sending:FireServer({["Key"] = "GetQuest",["QuestID"] = 12})
	    elseif
            player.PlayerGui.MainGui.QuestBar.Visible == true then
            getgenv().autograbquest = false
            end
        end
    end
end
end)
OrionLib:Init()
