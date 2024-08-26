/// @description

if not DEV exit

if keyboard_check_pressed(vk_space) {
	zoom_timer = zoom_timer_max
}

zoom_timer = max(zoom_timer - 1, 0)

zoom_game(easeOutSine(zoom_timer/zoom_timer_max)/60)
