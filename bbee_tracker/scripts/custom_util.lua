-- Implement custom logic functions here

function checkGoal()
	local cur_extreme_clear_count = Tracker:ProviderCountForCode("ex_clear")
	return cur_extreme_clear_count >= Tracker:FindObjectForCode("extreme_80_clears_needed").AcquiredCount
end

function checkStageAccess(prototype, stage)
	local item = Tracker:FindObjectForCode(prototype .. "_stage_" .. stage)
	return item.CurrentStage+1 >= tonumber(stage)
end