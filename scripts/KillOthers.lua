local players = game:GetService("Players"):GetPlayers()

local myCFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame

local run = true

game:GetService("UserInputService").InputBegan:connect(function(i, g)
	if i.KeyCode == Enum.KeyCode.End then
		run = false
	end
end)

while true do
	wait(0.001)
	if run then
		for i,v in pairs(players) do
			if v.Name ~= game:GetService("Players").LocalPlayer.Character.Name then
				step = (math.pi*2) / #players
				x = math.sin(step * i) * #players * 0
				y = math.cos(step * i) * #players * 0
				players[i].Character.HumanoidRootPart.CFrame = CFrame.new(myCFrame.X + x, myCFrame.Y, myCFrame.Z + y)
				players[i].Character.HumanoidRootPart.Anchored = true
			end
		end
		players = game:GetService("Players"):GetPlayers()
	else
		for i,v in pairs(players) do
			if v.Name ~= game:GetService("Players").LocalPlayer.Character.Name then
				players[i].Character.HumanoidRootPart.Anchored = false
			end
		end
	end
end
