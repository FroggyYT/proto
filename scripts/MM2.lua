local player = game:GetService("Players").LocalPlayer
local Mouse = player:GetMouse()

local qToggle = -1
local cToggle = -1
local xToggle = -1
local fToggle = -1

faces = {"Front","Back","Bottom","Left","Right","Top"}

function actualESP(obj, r, g ,b)
    for i=0,5 do
        local surface = Instance.new("SurfaceGui", obj)
        surface.Face = Enum.NormalId[faces[i+1]]
        surface.AlwaysOnTop = true
 
        local frame = Instance.new("Frame",surface)
        frame.Size = UDim2.new(1,0,1,0)
        frame.BorderSizePixel = 0                                              
        frame.BackgroundTransparency = 0
		frame.BackgroundColor3 = Color3.new(r,g,b)                        
    end
end

Mouse.KeyDown:connect(function(key)
	player.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.TextLabel.Text = key
	if key == "0" then
		player.Character.Humanoid.WalkSpeed = 32
	end
	if key == "q" then
		qToggle = -qToggle
		if qToggle == 1 then
			for i,v in pairs(game:GetService("Players"):GetChildren()) do
				local gunBackpack = v.Backpack:FindFirstChild("Gun")
				local knifeBackpack = v.Backpack:FindFirstChild("Knife")
				local gunPlayer = v.Character:FindFirstChild("Gun")
				local knifePlayer = v.Character:FindFirstChild("Knife")
				if gunBackpack or gunPlayer then
					actualESP(v.Character.HumanoidRootPart, 0, 0, 255)
				end
				if knifeBackpack or knifePlayer then
					actualESP(v.Character.HumanoidRootPart, 255, 0, 0)
				end
				if not knifeBackpack and not knifePlayer and not gunPlayer and not gunBackpack then
					actualESP(v.Character.HumanoidRootPart, 0, 255, 0)
				end
			end
		end
		if qToggle == -1 then
			for i,v in pairs(game:GetService("Players"):GetChildren()) do
				while v.Character.HumanoidRootPart:FindFirstChild("SurfaceGui") do
					v.Character.HumanoidRootPart:FindFirstChild("SurfaceGui"):destroy()
				end
			end
		end
	end
	if key == "c" then
		cToggle = -cToggle
	
		local coins = game.Workspace:FindFirstChild("CoinContainer", true)

		while cToggle == 1 do
			wait(0.1)
			for i,v in pairs(coins:GetChildren()) do
				if v.Name == "Coin_Server" then
					local esp = false
					for j,b in pairs(v:GetChildren()) do
						if b.Name == "SurfaceGui" then
							esp = true
						end
					end
					if esp == false then
						actualESP(v, 255, 255, 0)
					end
				end
				if v.Name == "CollectedCoin" then
					v:Destroy()
				end
			end
		end
		
		if cToggle == -1 then
			for i,v in pairs(coins:GetChildren()) do
				while v:FindFirstChild("SurfaceGui") do
					v:FindFirstChild("SurfaceGui"):destroy()
				end
			end
		end
	end
	
	if key == "g" then
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

Mouse.KeyUp:connect(function(key)
	player.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.TextLabel.Text = key
	if key == "0" then
		player.Character.Humanoid.WalkSpeed = 16
	end
end)