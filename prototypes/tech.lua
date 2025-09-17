local flib = require("__flib__.data-util")

local active_rails_tech = flib.copy_prototype(data.raw["technology"]["automated-rail-transportation"], "active-rails")

active_rails_tech.icon = "__Active_Rails_Tweaks__/graphics/icons/tech.png"
active_rails_tech.icon_size = 256

active_rails_tech.prerequisites = {"automated-rail-transportation", "circuit-network"}
active_rails_tech.effects = {{type = "unlock-recipe", recipe = "active-rail"}}

data:extend{active_rails_tech}
