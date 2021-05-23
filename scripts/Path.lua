local player = game:GetService("Players").LocalPlayer
local Mouse = player:GetMouse()

local fToggle = -1

Mouse.KeyDown:connect(function(key)
	if key == "n" then
		fToggle = -fToggle
		while fToggle == 1 do
			wait(0.1)
			local paths = game.Workspace:FindFirstChild("PATHS")
			if not paths then
				Instance.new("Folder", game.Workspace).Name = "PATHS"
			end
			
			for i,v in pairs(paths:GetChildren()) do
				v.Age.Value = v.Age.Value+1
				if v.Age.Value > 3 then
					v:Destroy()
				end
			end
			
			local p = Instance.new("Part", paths)
			Instance.new("NumberValue", p).Name = "Age"
			p.Size = Vector3.new(5, 1, 5)
			p.Anchored = true
			local i = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
			local hip = game:GetService("Players").LocalPlayer.Character.Humanoid.HipHeight
			p.Position = Vector3.new(i.x, i.y-2.8, i.z)
		end
	end
end)