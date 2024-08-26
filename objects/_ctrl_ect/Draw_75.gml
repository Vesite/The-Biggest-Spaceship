
if _ctrl_input.mouse_left_hold {
	var _ind = 1	
} else {
	var _ind = 0
}

// Draw cursor
if P and _ctrl_transition.transition_mode = TRANSITION_MODE.OFF {
	draw_sprite_ext(s_cursor_2, 2 + _ind, MOUSE_GUI_X, MOUSE_GUI_Y, 3, 3, 0, c_white, 1)	
} else {
	var _direction = point_direction(GAME_WIDTH/2, GAME_HEIGHT/2, MOUSE_GUI_X, MOUSE_GUI_Y)
	if (point_distance(global.player_id.x, global.player_id.y, mouse_x, mouse_y)) < 30 {
		var _speed_scale = 0
	} else {
		var _dist = max(0, (point_distance(global.player_id.x, global.player_id.y, mouse_x, mouse_y)) - 30)
		var _speed_scale = min(1, _dist/200)
	}
	draw_sprite_ext(s_arrow_1, current_time/80, MOUSE_GUI_X, MOUSE_GUI_Y, 2.4, 2.4, _direction, c_white, _speed_scale)
}

// Draw score
var _area = ship_area()

if _area > SQUARE_LIGHTSECONDS*100 {
	var _amount = string(round(_area/(SQUARE_LIGHTSECONDS))) + " light-seconds^2" 
} else if _area > SQUARE_KILOMETERS*10 {
	var _amount = string(round(_area/(SQUARE_KILOMETERS))) + " km^2" 
} else {
	var _amount = string(_area) + " m^2" 
}

draw_text_transformed(GAME_WIDTH/2, GAME_HEIGHT*0.05, "Spaceship Size: " + _amount, 2.7, 2.7, 0)

// Trivia
if not P {
	draw_trivia_timer = max(draw_trivia_timer - 1, 0)
}
draw_set_alpha((draw_trivia_timer*2)/draw_trivia_timer_max)
draw_text_transformed(GAME_WIDTH/2, GAME_HEIGHT*0.88, current_trivia_text, 2.4, 2.4, 0)
draw_set_alpha(1)

draw_set_halign(fa_left)
draw_set_alpha(0.8)
draw_text_transformed(GAME_WIDTH*0.01, GAME_HEIGHT*0.03, "FPS: " + string(fps), 2, 2, 0)
draw_set_alpha(1)
draw_set_halign(fa_center)

if P and _ctrl_transition.transition_mode != TRANSITION_MODE.INTRO {
	draw_set_color(c_white)
	draw_text_transformed(GAME_WIDTH/2, GAME_HEIGHT*0.15, "The Biggest Spaceship, by Vesite\nGMTK 2024 Game Jam", 3.2, 3.2, 0)
}
