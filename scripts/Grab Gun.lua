local gunDropped = false
local gun

while true do
	wait(0.1)
	for i,v in pairs(game.Workspace:GetDescendants()) do
		if v.Name == "GunDrop" then
			gunDropped = true
			gun = v
		end
	end
	
	if gunDropped then
		wait(1)
		local pos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = gun.CFrame
		wait(0.2)
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = pos
	end
	
	gunDropped = false
end