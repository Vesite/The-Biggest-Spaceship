
event_inherited()

var _input = _ctrl_input

// Check for collision with the slider handle. get "is_inside_handle"
var _w = slider_handle_width
var _h = slider_handle_height

if draw_in_gui {
	var _check_in_handle = point_in_rectangle(MOUSE_GUI_X, MOUSE_GUI_Y, slider_handle_x - _w, y - _h, slider_handle_x + _w, y + _h)
} else {
	var _check_in_handle = point_in_rectangle(mouse_x, mouse_y, slider_handle_x - _w, y - _h, slider_handle_x + _w, y + _h)
}

var _x_left = x - width/2
var _slider_x_left = _x_left + delta*2 + left_box_width
if draw_in_gui {
	var _check_in_bar = point_in_rectangle(MOUSE_GUI_X, MOUSE_GUI_Y, _slider_x_left, y - slider_height, _slider_x_left + slider_width, y + slider_height)
} else {
	var _check_in_bar = point_in_rectangle(mouse_x, mouse_y, _slider_x_left, y - slider_height, _slider_x_left + slider_width, y + slider_height)
}


#region Logic for "is_holding_handle" and "handle_image_index"

	if mouse_check_button_released(mb_left) {
		is_holding_handle = false
		handle_image_index = 0
	}

	if is_inside_handle == false {
		if _check_in_handle {
			is_inside_handle = true
			handle_image_index = 1
		}
	}
	else {
		if not _check_in_handle {
			// Leaving the button
			is_inside_handle = false
			handle_image_index = 0
		}
	}

	if is_inside_handle {
		
		if _input.mouse_left_clicked {
			// Here we have clicked the button
			is_holding_handle = true
		}
		
	}

	if is_holding_handle {
		handle_image_index = 2
	}
	
	if _check_in_bar {
		if _input.mouse_left_clicked {
			// Telepor tthe thing to the mouse
			if draw_in_gui {
				slider_handle_x = MOUSE_GUI_X
			} else {
				slider_handle_x = mouse_x
			}
			is_holding_handle = true
		}
	}

#endregion

// Change the position of "handle
if is_holding_handle {
	
	if draw_in_gui {
		slider_handle_x = MOUSE_GUI_X
	} else {
		slider_handle_x = mouse_x
	}
	
	var _slider_x_left = x - width/2 + delta + left_box_width + delta
	slider_handle_x = clamp(slider_handle_x, _slider_x_left, _slider_x_left + slider_width)
	
	// Set the current value based on the position of the handle
	var _dist_from_slider_left = slider_handle_x - _slider_x_left
	var _current_slider_val = _dist_from_slider_left/(slider_width)
	slider_set_value(slider_enum, _current_slider_val)
	
}
