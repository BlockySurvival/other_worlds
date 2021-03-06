--Heights for skyboxes
local space_low = 5000
local space_high = 5999
local redsky_low = 6000
local redsky_high = 6999


local player_list = {} -- Holds name of skybox showing for each player

local normal_sky = {
    type = "regular",
    sky_color = {
        day_sky = "#8cbafa",
        day_horizon = "#9bc1f0",
        dawn_sky = "#b4bafa",
        dawn_horizon = "#bac1f0",
        night_sky = "#006aff",
        night_horizon = "#4090ff",
        indoors = "#646464",
        fog_tint_type = "default"
    },
    clouds = true
}

--Outerspace skybox
local spaceskybox = {
	"sky_pos_z.png",
	"sky_neg_z.png^[transformR180",
	"sky_neg_y.png^[transformR270",
	"sky_pos_y.png^[transformR270",
	"sky_pos_x.png^[transformR270",
	"sky_neg_x.png^[transformR90",
}

--Redsky skybox
local redskybox = {
	"sky_pos_z.png^[colorize:#99000050",
	"sky_neg_z.png^[transformR180^[colorize:#99000050",
	"sky_neg_y.png^[transformR270^[colorize:#99000050",
	"sky_pos_y.png^[transformR270^[colorize:#99000050",
	"sky_pos_x.png^[transformR270^[colorize:#99000050",
	"sky_neg_x.png^[transformR90^[colorize:#99000050",
}

local timer = 0

minetest.register_globalstep(function(dtime)

	timer = timer + dtime

	if timer < 2 then
		return
	end

	timer = 0

	for _, player in pairs(minetest.get_connected_players()) do

		local name = player:get_player_name()
		local pos = player:getpos()
		local current = player_list[name] or ""

		-- Earth
		if pos.y < space_low and current ~= "earth" then
            player:set_sky(normal_sky)
            player:set_moon({visible = true})
            player:set_sun({visible = true})
            player:set_stars({visible = true})
			player_list[name] = "earth"
			if otherworlds.settings.gravity.enable then
				player:set_physics_override({gravity = 1})
			end

		-- Outerspace
		elseif pos.y > space_low and pos.y < space_high and current ~= "space" then
            player:set_sky({
                base_color = "#000000",
                type = "skybox",
                textures = spaceskybox,
                clouds = false

            })
            player:set_sun({visible = false, sunrise_visible = false})
            player:set_moon({visible = false})
            player:set_stars({visible = false})
			player_list[name] = "space"
			if otherworlds.settings.gravity.enable then
				player:set_physics_override({gravity = 0.4})
			end

		-- Redsky
		elseif pos.y > redsky_low and pos.y < redsky_high and current ~= "redsky" then
            player:set_sky({
                base_color = "#000000",
                type = "skybox",
                textures = redskybox,
                clouds = false

            })
            player:set_sun({visible = false, sunrise_visible = false})
            player:set_moon({visible = false})
            player:set_stars({visible = false})
			player_list[name] = "redsky"
			if otherworlds.settings.gravity.enable then
				player:set_physics_override({gravity = 0.2})
			end

		-- Everything else (blackness)
		elseif pos.y > redsky_high and current ~= "blackness" then
            player:set_sky({
                base_color = "#000000",
                type = "plain",
                clouds = false,
            })
            player:set_sun({visible = false, sunrise_visible = false})
            player:set_moon({visible = false})
            player:set_stars({visible = false})
			player_list[name] = "blackness"
			if otherworlds.settings.gravity.enable then
				player:set_physics_override({gravity = 0.1})
			end
		end
	end
end)

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	player_list[name] = nil
	if otherworlds.settings.gravity.enable then
		player:set_physics_override({gravity = 1})
	end
end)