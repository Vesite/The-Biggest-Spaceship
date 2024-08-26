
/*
Give a value from 0 to 1 and set the sliders related global variable
*/
function slider_set_value(_slider_enum, _value) {
	
	switch (_slider_enum) {
		case SLIDER_ENUM.VOLUME_MASTER:
			global.master_audio_volume = _value
		break

	}
	
}

/*
Will return a value from 0 to 1
*/
function slider_get_value(_slider_enum) {
	
	var _a = 0
	
	switch (_slider_enum) {
		case SLIDER_ENUM.VOLUME_MASTER:
			_a = global.master_audio_volume
		break
	}
	
	return _a
	
}

