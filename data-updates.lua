-- Better subgroup placement with SchallCircuitGroup
if mods["SchallCircuitGroup"] then
  data.raw["rail-planner"]["active-rail"].subgroup = "circuit-input"
  data.raw.item["rail-combinator"].subgroup = "circuit-input"
end

-- Give the active rail a red tint to better distinguish it from normal rails.
local active_rail = data.raw["rail-planner"]["active-rail"]
local icon_to_use = active_rail.icon
if not icon_to_use and active_rail.icons and active_rail.icons[1] and active_rail.icons[1].icon then
  icon_to_use = active_rail.icons[1].icon
end
active_rail.icons = {
  {
    icon = icon_to_use,
    tint = {r = 1, g = 0, b = 0, a = 0.5}
  },
}
