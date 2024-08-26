/*
Decide "is_inside" and "show_hover_text"
*/

var _input = _ctrl_input

// Check for collision with the button, inside with and height square. get "is_inside"
var _w2 = width/2
var _h2 = height/2

if draw_in_gui {
	var _check2 = point_in_rectangle(MOUSE_GUI_X, MOUSE_GUI_Y, x - _w2, y - _h2, x + _w2, y + _h2)
} else {
	var _check2 = point_in_rectangle(mouse_x, mouse_y, x - _w2, y - _h2, x + _w2, y + _h2)
}
	
if is_inside == false {
	if  _check2 {
		event_user(1)
	}
}
else {
	if not _check2 {
		event_user(2)
	}
}
	
if is_inside {
	show_hover_text = true	
} else {
	show_hover_text = false	
}

if is_inside {
		
	if _input.mouse_left_clicked {
		// Here we have clicked the button
		event_user(3)
	}
		
	if mouse_check_button_released(mb_left) {
		current_subimage = 1 // Hover
		button_content_y_offset = 0
	}
		
}



