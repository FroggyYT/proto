local players = game:GetService("Teams").Criminal:GetPlayers()

local myCFrame = game.Workspace.pathewise1.HumanoidRootPart.CFrame

local run = true

game:GetService("UserInputService").InputBegan:connect(function(i, g)
	if i.KeyCode == Enum.KeyCode.End then
		run = false
	end
end)

while true do
	wait(0.001)
	if run then
		for i in pairs(players) do
			step = (math.pi*2) / #players
			x = math.sin(step * i) * #players * 3
			y = math.cos(step * i) * #players * 3
			players[i].Character.HumanoidRootPart.CFrame = CFrame.new(myCFrame.X + x, myCFrame.Y, myCFrame.Z + y)
			players[i].Character.HumanoidRootPart.Anchored = true
		end
		players = game:GetService("Teams").Criminal:GetPlayers()
	else
		for i in pairs(players) do
			players[i].Character.HumanoidRootPart.Anchored = false
		end
	end
end
