
// Draw black fading
if (transition_mode != TRANSITION_MODE.OFF)
{
	draw_set_color(c_black)
	draw_set_alpha(percent)
	draw_rectangle(0, 0, GAME_WIDTH, GAME_HEIGHT, false)
}

// Reset the color and alpha for all our other draw events
draw_set_color(c_white)
draw_set_alpha(1)

