otherworlds.settings = {}

-- general
otherworlds.settings.crafting = {
    --set to false to remove crafting recipes
	enable = minetest.settings:get_bool("ow_craft", true),
}

-- space_asteroids
otherworlds.settings.space_asteroids = {
    -- set to false to prevent space mapgen
    enable = minetest.settings:get_bool("ow_space_asteroids", true),
    -- adjust to change minimum height of space layer
    YMIN = tonumber(minetest.settings:get("ow_space_min")) or 5000,
    -- adjust to change maximum height for space layer
	YMAX = tonumber(minetest.settings:get("ow_space_max")) or 6000,
}


-- redsky_asteroids
otherworlds.settings.redsky_asteroids = {
    -- set to false to prevent redsky mapgen
    enable = minetest.settings:get_bool("ow_red_asteroids", true),
    -- adjust to change minimum height of redsky layer
    YMIN = tonumber(minetest.settings:get("ow_red_min")) or 6000,
    -- adjust to change maximum height for redsky layer
	YMAX = tonumber(minetest.settings:get("ow_red_max")) or 7000,
}

-- gravity
otherworlds.settings.gravity = {
    -- set to true to enable gravity
	enable = minetest.settings:get_bool("ow_gravity", false),
}