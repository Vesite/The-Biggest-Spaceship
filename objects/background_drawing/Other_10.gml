/// @description Select a sprite and width

if draw_style == DRAW_TYPE.STARS_BIG {
	sprite_index = s_stars_1	
}

if draw_style == DRAW_TYPE.STARS_SMALL {
	sprite_index = s_stars_2
}
if draw_style == DRAW_TYPE.NEBULA {
	sprite_index = choose(s_space_nebula_1, s_space_nebula_2, s_space_nebula_3)	
}

sprite_width_base = sprite_get_width(sprite_index)
sprite_height_base = sprite_get_height(sprite_index)
