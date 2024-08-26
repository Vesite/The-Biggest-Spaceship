/*
Only Dev object
*/

// Make the object a Singleton
if (assign_singleton() == false) exit

if (not DEV) { instance_destroy() }

zoom_timer_max = 54
zoom_timer = 0
