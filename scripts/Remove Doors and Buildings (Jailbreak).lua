local WorkspaceChildren = game.Workspace:GetChildren()

for i, v in pairs(WorkspaceChildren) do
	if v.Name == "Buildings" then
		v:destroy()
	end
	if v.Name == "Doors" then
		local DoorsChildren = v:GetChildren()

		for ind, val in pairs(DoorsChildren) do
			val:destroy()
		end
	end
	if v.Name == "Banks" then
		local BanksChildren = v:GetChildren()

		for ind, val in pairs(BanksChildren) do
			local BankChildren = val:GetChildren()

			for index, value in pairs(BankChildren) do
				if value.Name == "Lasers" then
					value:destroy()
				end
			end
		end
	end
end
