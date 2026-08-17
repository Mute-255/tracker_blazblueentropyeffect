-- Implement custom logic functions here

function checkGoal()
	local cur_extreme_clear_count = Tracker:ProviderCountForCode("ex_clear")
	return cur_extreme_clear_count >= Tracker:FindObjectForCode("extreme_80_clears_needed").AcquiredCount
end

function checkStageAccess(prototype, stage)
	local item = Tracker:FindObjectForCode(prototype .. "_stage_" .. stage)
	return item.CurrentStage+1 >= tonumber(stage)
end

proto_list = { "Hibiki", "Ragna", "Noel", "Λ -No.11-", "Es", "Rachel", "Taokaka", "Jin", "Kokonoe", "Hakumen", "Mai", "Hazama", "ICEY", "Bullet", "The Prisoner", "Naoto" }

function getProtoCodeName(name)
	local code = name:lower():gsub(" ", "_")
    if name:match("^Λ") then
        code = "lambda_-no.11-"
    end
	return code
end

next_update = 0.01
function updateProtoCheckCount(elapsed)
	if next_update < 0 then
		return
	end
	next_update = next_update - elapsed
	if next_update <= 0 then
		for _, proto in ipairs(proto_list) do
			local code = getProtoCodeName(proto)
			updateLocationCount(code)
		end
		next_update = -1.0
	end
end

function setNextProtoCheckTime()
	next_update = 0.5
end

-- count how many checks are in logic for this prototype
function updateLocationCount(proto)
    local check_count = 0
    for l, v in pairs(LOCATION_TO_ID_MAP) do
        if getProtoCodeName(l:match("^(.-)/")) == proto then
            local loc = Tracker:FindObjectForCode("@" .. l)
            if loc.AccessibilityLevel == AccessibilityLevel.Normal then
                check_count = check_count + loc.AvailableChestCount
            end
        end
    end
    -- print(proto .. " - " .. proto:lower() .. ": " .. check_count)
    local proto_obj = Tracker:FindObjectForCode(proto)
    if proto_obj ~= nil then
        proto_obj:SetOverlay(tostring(check_count))
        if check_count == 0 then
            proto_obj:SetOverlayColor("#cf1010")
        else
            proto_obj:SetOverlayColor("#20ff20")
        end
    end
end

ScriptHost:AddOnFrameHandler("update_proto_check_count", updateProtoCheckCount)
ScriptHost:AddWatchForCode("update_proto_check_count_i", "*", setNextProtoCheckTime)