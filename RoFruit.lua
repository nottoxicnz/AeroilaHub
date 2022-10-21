local player = game:GetService("Players").LocalPlayer
local ISLANDS = game:GetService("Workspace").SpawnLocation:GetChildren()

local islands = {}
local bosss = {"Sandia kimistuu [Lv.200]", "??? [Lv.250]", "Thor [Lv.350]", "Enma [Lv.400]", "Ryuma [Lv.500]", "Shank [Lv.900]", "Mihawk [Lv.1000]"}
local bosstext = ""
local mobs = {}
local mobtext = ""
local islandtext = ""

getgenv().mob = nil
getgenv().autofarmmobs = false

for i,v in pairs(ISLANDS) do
	table.insert(islands, v.Name)
end

for _,v in pairs(game:GetService("Workspace").Mob:GetChildren()) do
	insert = true
	for _,v2 in pairs(mobs) do if v2 == v.Name then insert = false end end
	if insert then table.insert(mobs, v.Name) end
end

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Aeroila Hub | RO FRUITS", HidePremium = false, IntroText = "Aeroila Hub | RO FRUITS", SaveConfig = false, ConfigFolder = "OrionTest"})
local FarmTab = Window:MakeTab({
	Name = "Auto Farm",
	Icon = "rbxassetid://9870325530",
	PremiumOnly = false
})
local PlayerTab = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://9870325530",
	PremiumOnly = false
})
local IslandTab = Window:MakeTab({
	Name = "Island TP",
	Icon = "rbxassetid://9870325530",
	PremiumOnly = false
})
local MiscTab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://9870325530",
	PremiumOnly = false
})
local FarmSection = FarmTab:AddSection({
	Name = "                                      AUTO FARM"
})
local mobdropdown = FarmTab:AddDropdown({
	Name = "Select Mob",
	Default = mobtext,
	Options = mobs,
	Callback = function(Value)
		getgenv().mob = Value
	end    
})
FarmTab:AddToggle({
	Name = "Auto Farm",
	Default = false,
	Callback = function(Value)
        getgenv().autofarmmobs = Value
	end    
})
FarmTab:AddToggle({
	Name = "Auto Attack",
	Default = false,
	Callback = function(Value)
        getgenv().autoAttack = Value
	end    
})
local IslandSection = IslandTab:AddSection({
	Name = "                                      ISLAND TELEPORTS"
})
local islanddropdown = IslandTab:AddDropdown({
	Name = "Select Island",
	Default = islandtext,
	Options = islands,
	Callback = function(Value)
		for i,v in pairs(ISLANDS) do
			if v.Name == Value then
				for i,v in pairs(v:GetChildren()) do
					if v:IsA("Part") and v.Name == "Loc" then
						game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = v.CFrame
					end
				end
			end
		end
	end
})
local PlayerSection = PlayerTab:AddSection({
	Name = "                                       PLAYER STUFF"
})
PlayerTab:AddSlider({
	Name = "WalkSpeed Slider",
	Min = 0,
	Max = 500,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = " ",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})
local PlayerSection = PlayerTab:AddSection({
	Name = "                                       DEVIL FRUIT SNIPER"
})
PlayerTab:AddToggle({
	Name = "Auto Farm Devil Fruits",
	Default = false,
	Callback = function(Value)
        getgenv().autograbdevilfruit = Value
	end    
})
MiscTab:AddButton({
	Name = "Claim Codes!",
	Callback = function()
game:GetService("ReplicatedStorage").Code:FireServer("HalloweenUpdate")
wait()
game:GetService("ReplicatedStorage").Code:FireServer("2MVisits")
wait()
game:GetService("ReplicatedStorage").Code:FireServer("ZerosDevsTV")
wait()
game:GetService("ReplicatedStorage").Code:FireServer("DISCORD")
wait()
game:GetService("ReplicatedStorage").Code:FireServer("NEW")
wait()
game:GetService("ReplicatedStorage").Code:FireServer("SORRYBUGS")
wait()
game:GetService("ReplicatedStorage").Code:FireServer("EXTRA")
end    
})
task.spawn(function ()
	while task.wait() do
		if getgenv().autograbdevilfruit then
			for i,v in pairs(game:GetService("Workspace").Spawner.SpawnedDFS:GetChildren()) do
				if v:IsA("Tool") and v:FindFirstChild("Handle") and v.Parent then
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
				end
			end
		end
	end
end)

task.spawn(function ()
		while task.wait() do
			if  getgenv().autofarmmobs then
				for i,v in pairs(game:GetService("Workspace").Mob:GetChildren()) do
					if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0  and v.Name == getgenv().mob then
					repeat 
						game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 7)
						wait(0.7)
						v:WaitForChild('Humanoid').Health = 0
						task.wait()
					until v.Humanoid.Health <= 0 or getgenv().autofarmmobs == false
				end
			end
		end
	end
end)
task.spawn(function ()
	while task.wait() do
		if getgenv().autoAttack then
			game:GetService("ReplicatedStorage").Document.Combat.Combat:FireServer()
		if getgenv().autoAttack == false then return end
	end
end
end)
