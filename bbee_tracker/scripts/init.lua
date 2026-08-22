proto_list = { "Hibiki", "Ragna", "Noel", "Λ -No.11-", "Es", "Rachel", "Taokaka", "Jin", "Kokonoe", "Hakumen", "Mai", "Hazama", "ICEY", "Bullet", "The Prisoner", "Naoto" }

function getProtoCodeName(name)
	local code = name:lower():gsub(" ", "_")
    if name:match("^Λ") then
        code = "lambda_-no.11-"
    end
	return code
end

-- create the jump items dynamically
for i, p in ipairs(proto_list) do
    local c = getProtoCodeName(p)

    local jump_item = ScriptHost:CreateLuaItem()
    jump_item.Name = "Jump to " .. p .. " Tab"
    jump_item.Icon = ImageReference:FromPackRelativePath("images/items/up_arrow.png")
    jump_item.PotentialCodes = {"jump_" .. c}

    jump_item.OnLeftClickFunc = function(item)
        Tracker:UiHint("ActivateTab", p)
    end
end

Tracker:AddItems("items/items.json")
Tracker:AddItems("items/options.json")
Tracker:AddMaps("maps/maps.json")
ScriptHost:LoadScript("scripts/item_data.lua")
ScriptHost:LoadScript("scripts/util.lua")
ScriptHost:LoadScript("scripts/archipelago/archipelago.lua")
Tracker:AddLayouts("layouts/options_layout.json")
Tracker:AddLayouts("layouts/item_layout.json")
Tracker:AddLayouts("layouts/mind_crystals.json")
Tracker:AddLayouts("layouts/main_items.json")
Tracker:AddLayouts("layouts/map_layouts.json")
Tracker:AddLayouts("layouts/main.json")
ScriptHost:LoadScript("scripts/custom_util.lua")
Tracker:AddLocations("locations/hibiki.json")
Tracker:AddLocations("locations/ragna.json")
Tracker:AddLocations("locations/noel.json")
Tracker:AddLocations("locations/lambda_-no.11-.json")
Tracker:AddLocations("locations/es.json")
Tracker:AddLocations("locations/rachel.json")
Tracker:AddLocations("locations/taokaka.json")
Tracker:AddLocations("locations/jin.json")
Tracker:AddLocations("locations/kokonoe.json")
Tracker:AddLocations("locations/hakumen.json")
Tracker:AddLocations("locations/mai.json")
Tracker:AddLocations("locations/hazama.json")
Tracker:AddLocations("locations/icey.json")
Tracker:AddLocations("locations/bullet.json")
Tracker:AddLocations("locations/the_prisoner.json")
Tracker:AddLocations("locations/naoto.json")
Tracker:AddLocations("locations/-_goal_-.json")