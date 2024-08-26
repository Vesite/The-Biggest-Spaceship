// Do the transition from one room to another
// Check if "transition_mode" is anything but "OFF"

if (transition_mode != TRANSITION_MODE.OFF) {	
	
	// While we are in a transition
	global.paused = true
	var _val_change = 1/(trans_spd)
	
	if (transition_mode == TRANSITION_MODE.INTRO) {
		percent = approach(percent, 0, _val_change) // Fade "in"
	} else {
		percent = approach(percent, 1.1, _val_change) // Fade "out"
	}
	
	// Check if no transition this is going on!
	if (percent == 1.1) or (percent == 0)
	{
		
		switch (transition_mode)
		{
			case TRANSITION_MODE.INTRO:
			{
				global.paused = false
				transition_mode = TRANSITION_MODE.OFF
				break
			}
			case TRANSITION_MODE.GOTO:
			{
				transition_mode = TRANSITION_MODE.INTRO
				room_goto(target_room)
				break
			}
		}  
	}
}
