-- Better subgroup placement with SchallCircuitGroup
if mods["SchallCircuitGroup"] then
  data.raw["rail-planner"]["active-rail"].subgroup = "circuit-input"
  data.raw.item["rail-combinator"].subgroup = "circuit-input"
end

-- Give the active rail a red tint to better distinguish it from normal rails.
local active_rail = data.raw["rail-planner"]["active-rail"]

-- Check if the active rail has an icon (either as .icon or as the first .icons[1].icon)
if (active_rail.icon) or (active_rail.icons and active_rail.icons[1] and active_rail.icons[1].icon) then
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
  if active_rail.icons and #active_rail.icons > 0 then
    -- Deepcopy and tint all icon layers
    local new_icons = {}
    for i, icon_layer in ipairs(active_rail.icons) do
      local icon_copy = table.deepcopy(icon_layer)
      icon_copy.tint = {r = 1, g = 0, b = 0, a = 0.5}
      table.insert(new_icons, icon_copy)
    end
    active_rail.icons = new_icons
    active_rail.icon = nil
  elseif original_icon then
    original_icon.tint = {r = 1, g = 0, b = 0, a = 0.5}
    active_rail.icons = { original_icon }
    active_rail.icon = nil
  end
end
