/// @desc After Init

// Set size-varaibles for the left box
if text != "" {
	// If we have text have the size fit the text
	left_box_width = (string_width(text) + 12)*UI_PIXEL_SCALE
} else if icon_sprite != s_nothing {
	left_box_width = sprite_get_width(icon_sprite) + 6
} else {
	left_box_width = -delta
}

left_box_height = height*0.8
width = delta + left_box_width + delta + slider_width + delta*1.5

// Set the slider-handles position to be correct
var _val = slider_get_value(slider_enum)
var _slider_x_left = x - width/2 + delta + left_box_width + delta

slider_handle_x = _slider_x_left + slider_width*_val
