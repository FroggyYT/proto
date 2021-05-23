local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()

local deletedParts = Instance.new("Folder", game.Workspace)
deletedParts.Name = "DELETED_PARTS"

local index = 1

Mouse.Button1Down:connect(function()
	if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
	if not Mouse.Target then return end
	local objHolder = Instance.new("ObjectValue", deletedParts)
	objHolder.Value = Mouse.Target
	objHolder.Name = ""..index
	local objPos = Instance.new("Vector3Value", objHolder)
	objPos.Value = Mouse.Target.Position
	objPos.Name = "pos"
	Mouse.Target.Position = Vector3.new(100000000, 100000000, 100000000)
	
	index = index + 1
end)

Mouse.Button2Down:connect(function()
	if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
	deletedParts:GetChildren()[#deletedParts:GetChildren()].Value.Position = deletedParts:GetChildren()[#deletedParts:GetChildren()].pos.Value
	deletedParts:GetChildren()[#deletedParts:GetChildren()]:Destroy()
end)

local h = Instance.new("Part", game.Workspace)
local j = Instance.new("ObjectValue", deletedParts)
j.Value = h
j.Name = "0"
local k = Instance.new("Vector3Value", j)
k.Name = "pos"
k.Value = Vector3.new(100000000, 100000000, 100000000)