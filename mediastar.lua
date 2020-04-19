obs = obslua

hotkey_next_id   = obs.OBS_INVALID_HOTKEY_ID
hotkey_prev_id   = obs.OBS_INVALID_HOTKEY_ID

-- Returns num of current scene in scene list
function get_current_scene_num(scene_list)
	
	local current_scene_source = obs.obs_frontend_get_current_scene()
	local current_scene_name = obs.obs_source_get_name(current_scene_source)

    for i, scene in pairs(scene_list) do
		scene_name = obs.obs_source_get_name(scene)

		if scene_name == current_scene_name then
			return i
		end
	end
end

-- Transitions to given scene number
function goto_scene_num(scene_list, num)

	-- If num is out of bounds, do notihing
	if num < 1 or num > table.getn(scene_list) then
		return
	end

	obs.obs_frontend_set_current_scene(scene_list[num])
end

-- Advances to next scene in list
function goto_next_scene(pressed)
	if not pressed then  -- Fires on both press & release
		return
	end
	
	local scene_list = obs.obs_frontend_get_scenes()
	local num = get_current_scene_num(scene_list)

	goto_scene_num(scene_list, num + 1)
end

-- Goes back to previous scene in list
function goto_prev_scene(pressed)
	if not pressed then -- Fires on both press & release
		return
	end
	
	local scene_list = obs.obs_frontend_get_scenes()
	local num = get_current_scene_num(scene_list)

	goto_scene_num(scene_list, num - 1)
end

-- Returns the description shown to the user
function script_description()
	return "Adds hotkey support for going to prev/next scene."
end

-- Called when the script is saved
function script_save(settings)

	-- Save user's hotkey definitions
	local hotkey_save_array = obs.obs_hotkey_save(hotkey_next_id)
	obs.obs_data_set_array(settings, "prevnext_next_hotkey", hotkey_save_array)
	hotkey_save_array = obs.obs_hotkey_save(hotkey_next_id)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_hotkey_save(hotkey_prev_id)
	obs.obs_data_set_array(settings, "prevnext_prev_hotkey", hotkey_save_array)
	hotkey_save_array = obs.obs_hotkey_save(hotkey_prev_id)
	obs.obs_data_array_release(hotkey_save_array)
	
end

-- Called when the script is loaded
function script_load(settings)

	-- Set hotkey handlers
	hotkey_next_id = obs.obs_hotkey_register_frontend("prevnext_next", "Next Scene", goto_next_scene)
	hotkey_prev_id = obs.obs_hotkey_register_frontend("prevnext_prev", "Previous Scene", goto_prev_scene)
	
	-- Load user's hotkey definitions
	local hotkey_save_array = obs.obs_data_get_array(settings, "prevnext_next_hotkey")
	obs.obs_hotkey_load(hotkey_next_id, hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
	
	hotkey_save_array = obs.obs_data_get_array(settings, "prevnext_prev_hotkey")
	obs.obs_hotkey_load(hotkey_prev_id, hotkey_save_array)
	obs.obs_data_array_release(hotkey_save_array)
end
