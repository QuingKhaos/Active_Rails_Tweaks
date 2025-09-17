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
if icon_to_use then
  -- Preserve all properties from the original icon definition
  local original_icon = nil
  if active_rail.icons and active_rail.icons[1] and active_rail.icons[1].icon then
    -- Copy the first icon table from icons
    original_icon = table.deepcopy(active_rail.icons[1])
  elseif active_rail.icon then
    -- Build a table from the single icon definition
    original_icon = {
      icon = active_rail.icon,
      icon_size = active_rail.icon_size,
      icon_mipmaps = active_rail.icon_mipmaps,
      scale = active_rail.scale
    }
  end
  if original_icon then
    original_icon.tint = {r = 1, g = 0, b = 0, a = 0.5}
    active_rail.icons = { original_icon }
  end
end
