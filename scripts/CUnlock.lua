local player = game.Players.LocalPlayer.Character.HumanoidRootPart
local closest = game.Workspace:FindFirstChild("Crank", true)

function dist(p1, p2)
	return (p1.Position - p2.Position).Magnitude
end

for i, v in pairs(game.Workspace:GetDescendants()) do
	if v.Name == "Crank" and dist(v, player) < dist(closest, player) then
		closest = v
	end
end

game.ReplicatedStorage.Events.Interactables:FireServer(closest.ToggleLock)