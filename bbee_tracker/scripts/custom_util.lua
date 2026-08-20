-- Implement custom logic functions here

function checkGoal()
	local cur_extreme_clear_count = Tracker:ProviderCountForCode("ex_clear")
	return cur_extreme_clear_count >= Tracker:FindObjectForCode("extreme_80_clears_needed").AcquiredCount
end

function checkStageAccess(prototype, stage)
	local item = Tracker:FindObjectForCode(prototype .. "_stage_" .. stage)
	return item.CurrentStage+1 >= tonumber(stage)
end

next_update = 0.01
function updateProtoCheckCount(elapsed)
	if next_update < 0 then
		return
	end
	next_update = next_update - elapsed
	if next_update <= 0 then
		next_update = -1.0
		updateLocationCount(code)
	end
end

function setNextProtoCheckTime()
	next_update = 0.5
end

-- count how many checks are in logic for this prototype
function updateLocationCount(proto)
	local proto_check_count = {}
    for l, v in pairs(LOCATION_TO_ID_MAP) do
		local code = getProtoCodeName(l:match("^(.-)/"))
		local loc = Tracker:FindObjectForCode("@" .. l)
		if loc.AccessibilityLevel == AccessibilityLevel.Normal then
			proto_check_count[code] = (proto_check_count[code] or 0) + loc.AvailableChestCount
		end
    end
	for i, p in ipairs(proto_list) do
		local code = getProtoCodeName(p)
		-- print(code)
		local count = (proto_check_count[code] or 0)
		local proto_obj = Tracker:FindObjectForCode(code)
		if proto_obj ~= nil then
			if proto_obj.Active then
				proto_obj:SetOverlay(tostring(count))
				proto_obj:SetOverlayBackground("#88000000")
				if count == 0 then
					proto_obj:SetOverlayColor("#cf1010")
				else
					proto_obj:SetOverlayColor("#20ff20")
				end
			else
				proto_obj:SetOverlay("")
			end
		end
	end
end

ScriptHost:AddOnFrameHandler("update_proto_check_count", updateProtoCheckCount)
ScriptHost:AddWatchForCode("update_proto_check_count_i", "prog", setNextProtoCheckTime)