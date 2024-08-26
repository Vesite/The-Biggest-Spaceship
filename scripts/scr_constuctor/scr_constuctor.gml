
#region Buttons

	/*
	Click the button to run a script
	*/
	function mycon_button_basic(_x=0, _y=0, _depth=GUI_BUTTON_DEPTH, _width=-1, _height=-1, _text="Default", _size_match_text=false,
								_script=default_func, _scr_arg_1=undefined, _scr_arg_2=undefined,
								_draw_in_gui=false, _sprite_9slice=s_nothing) {
	
		var _id = instance_create_depth(_x, _y, _depth, HCON_button_basic)
		
		_id.width = _width
		_id.height = _height
		_id.text = _text
		_id.size_match_text = _size_match_text
		_id.draw_in_gui = _draw_in_gui
		_id.sprite_9slice = _sprite_9slice
		
		_id.clicked_script = _script
		_id.clicked_script_arg_1 = _scr_arg_1
		_id.clicked_script_arg_2 = _scr_arg_2
		
		if _size_match_text {
			_id.width = (string_width(_text) + 24)*UI_PIXEL_SCALE
			_id.height = (string_height(_text) + 14)*UI_PIXEL_SCALE
		}

		return _id
	
	}
	
	/*
	Click the button to toggle a global value
	*/
	function mycon_button_toggle(_x=0, _y=0, _depth=GUI_BUTTON_DEPTH, _width=-1, _height=-1, _text="Default", _size_match_text=false,
								_toggle_enum=TOGGLE_ENUM.ENABLE_MASTER_AUDIO, _draw_in_gui=false, _sprite_9slice=s_nothing) {
		
		var _id = instance_create_depth(_x, _y, _depth, HCON_button_toggle)
		
		_id.width = _width
		_id.height = _height
		_id.text = _text
		_id.size_match_text = _size_match_text
		_id.draw_in_gui = _draw_in_gui
		_id.sprite_9slice = _sprite_9slice
		
		_id.toggle_enum = _toggle_enum
		
		if _size_match_text {
			_id.width = (string_width(_text) + 24)*UI_PIXEL_SCALE + sprite_get_width(s_toggle_16x) + 24
			_id.height = (string_height(_text) + 14)*UI_PIXEL_SCALE
		}
		
		return _id
	
	}
	
	/*
	Each slider needs an ENUM "connection" thing to know what variable it is modifying
	*/
	function mycon_button_slider(_x=0, _y=0, _depth=GUI_BUTTON_DEPTH, _slider_width=100, _height=50, _sl_spr=s_slider,
								 _sl_handle_spr=s_slider_handle, _sl_handle_width=8, _sl_handle_height=14,
								 _icon_spr=noone, _text="Default", _slider_enum=SLIDER_ENUM.VOLUME_MASTER,
								 _sprite_9slice=s_9slice_c_bg_frame_gray, _draw_in_gui=false) {
		
		var _id = instance_create_depth(_x, _y, _depth, HCON_button_slider)
		
		_id.height = _height
		_id.draw_in_gui = _draw_in_gui
		_id.sprite_9slice = _sprite_9slice
		
		_id.slider_sprite = _sl_spr
		_id.text = _text
		
		_id.slider_width = _slider_width
		
		_id.slider_handle_sprite = _sl_handle_spr
		_id.slider_handle_width = _sl_handle_width
		_id.slider_handle_height = _sl_handle_height
		
		_id.icon_sprite = _icon_spr
		_id.slider_enum = _slider_enum
		
		// After Init
		with (_id) {
			event_user(10)	
		}
		
		return _id
	
	}

#endregion

/*
Only draws in GUI
*/
function mycon_draw_frame(_x, _y, _sprite, _depth, _image_index, _width, _height, _alpha, _col=c_white) {
	
	// Depth below normal GUI-depth
	var _id = instance_create_depth(_x, _y, _depth, HCON_draw_frame)
	
	_id.sprite_index = _sprite
	_id.image_index = _image_index
	
	_id.width = _width
	_id.height = _height
	
	_id.alpha = _alpha
	_id.col = _col
	
	
	return _id
	
}

function mycon_thing(_x, _y, _main_player, _sprite_enum, _scale, _spin_speed) {
	
	if _main_player 
		var _id = instance_create_layer(_x, _y, "Instances", ingame_thing_player)
	else 
		var _id = instance_create_layer(_x, _y, "Instances", ingame_thing_ai)
	
	_id.sprite_data_array = data_from_ship_sprite_enum(_sprite_enum)
	
	if _main_player {
		_id.sprite_index = _id.sprite_data_array[1]
		_id.controlled_by_player = true
		global.player_id = _id
	} else {
		_id.sprite_index = _id.sprite_data_array[0]
		_id.controlled_by_player = false
	}
	
	_id.image_xscale = _scale
	_id.image_yscale = _scale
	_id.spin_speed = _spin_speed
	
	_id.draw_col = make_color_rgb(irandom(255),irandom(255),irandom(255))
	
	return _id
	
}
