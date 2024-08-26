/// @description 

event_inherited()

have_created_child = false
offset_x = 0
offset_y = 0

enum DRAW_TYPE {
	STARS_SMALL,
	STARS_BIG,
	NEBULA,
}

draw_style = DRAW_TYPE.STARS_SMALL

current_draw_alpha = 0
find_new_alpha_timer_max = 10
find_new_alpha_timer = 0

