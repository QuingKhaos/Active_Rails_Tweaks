-- Better subgroup placement with SchallCircuitGroup
if mods["SchallCircuitGroup"] then
  data.raw["rail-planner"]["active-rail"].subgroup = "circuit-input"
  data.raw.item["rail-combinator"].subgroup = "circuit-input"
end

-- Give the active rail a red tint to better distinguish it from normal rails.
data.raw["rail-planner"]["active-rail"].icons = {
  {
    icon = data.raw["rail-planner"]["active-rail"].icon,
    tint = {r = 1, g = 0, b = 0, a = 0.5}
  },
}
