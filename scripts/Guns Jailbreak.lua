local Givers = game.Workspace.Givers

local shotgun = Givers:GetChildren()[11]
local m1 = Givers:GetChildren()[12]

local plr = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart

local shotgunPos = shotgun.Position
local m1Pos = m1.Position

shotgun.Position = Vector3.new(plr.Position.X - 2, plr.Position.Y, plr.Position.Z)
m1.Position = Vector3.new(plr.Position.X + 2, plr.Position.Y, plr.Position.Z)

local shotgunBox = Instance.new("Part", shotgun)
shotgunBox.Position = shotgun.Position
local m1Box = Instance.new("Part", m1)
m1Box.Position = m1.Position

local Mouse = game:GetService("Players").LocalPlayer:GetMouse()

Mouse.KeyDown:connect(function(key)
	if key == "0" then
		shotgun.Position = shotgunPos
		m1.Position = m1Pos
		shotgunBox:destroy()
		m1Box:destroy()
	end
end)