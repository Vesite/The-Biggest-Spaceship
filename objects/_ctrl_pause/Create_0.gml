
// Make the object a Singleton
if (assign_singleton() == false) exit

global.paused = true

button_list = ds_list_create()

text_scale = 6

// Some menus we can quit with this, some not.
can_esq_remove_pause = false
