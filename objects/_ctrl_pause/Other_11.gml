/// @desc Normal Pause

global.paused = true

text_scale = 6
can_esq_remove_pause = true

// Pause Frame
var _id = mycon_draw_frame(GAME_WIDTH/2, GAME_HEIGHT/2, s_9sclice_c_gray, GUI_FRAME_DEPTH, 2, GAME_WIDTH*0.5, GAME_HEIGHT*0.52, 1, c_white)
ds_list_add(button_list, _id)

if IN_HTML {

// Continue
var _x = GAME_WIDTH*0.5
var _y = GAME_HEIGHT*0.35
var _id = mycon_button_basic(_x, _y, , , , "Continue", true, end_pause, , , true, s_9sclice_c_black)
ds_list_add(button_list, _id)

// Audio Toggle
var _x = GAME_WIDTH*0.5
var _y = GAME_HEIGHT*0.5
var _id = mycon_button_toggle(_x, _y, , , , "Enable Audio", true, TOGGLE_ENUM.ENABLE_MASTER_AUDIO, true, s_9sclice_c_black)
ds_list_add(button_list, _id)

// Slider Audio
var _x = GAME_WIDTH*0.5
var _y = GAME_HEIGHT*0.65
var _id = mycon_button_slider(_x, _y, , GAME_WIDTH*0.18, GAME_HEIGHT*0.11, s_slider, s_slider_handle, 8, 12, , "Master Volume:",
							  SLIDER_ENUM.VOLUME_MASTER, s_9sclice_c_black, true)
ds_list_add(button_list, _id)

} else {
	
	var _pos_array = distributed_values_array(4, GAME_HEIGHT*0.35, 0, true)
	
	// Continue
	var _x = GAME_WIDTH*0.5
	var _y = _pos_array[0] + GAME_HEIGHT*0.5
	var _id = mycon_button_basic(_x, _y, , , , "Continue", true, end_pause, , , true, s_9sclice_c_black)
	ds_list_add(button_list, _id)
	
	// Fullscreen
	var _x = GAME_WIDTH*0.5
	var _y = _pos_array[1] + GAME_HEIGHT*0.5
	var _id = mycon_button_toggle(_x, _y, , , , "Fullscreen", true, TOGGLE_ENUM.ENABLE_FULLSCREEN, true, s_9sclice_c_black)
	ds_list_add(button_list, _id)

	// Audio Toggle
	var _x = GAME_WIDTH*0.5
	var _y = _pos_array[2] + GAME_HEIGHT*0.5
	var _id = mycon_button_toggle(_x, _y, , , , "Enable Audio", true, TOGGLE_ENUM.ENABLE_MASTER_AUDIO, true, s_9sclice_c_black)
	ds_list_add(button_list, _id)

	// Slider Audio
	var _x = GAME_WIDTH*0.5
	var _y = _pos_array[3] + GAME_HEIGHT*0.5
	var _id = mycon_button_slider(_x, _y, , GAME_WIDTH*0.18, GAME_HEIGHT*0.11, s_slider, s_slider_handle, 8, 12, , "Master Volume:",
								  SLIDER_ENUM.VOLUME_MASTER, s_9sclice_c_black, true)
	ds_list_add(button_list, _id)
	
	
}



my_play_audio(so_pause_1, global.ae_sfx)
