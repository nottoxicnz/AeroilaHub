-- // VARIABLES //
local player = game.Players.LocalPlayer
local hrp = player.Character:WaitForChild("HumanoidRootPart")

-- // TABLES //
local quests = {"Thief Quest", "Buff Thief Quest", "Desert Thief Quest", "Desert Swordsmand Quest", "Monkey Quest", "Buff Monkey Quest", "Blizzard Bandit Quest", "Yeti Quest", "Mink Quest", "Pro Mink Quest"}
local islands = {"Starter Island", "Desert", "Jungle Island", "Hima Island", "Island of Zou","Cursed Island"}
local mobs = {}

-- // GLOBAL //
getgenv().mob = nil
getgenv().quest = nil

-- // ADD MOBS TO DROPDOWN //
for i,v in pairs(game:GetService("Workspace").World.Live:GetChildren()) do
    if v:FindFirstChild('HumanoidRootPart') then
        insert = true 
        for i,v2 in pairs(mobs) do if v2 == v.Name then insert = false end end
        if insert then table.insert(mobs, v.Name)
    end
end
-- // INSTANT PROXIMITY PROMPT / /
game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
    prompt.HoldDuration = 0
 end)

-- // ANTI AFK //
for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v:Disable()
end

-- // FUNCTIONS //
            function collectQuest()
            while task.wait(0.3) do
                if getgenv().autograbquest == true then
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
                    player.PlayerGui.MainGui.QuestBar.Visible == true then
                    getgenv().autograbquest = false
                    end
                end
            end
        end
    end
end
-- // UI LIBRARY  //
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/lolpoppyus/Roblox-Lua/master/Pop%20UI%20Lib", true))()
local FarmTab = library:Tab("Auto Farm")
local QuestTab = library:Tab("Quest")
local PlayerTab = library:Tab("Players")
FarmTab:Label("Auto Farm")
QuestTab:Label("Auto Quest")
PlayerTab:Label("Player Stuff")


local update = FarmTab:Dropdown("Choose Mobs", mobs, function(arg)
    getgenv().mob = arg
end)

FarmTab:Toggle("Auto Farm Mobs", function(v)
	getgenv().autofarmmobs = v
    while wait() do
        if getgenv().autofarmmobs == false then return end
        if getgenv().mob == nil then
            getgenv().autofarmmobs = false 
            return 
        end
        for i,v in pairs(game:GetService("Workspace").World.Live:GetChildren()) do
            if v:FindFirstChild('HumanoidRootPart') and v:FindFirstChild("Humanoid") and v.Name == getgenv().mob then
            repeat 
                hrp.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,5)
                workspace.World.Live[player.Name]:WaitForChild("Combat").Server.RemoteEvent:FireServer("M1")
            task.wait()
            until v.Humanoid.Health <= 0
            if v.Humanoid.Health == 0 then wait(0.1) v:Destroy() break; end
            end
        end
    end
end)

FarmTab:Toggle("Insta Kill", function (v)
    getgenv().instakill = v
    while wait() do
        if getgenv().instakill == false then return end
    for i,v in pairs(game:GetService("Workspace").World.Live:GetDescendants()) do
        local Humanoid = v:FindFirstChildOfClass("Humanoid")
            if Humanoid and v:FindFirstChild("Info") and v.Info:FindFirstChild("Tags") and v.Info.Tags:FindFirstChild(player.Name) then
                Humanoid.Health = 0
            end
        end
    end
end)
-- // QUEST TAB //
local questdropdown = QuestTab:Dropdown("Get Quest",  quests, function(v)
    getgenv().quest = v
end)

QuestTab:Toggle("Auto Quest", function (v)
    getgenv().autograbquest = v
        collectQuest()
end)
-- // PLAYER TAB // 
PlayerTab:Slider("Change WalkSpeed", 0, 100, function(arg)
	player.Character.Humanoid.WalkSpeed = arg
end)
PlayerTab:Slider("Change JumpPower",  0,  100, function(arg)
	player.Character.Humanoid.JumpPower = arg
end)

while wait(1) do
    local npc = workspace.World.Live:GetChildren()
    local players = game.Players:GetPlayers()
    for i,v in pairs(npc) do
        insert = true
        for _,v2 in pairs(mobs) do if v2 == v.Name then insert = false end end
         if insert then table.insert(mobs, v.Name) end
    end
    update(mobs)
end
