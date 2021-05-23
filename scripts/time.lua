local lighting = game.Lighting
local clockTime = 0

clockTime = lighting.ClockTime

-- 6 AM = Morning
-- 7 AM = Breakfast
-- 18 = Dinner
-- 20 8PM = NIGHT

function clockTimeTo12Hr(cTime)
	local twelveHr
	local pmAm = "AM"
	local hr = math.floor(cTime)
	local minute = ""
	
	if hr > 12 then
		pmAm = "PM"
		twelveHr = cTime - 12
	else
		twelveHr = cTime
		pmAm = "AM"
	end
	
	local minu = twelveHr - math.floor(twelveHr)
	
	if (math.floor(twelveHr) == 0) then
		twelveHr = 12 + (minu)
	end
	
	minute = tostring(math.floor(minu * 60))
	
	if (#minute < 2) then
		minute = "0" .. minute
	end
	
	return tostring(math.floor(twelveHr)) .. ":" .. minute .. pmAm
end

print(clockTimeTo12Hr(clockTime))

function clockMin(cTime)
	
end




local ClockMenu = Instance.new("ScreenGui")
local ClockText = Instance.new("TextLabel")

ClockMenu.Name = "ClockMenu"
ClockMenu.Parent = game.CoreGui

ClockText.Name = "ClockText"
ClockText.Parent = ClockMenu
ClockText.Size = UDim2.new(0, 100, 0, 50)
ClockText.Position = UDim2.new(0, 0, 0.95, 0)

while true do
	ClockText.Text = clockTimeTo12Hr(lighting.ClockTime)
	wait(0.2)
end