/// @description 

// Find an array that covers the area around the player
// Then loop through the array and draw sprites everywhere
// Can be too much drawing when zooming out too much so fade out the alpha on this object then don't draw eventually

var _w_in_room = sprite_width_base*image_xscale
var _h_in_room = sprite_height_base*image_yscale

var _amount_w = ceil(GAME_WIDTH/_w_in_room) + 1
var _amount_h = ceil(GAME_HEIGHT/_h_in_room) + 1

var _x_dist_to_player = global.player_id.x - x
var _x_how_many_to_player = round(_x_dist_to_player/_w_in_room)
var _player_x_center_tiled = x + _w_in_room*_x_how_many_to_player

var _y_dist_to_player = global.player_id.y - y
var _y_how_many_to_player = round(_y_dist_to_player/_h_in_room)
var _player_y_center_tiled = y + _h_in_room*_y_how_many_to_player

var _half_w = ceil(_amount_w/2)
var _half_h = ceil(_amount_h/2)

var _draw_counter = 0

#region Set alpha based on image_xscale

find_new_alpha_timer = max(find_new_alpha_timer - 1, 0)
if find_new_alpha_timer == 0 {
	find_new_alpha_timer = find_new_alpha_timer_max
	//				   [[image_xscale,	alpha]]
	var _data_array =  [[0.1,			0],
						[0.4,			1],
						[0.7,			1],
						[1.0,			0]]
	current_draw_alpha = interpolate_values_data_array(image_xscale, _data_array)
}

#endregion

if current_draw_alpha != 0 {
	for (var _i = 0; _i < _amount_w+1; _i++) {
		for (var _e = 0; _e < _amount_h+1; _e++) {
			_draw_counter += 1
			var _x = _player_x_center_tiled + (_i - _half_w)*_w_in_room
			var _y = _player_y_center_tiled + (_e - _half_h)*_h_in_room
			draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale, image_yscale, 0, c_white, current_draw_alpha)
		}
	}
}

// Create a new bigger background when this one is small enough
if image_xscale < 0.5 and not have_created_child {
	have_created_child = true
	// Create a new big background
	with (instance_create_depth(x, y, depth, object_index)) {
		
		draw_style = other.draw_style
		
		event_user(0)
		
		x += irandom_range(0, sprite_width_base)
		y += irandom_range(0, sprite_height_base)
	}
}

if (have_created_child) and (image_xscale <= 0) {
	instance_destroy()
}
