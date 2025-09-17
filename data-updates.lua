-- Better subgroup placement with SchallCircuitGroup
if mods["SchallCircuitGroup"] then
  data.raw["rail-planner"]["active-rail"].subgroup = "circuit-input"
  data.raw.item["rail-combinator"].subgroup = "circuit-input"
end
