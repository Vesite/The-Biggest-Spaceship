/// @desc Draw everything

event_inherited()

// Text
var _x = x
var _y = y + button_content_y_offset
draw_text_shadow(_x, _y + 3, text, 1, c_white, 1, UI_PIXEL_SCALE)
