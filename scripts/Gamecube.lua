local children = game.Workspace:GetDescendants()
for i,cube in pairs(children) do
	if cube.Name == "GameCube" then
		if cube:FindFirstChildWhichIsA("Part") then
			-- print(cube)
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = cube:FindFirstChildWhichIsA("Part").CFrame
		end
	end
end