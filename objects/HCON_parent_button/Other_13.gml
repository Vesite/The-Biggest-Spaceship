/// @desc Click the button (One time)

current_subimage = 2 // Click
button_content_y_offset = 2

// Clicking effect
event_user(9)

// Sound
var _s = choose(so_tap_1, so_tap_2, so_tap_3)
my_play_audio(_s, global.ae_sfx, , false, 1, 0.15, 1)
