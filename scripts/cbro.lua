local map = game.Workspace.Map

local jToggle = -1

local player = game:GetService("Players").LocalPlayer
local Mouse = player:GetMouse()

Mouse.KeyDown:connect(function(key)
	if key == "i" then
		jToggle = -jToggle
		
		print(jToggle)
		
		if jToggle == 1 then
			for i,v in pairs(map:GetDescendants()) do
				local pos = Instance.new("PositionValue", v)
				pos.Value = v.Position
				v.Position = Vector3.new(0, 0, 0)
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
		else if jToggle == -1 then
			for i,v in pairs(map:GetDescendants()) do
				if v:FindFirstChild("PositionValue") then
					v.Position = v:FindFirstChild("PositionValue").Value
				end
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
		end
	end
end)