local player = game:GetService("Players").LocalPlayer
local BV

BV = Instance.new("BodyVelocity", player.Character.HumanoidRootPart)
player.Character.Humanoid.PlatformStand = true
BV.velocity = Vector3.new(0, 0, 0)
wait()

local fruit
for i,v in pairs(game.Workspace:GetDescendants()) do
	if v.Name == "QweerialFruit" then
		if v.ClickDetector.MaxActivationDistance > 0 then
			fruit = v
		end
	end
end

local fruitPos = fruit.CFrame
local players = game:GetService("Players")
local oldPos = players.LocalPlayer.Character.HumanoidRootPart.CFrame
players.LocalPlayer.Character.HumanoidRootPart.CFrame = fruitPos
wait()
click_detector(fruit.ClickDetector, 10)
wait()
players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldPos


wait()
BV:Destroy()
player.Character.Humanoid.PlatformStand = false