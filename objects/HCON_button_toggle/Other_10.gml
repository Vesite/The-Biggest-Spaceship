
event_inherited()

var _tbox_w = sprite_get_width(s_toggle_16x)
var _string_w = (string_width(text) + 24)*UI_PIXEL_SCALE

// Text
var _x = x - (24 + _tbox_w)/2
var _y = y + button_content_y_offset
draw_text_shadow(_x, _y, text, 1, c_white, 1, UI_PIXEL_SCALE)

var _toggle_on = true

switch (toggle_enum) {
	case TOGGLE_ENUM.ENABLE_MASTER_AUDIO:
		_toggle_on = global.master_audio_enable
	break;
	case TOGGLE_ENUM.ENABLE_SFX:
		_toggle_on = global.sfx_enable
	break;
	case TOGGLE_ENUM.ENABLE_MUSIC:
		_toggle_on = global.music_enable
	break;
	case TOGGLE_ENUM.ENABLE_FULLSCREEN:
		_toggle_on = window_get_fullscreen()
	break
}

if _toggle_on {
	var _subimg = 1 // On
} else {
	var _subimg = 0 // Off	
}

// Draw the sprite
draw_sprite(s_toggle_16x, _subimg, x - width/2 + _string_w + _tbox_w/2 - 10, y + button_content_y_offset)
