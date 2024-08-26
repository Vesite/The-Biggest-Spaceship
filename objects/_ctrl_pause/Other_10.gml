/// @desc End Pause

global.paused = false

// Destroy all buttons in "button_instance_list"
for (var _i = 0; _i < ds_list_size(button_list); _i++) {
		
	var _id = ds_list_find_value(button_list, _i)
	instance_destroy(_id)
}
ds_list_clear(button_list)

can_esq_remove_pause = false


