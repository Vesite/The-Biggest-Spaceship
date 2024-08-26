
/*
Adds screen shake for "_duration", will get less as timer goes down
*/
function add_screen_shake(_duration) {
	
	with (_ctrl_camera) {
		screen_shake_timer = _duration
	}
	
}

function draw_text_shadow(_x, _y, _txt, _shadow_dist, _col, _alpha=1, _scale=1) {
	
	draw_text_transformed_color(_x + _shadow_dist*_scale, _y + _shadow_dist*_scale, _txt, _scale, _scale, 0, c_black, c_black, c_black, c_black, _alpha)
	draw_text_transformed_color(_x, _y, _txt, _scale, _scale, 0, _col, _col, _col, _col, _alpha)
	
}
