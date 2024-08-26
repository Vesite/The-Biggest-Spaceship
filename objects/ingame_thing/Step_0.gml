/// @description

if P exit

#region Control

if controlled_by_player {

	var _dir = point_direction(x, y, mouse_x, mouse_y)

	if (point_distance(x, y, mouse_x, mouse_y)) < 30 {
		var _speed_scale = 0
	} else {
		var _dist = max(0, (point_distance(x, y, mouse_x, mouse_y)) - 30)
		var _speed_scale = min(1, _dist/200)
	}
	
	if global.player_ship_sound != noone {
		audio_sound_gain(global.player_ship_sound, max(_speed_scale*0.4, 0.35*0.4), 0)
	}
	var _final_acc = acc*_speed_scale

	x_speed += lengthdir_x(_final_acc, _dir)
	y_speed += lengthdir_y(_final_acc, _dir)
	
}

#endregion

#region Speed Friction

if id == global.player_id {
	if (abs(x_speed) > 9) {
		x_speed = x_speed*0.95
	}
	if (abs(y_speed) > 9) {
		y_speed = y_speed*0.95
	}
}

if (abs(x_speed) > 2.5) {
	x_speed = x_speed*0.99
}
if (abs(y_speed) > 2.5) {
	y_speed = y_speed*0.99
}

y_speed = y_speed*0.9998
x_speed = x_speed*0.9998

x_speed = clamp(x_speed, -20, 20)
y_speed = clamp(y_speed, -20, 20)

#endregion

#region Take over other ships

if controlled_by_player {
		
	// Take over other ships
	mask_index = sprite_data_array[2]
	var _xx = x
	x += 10000
	var _id = instance_nearest(_xx, y, ingame_thing)
	x -= 10000
	if (_id != noone) and collision_point(_id.x, _id.y, id, false, false) and (_id.sprite_width + _id.sprite_height) > (sprite_width + sprite_height) {
		
		// Sound
		global.times_upgraded += 1
		my_play_audio(so_sfx_level_up_space, global.ae_sfx, 100, false, max(1 - 0.05*global.times_upgraded, 0.4))
		if global.zoom_sound != noone {
			audio_sound_gain(global.zoom_sound, 1, 3000)
		}
		
		make_fading_copy(id)
		
		// Set new ship size for GUI
		global.ship_width = global.ship_width*(_id.sprite_width/sprite_width)
		global.ship_height = global.ship_height*(_id.sprite_height/sprite_height)
		
		// Trivia Text
		if array_length(_ctrl_ect.area_landmarks_array) > 0 {
			var _array = _ctrl_ect.area_landmarks_array[0]
			if ship_area() > _array[0] {
				// Create text for that
				show_debug_message(_array[1])
				array_delete(_ctrl_ect.area_landmarks_array, 0, 1)
				_ctrl_ect.draw_trivia_timer = _ctrl_ect.draw_trivia_timer_max
				_ctrl_ect.current_trivia_text = _array[1]
			}
		}
		
		// Take the properties of the one we combined with
		x = _id.x
		y = _id.y
		image_xscale = _id.image_xscale
		image_yscale = _id.image_yscale
		sprite_data_array = _id.sprite_data_array
		sprite_index = sprite_data_array[1]
		image_angle = _id.image_angle
		draw_col = _id.draw_col
		outside_ship_alpha = 0
		
		// Destroy the one we stole 
		with (_id) {
			instance_destroy()	
		}
	}
	
	mask_index = sprite_data_array[1]
}

#endregion

#region Collision with other ships

if controlled_by_player {

	// Collision Target	
	var _id = instance_place(x + x_speed, y + y_speed, ingame_thing)
	
	// Collision
	if _id != noone {
		
		// Sound
		var _my_speed = abs(x_speed) + abs(y_speed)
		collision_sound(_my_speed)

		var _enemy_speed = abs(_id.x_speed) + abs(_id.y_speed)
		var _dir_me_to_enemy = point_direction(x, y, _id.x, _id.y)
		
		var _enemy_push_factor = ((sprite_width*sprite_height)/(_id.sprite_width*_id.sprite_height))
		var _me_push_factor = ((_id.sprite_width*_id.sprite_height)/(sprite_width*sprite_height))
		
		_id.x_speed = lengthdir_x(_my_speed*0.5*_enemy_push_factor, _dir_me_to_enemy)
		_id.y_speed = lengthdir_y(_my_speed*0.5*_enemy_push_factor, _dir_me_to_enemy)
		
		x_speed = lengthdir_x(_enemy_speed*0.3*_me_push_factor, _dir_me_to_enemy + 180)
		y_speed = lengthdir_y(_enemy_speed*0.3*_me_push_factor, _dir_me_to_enemy + 180)
	
	}

}
x += x_speed
y += y_speed

#endregion

// Zoom out so that our ship's 2 sides together become 30% of the screen's width?
if id == global.player_id {
	var _current_factor = (abs(sprite_width) + abs(sprite_height))/(GAME_WIDTH)
	
	var _is_zooming = false
	
	if (_current_factor > 0.27) {
		zoom_game(ZOOM_SPEED)
		_is_zooming = true
	}
	
	if (_current_factor < 0.24) {
		zoom_game(-ZOOM_SPEED)
		_is_zooming = true
	}
	
	if _is_zooming == false and is_zooming_prev == true and global.zoom_sound != noone {
		audio_sound_gain(global.zoom_sound, 0, 5000)
	}
	
	is_zooming_prev = _is_zooming
}

// If we the player are inside an ai, we destroy them pretty fast
if id == global.player_id {
	var _id = instance_place(x, y, ingame_thing_ai)
	if _id != noone {
		with (_id) {
			inside_timer += 2
			if inside_timer == 20 {
				my_play_audio(so_sfx_collide_d_6_echo)
				make_fading_copy(id)
				instance_destroy()
			}
		}
	}
}

if id != global.player_id {
	inside_timer = max(inside_timer - 1, 0)		
}

// Destroy the instance if it is too small
if ((sprite_width + sprite_height) < 60) {
	make_fading_copy(id)
	instance_destroy()
}