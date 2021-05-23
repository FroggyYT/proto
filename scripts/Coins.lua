local roses = game.Workspace.Interactions.Rose:GetChildren()
local gia = game.Workspace.Interactions.QuestGivers.Gia
local giaDetector = gia.ChatSystem.ClickDetector

while true do
	wait()
	click_detector(giaDetector, 15)
	for i,v in pairs(roses) do
		wait()
		click_detector(v.ClickDetector, 15)
	end
end
