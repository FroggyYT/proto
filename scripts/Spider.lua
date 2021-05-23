-- Farewell Infortality.
-- Version: 2.82
-- Instances:
local PiggyMenu = Instance.new("ScreenGui")
local Items = Instance.new("Frame")
local ESP = Instance.new("TextButton")
local ToggleMenu = Instance.new("TextButton")
--Properties:
PiggyMenu.Name = "SpiderMenu"
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
ESP.Text = "ITEMS"
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

	local items = game.Workspace.Items:GetChildren()
	
	for i,item in pairs(items) do
		print(item)
		local clicker = item:FindFirstChild("ClickDetector", true)
		clicker.MaxActivationDistance = 15
		local b = ESP:Clone()
		b.Parent = Items
		b.Position = UDim2.new(-0.004, 0, i*0.039, 0)
		b.Text = item.Name
		b.Name = "Item"
		b.MouseButton1Click:Connect(function()
			local dest = item.Handle.CFrame
			local prev = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
			--game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = dest
			wait(5)
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = prev
		end)
	end
	
	
end

refresh()

while true do
	wait(1)
	refresh()
end
