local children = game.Workspace:GetChildren()
local bugs = {}

for i,v in pairs(children) do
	if v.Name == "Bug" then
		bugs[#bugs] = v
	end
end

local bestBug = bugs[0]

for i,v in pairs(bugs) do
	local meatValue = v.Meat.Value
	if bestBug.Meat.Value < meatValue then
		bestBug = v
	end
end

game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = bestBug.CFrame

