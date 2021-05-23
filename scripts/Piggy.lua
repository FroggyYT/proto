-- Farewell Infortality.
-- Version: 2.82
-- Instances:
local PiggyMenu = Instance.new("ScreenGui")
local Items = Instance.new("Frame")
local ESP = Instance.new("TextButton")
local ToggleMenu = Instance.new("TextButton")
--Properties:
PiggyMenu.Name = "PiggyMenu"
PiggyMenu.Parent = game.CoreGui

Items.Name = "Items"
Items.Parent = PiggyMenu
Items.BackgroundColor3 = Color3.new(0, 0, 0)
Items.BackgroundTransparency = 0.89999997615814
Items.BorderSizePixel = 0
Items.Size = UDim2.new(0, 100, 0, 681)
Items.Visible = false

ESP.Name = "ESP"
ESP.Parent = Items
ESP.BackgroundColor3 = Color3.new(0, 0, 0)
ESP.BackgroundTransparency = 0.30000001192093
ESP.BorderSizePixel = 0
ESP.Position = UDim2.new(-0.00420856476, 0, -2.98023224e-08, 0)
ESP.Size = UDim2.new(0, 100, 0, 25)
ESP.Font = Enum.Font.Arial
ESP.Text = "ESP [OFF]"
ESP.TextColor3 = Color3.new(1, 1, 1)
ESP.TextScaled = true
ESP.TextSize = 14
ESP.TextWrapped = true

ToggleMenu.Name = "ToggleMenu"
ToggleMenu.Parent = PiggyMenu
ToggleMenu.BackgroundColor3 = Color3.new(0, 0, 0)
ToggleMenu.BorderSizePixel = 0
ToggleMenu.Position = UDim2.new(0, 0, 0.964589238, 0)
ToggleMenu.Size = UDim2.new(0, 100, 0, 25)
ToggleMenu.Font = Enum.Font.ArialBold
ToggleMenu.Text = "Open"
ToggleMenu.TextColor3 = Color3.new(1, 1, 1)
ToggleMenu.TextScaled = true
ToggleMenu.TextSize = 14
ToggleMenu.TextWrapped = true
-- Scripts:

faces = {"Front","Back","Bottom","Left","Right","Top"}

function actualESP(obj, r, g ,b)
    for i=0,5 do
        local surface = Instance.new("SurfaceGui", obj)
        surface.Face = Enum.NormalId[faces[i+1]]
        surface.AlwaysOnTop = true
		surface.Name = "FINDER"
 
        local frame = Instance.new("Frame",surface)
        frame.Size = UDim2.new(1,0,1,0)
        frame.BorderSizePixel = 0                                              
        frame.BackgroundTransparency = 0
		frame.BackgroundColor3 = Color3.new(r,g,b)                        
    end
end

local buttonDistance = 0.037

local toggled = false

ToggleMenu.MouseButton1Click:Connect(function()
	if toggled then
		Items.Visible = false
		toggled = false
		ToggleMenu.Text = "Open"
	else
		Items.Visible = true
		toggled = true
		ToggleMenu.Text = "Close"
	end
end)

function refresh()

	for i,v in pairs(Items:GetChildren()) do
		if v.Name == "Item" then
			v:Destroy()
		end
	end

	local items = {}
	
	for i,v in pairs(game.Workspace:GetChildren()) do
		if v.ClassName == "Folder" then
			if v.Name ~= "GameFolder" and v.Name ~= "PeppaNPC" and v.Name ~= "LoadedMap" then
				items = v:GetChildren()
			end
		end
	end
	
	local h = 0
	
	for i,item in pairs(items) do
		if item:FindFirstChild("Mesh") and item.Mesh.MeshId == "rbxassetid://470962113" then
			print("Trap")
		else
			h = h + 1
			print(item)
			item.ClickDetector.MaxActivationDistance = 15
			item.Transparency = 0
			local b = ESP:Clone()
			b.Parent = Items
			b.Position = UDim2.new(-0.004, 0, h*0.039, 0)
			b.Text = item.Name
			b.Name = "Item"
			b.MouseButton1Click:Connect(function()
				local dest = item.CFrame
				local prev = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
				--game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = dest
				wait(0.1)
				click_detector(item.ClickDetector, 5)
				wait(0.1)
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = prev
				--game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = false
			end)
		end
	end
	
	
end

local espToggle = -1

function toggleESP()
	espToggle = -espToggle
	
	if espToggle == 1 then
		ESP.Text = "ESP [ON]"
	else
		ESP.Text = "ESP [OFF]"
	end
end

function espUpdate()
	if espToggle == 1 then
		local map = game.Workspace
		for i,v in pairs(map:GetDescendants()) do
			while v:FindFirstChild("FINDER") do
				v:FindFirstChild("FINDER"):Destroy()
			end
			if v.ClassName == "StringValue" then
				local espPart
				if v.Parent.ClassName == "Model" then
					espPart = v.Parent:FindFirstChildWhichIsA("Part")
				else
					espPart = v.Parent
				end
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild(v.Value) then
					actualESP(espPart, 255, 0, 0)
				end
			end
		end
	else
		local map = game.Workspace
		for i,v in pairs(map:GetDescendants()) do
			while v:FindFirstChild("FINDER") do
				v:FindFirstChild("FINDER"):Destroy()
			end
		end
	end
end

refresh()

ESP.MouseButton1Click:Connect(toggleESP)

while true do
	wait(1)
	refresh()
	espUpdate()
end
