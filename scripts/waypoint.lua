wait(1)
local PathfindingService = game:GetService("PathfindingService")
 
local player = game.Players.LocalPlayer.Character
local destination = game.Players["12572947"].Character.HumanoidRootPart
 
local path = PathfindingService:CreatePath()
 
path:ComputeAsync(player.HumanoidRootPart.Position, destination.Position)
 
local waypoints = path:GetWaypoints()

print(#waypoints)

local waypointsfolder = Instance.new("Folder", game.Workspace)

for i,v in pairs(waypoints) do
	local part = Instance.new("Part", waypointsfolder)
	part.Shape = "Ball"
	part.Material = "Neon"
	part.Size = Vector3.new(0.6, 0.6, 0.6)
	part.Position = v.Position
	part.Anchored = true
	part.CanCollide = false
	part.Name = "Waypoint "..i


	player.Humanoid:MoveTo(v.Position)
	player.Humanoid.MoveToFinished:Wait()
end

waypointsfolder:Destroy()
