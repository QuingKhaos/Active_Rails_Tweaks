local active_rail = data.raw["rail-planner"]["active-rail"]

-- Check if the active rail has an icon (either as .icon or as the first .icons[1].icon)
if (active_rail.icon) or (active_rail.icons and active_rail.icons[1] and active_rail.icons[1].icon) then
  local new_icons = {}

  -- If there are multiple icon layers, tint all of them
  if active_rail.icons and #active_rail.icons > 0 then
    for i, icon_layer in ipairs(active_rail.icons) do
      ---@diagnostic disable: unknown-symbol
      local icon_copy = table.deepcopy(icon_layer)

      icon_copy.tint = {r = 1, g = 0, b = 0, a = 0.5}
      table.insert(new_icons, icon_copy)
    end
  elseif active_rail.icon then
    table.insert(new_icons, {
      icon = active_rail.icon,
      icon_size = active_rail.icon_size,
      tint = {r = 1, g = 0, b = 0, a = 0.5},
    })
  end

  if #new_icons > 0 then
    active_rail.icon = nil
    active_rail.icon_size = nil
    active_rail.icons = new_icons
  end
end
