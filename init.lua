local modpath = minetest.get_modpath("other_worlds").. DIR_DELIM

otherworlds = {}

--from other mods looking to see what version this is
otherworlds.version = "5.3.0+"

dofile(modpath .. "settings.lua")
dofile(modpath .. "mars_plants.lua")
dofile(modpath .. "crystals.lua")
dofile(modpath .. "space_nodes.lua")
dofile(modpath .. "crafting.lua")
dofile(modpath .. "skybox.lua")
dofile(modpath .. "asteroid_layer_helpers.lua") -- required helpers for mapgen options below
dofile(modpath .. "space_asteroids.lua")
dofile(modpath .. "redsky_asteroids.lua")
