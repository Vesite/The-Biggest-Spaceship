
function assign_singleton() {

	// Make the objet a singleton
	if (instance_number(object_index) > 1)
	{
		instance_destroy()
		return false
	}

	persistent = true
	return true

}

function default_func() {
	
}

function print_ds_list(_list) {
	
	var _txt = ""
	for (var _i = 0; _i < ds_list_size(_list); _i++) {
		_txt += string(ds_list_find_value(_list, _i)) + " "
	}
	
	show_message(_txt)

}

/*
Moves "a" towards "b" by "amount" and returns the result
Nice bcause it will not overshoot "b", and works in both directions
*/
function approach(_val_1, _val_2, _amount_to_move) {

	if (_val_1 < _val_2)
	{
	    _val_1 += _amount_to_move;
	    if (_val_1 > _val_2)
	        return _val_2;
	}
	else
	{
	    _val_1 -= _amount_to_move;
	    if (_val_1 < _val_2)
	        return _val_2;
	}
	return _val_1;

}

function my_room_goto(_room) {
	
	with (_ctrl_transition) {
		transition_mode = TRANSITION_MODE.GOTO
		target_room = _room
	}
	
}

function my_set_text_align(_halign, _valign) {
	draw_set_halign(_halign)
	draw_set_valign(_valign)
}

function zoom_game(_amount_percentage) {
	
	with (parent_ingame) {
		
		image_xscale = image_xscale*(1 - _amount_percentage)
		image_yscale = image_yscale*(1 - _amount_percentage)
		x_speed = x_speed*(1 - _amount_percentage)
		y_speed = y_speed*(1 - _amount_percentage)
		
		// Move everything closer to the player
		var _dist_to_player = point_distance(x, y, global.player_id.x, global.player_id.y)
		var _dir = point_direction(x, y, global.player_id.x, global.player_id.y)
		x += lengthdir_x(_dist_to_player*_amount_percentage, _dir)
		y += lengthdir_y(_dist_to_player*_amount_percentage, _dir)
		
	}
	
}

function easeOutCubic(_x) {
	return 1 - power(1 - _x, 3)
}

function easeInOutCubic(_x) {
	return _x < 0.5 ? 4 * _x * _x * _x : 1 - power(-2 * _x + 2, 3) / 2;	
}

function easeInQuint(_x) {
	return _x * _x * _x * _x * _x;
}

function easeIn3(_x) {
	return _x * _x * _x
}


function easeIn2(_x) {
	return _x * _x
}

function easeOutSine(_x) {
	 return sin((_x * pi) / 2)	
}


function interpolate_values_data_array(_increasing_x_value, _resulting_value) {
	
	var _spawn_chance_final = 0
	var _length = array_length(_resulting_value)
	
	for (var _i = 0; _i < (_length - 1); _i++) {
	    
		var _data_1 = _resulting_value[_i]
		var _data_2 = _resulting_value[_i + 1]
		
		var _val_1_meters = _data_1[0]
		var _val_2_meters = _data_2[0]
		var _val_1_chance = _data_1[1]
		var _val_2_chance = _data_2[1]
		
		if _increasing_x_value >= _val_1_meters {
			if _increasing_x_value < _val_2_meters {
				
				// Find the percent between value 1 and 2
				var _blocks_ahead_of_val_1 = _increasing_x_value - _val_1_meters
				var _dist_max = _val_2_meters - _val_1_meters
				var _percent = _blocks_ahead_of_val_1/_dist_max
				
				var _chance_min = _val_1_chance
				var _chance_increase = _val_2_chance - _val_1_chance
				
				// Calculate the spawn chance
				var _spawn_chance_final = _chance_min + _percent*_chance_increase
				
			}
		}	
	}
	
	var _data_final = _resulting_value[_length - 1]
	if _increasing_x_value >= _data_final[0] {
		var _spawn_chance_final = _data_final[1]
	}
	
	return _spawn_chance_final
	
}

enum SHIP_SPRITE {
	BOMBER,
	CRUISER,
	MOTHERSHIP,
	SPACESTATION,
	SHOOTER,
	RUNNER,
	SPIKE,
}

#macro ALL_SHIPS_RANDOM choose(SHIP_SPRITE.BOMBER, SHIP_SPRITE.CRUISER, SHIP_SPRITE.MOTHERSHIP, SHIP_SPRITE.SPACESTATION, SHIP_SPRITE.SHOOTER, SHIP_SPRITE.RUNNER, SHIP_SPRITE.SPIKE)

function data_from_ship_sprite_enum(_enum) {
	
	switch (_enum) {
	    case SHIP_SPRITE.BOMBER:
	        return [s_ship_bomber, s_ship_bomber_full, s_ship_bomber_hitbox_inside]
	    break;
		case SHIP_SPRITE.CRUISER:
	        return [s_ship_cruiser, s_ship_cruiser_full, s_ship_cruiser_hitbox_inside]
	    break;
		case SHIP_SPRITE.MOTHERSHIP:
	        return [s_ship_mothership, s_ship_mothership_full, s_ship_mothership_hitbox_inside]
	    break;
		case SHIP_SPRITE.SPACESTATION:
	        return [s_ship_spacestation, s_ship_spacestation_full, s_ship_spacestation_hitbox_inside]
	    break;
		case SHIP_SPRITE.SHOOTER:
	        return [s_ship_shooter, s_ship_shooter_full, s_ship_shooter_hitbox_inside]
	    break;
		case SHIP_SPRITE.RUNNER:
	        return [s_ship_runner, s_ship_runner_full, s_ship_runner_hitbox_inside]
	    break;
		case SHIP_SPRITE.SPIKE:
	        return [s_ship_spike, s_ship_spike_full, s_ship_spike_hitbox_inside]
	    break;
	}
	
}

function make_fading_copy(_id) {
	// Create a fading out copy
	with (instance_create_depth(x, y, depth - 1, sprite_drawer)) {
		image_xscale = _id.image_xscale
		image_yscale = _id.image_yscale
		
		sprite_index = _id.sprite_data_array[1]
		
		image_angle = _id.image_angle
		draw_col = _id.draw_col
	}
}

function collision_sound(_my_speed) {
	
	// Sound cooldown
	if global.sound_cd_collision_sound == 0 {
		
		global.sound_cd_collision_sound = 20
		
		if _my_speed > 12 {
			my_play_audio(so_sfx_collide_d_10_echo)
		} else if _my_speed > 6 {
			my_play_audio(so_sfx_collide_d_7_echo)
		} else if _my_speed > 3 {
			my_play_audio(so_sfx_collide_d_6_echo)
		} else if _my_speed > 1 {
			my_play_audio(so_sfx_collide_d_1_echo)
		} else {
			my_play_audio(so_sfx_collide_d_0_echo)
		}
	
	}
	
}



function check_surpassed_text() {
	
	var _text = ""
	
}


function get_trivia_text_from_scale(_area) {
	
	var _text = ""
	
	if within_range(_area, AREA_US_HOME) {
		var _factor = _area/AREA_US_HOME
		_text += string(_factor*100) + "% The size of an average US Home\n"
	}
	if within_range(_area, AREA_CANADA) {
		var _factor = _area/AREA_CANADA
		_text += string(_factor*100) + "% The size of Canada\n"
	}
	
	return _text
	
}

// Checks if the first value is withing 5000x of the second value
function within_range(_val_1, _val_2) {
	
	if ((_val_1 >= _val_2 / 5000) and (_val_1 <= _val_2 * 5000)) {
        return true
    } else {
        return false
    }
	
}

// Ship Area in square meters
function ship_area() {
	return ceil((global.ship_width * global.ship_height)*0.002)	
}

function distributed_values_array(_amount, _space, _margin, _center) {
	
	var _array = []
	
	var _inside_space = _space - _margin*2
	if _inside_space <= 0 { return false }
	
	var _distance_between = _inside_space/(_amount - 1)
	var _start = _center - _distance_between*(_amount - 1)*0.5
	
	for (var _i = 0; _i < _amount; _i++) {
		
	    array_push(_array, _start + _distance_between*_i)
	}
	
	return _array
}
