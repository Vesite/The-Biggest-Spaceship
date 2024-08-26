
// Make the object a Singleton
if (assign_singleton() == false) exit

#region Draw everything to a 1080p surface

	window_set_size(display_get_width()/2, display_get_height()/2)
	
	window_set_fullscreen(true)

	surface_resize(application_surface, GAME_WIDTH, GAME_HEIGHT)

	display_set_gui_size(GAME_WIDTH, GAME_HEIGHT)
	
#endregion
