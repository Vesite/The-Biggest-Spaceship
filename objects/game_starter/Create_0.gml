
randomize()

#region Initialize some game variables

	draw_set_font(FONT_NORMAL)
	my_set_text_align(fa_center, fa_middle)
	draw_set_color(c_white)
	draw_set_alpha(1)

#endregion

#region Initialize singleton objects

var _prefix = "_"
 
var _o_index = 0

while (object_exists(_o_index))
{
	var _name = object_get_name(_o_index)
	
	if (string_pos(_prefix,_name) == 1)
	{
		with (instance_create_depth(0, 0, SINGLETON_OBJ_DEPTH, _o_index))
			persistent = true
	}
	_o_index += 1
}

#endregion

// Go to the starting room
room_goto(r_game)
