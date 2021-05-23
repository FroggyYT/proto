local edibles = game.Workspace.Map.Edible:GetChildren()
local bushes = {}

for i,v in pairs(edibles) do
	if v.Name == "Bush" then
		bushes[#bushes] = v
	end
end

local bestBush = bushes[0]

for i,v in pairs(bushes) do
	local bushValue = v.Leaf.Value
	if bestBush.Leaf.Value < bushValue then
		bestBush = v
	end
end

game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = bestBush.CFrame
