
function toggle_value_from_enum(_toggle_enum) {
	
	switch (_toggle_enum) {
		case TOGGLE_ENUM.ENABLE_MASTER_AUDIO:
			global.master_audio_enable = !global.master_audio_enable
		break;
		case TOGGLE_ENUM.ENABLE_SFX:
			global.sfx_enable = !global.sfx_enable
		break;
		case TOGGLE_ENUM.ENABLE_MUSIC:
			global.music_enable = !global.music_enable
		break;
		case TOGGLE_ENUM.ENABLE_FULLSCREEN:
			window_set_fullscreen(!window_get_fullscreen())
			with (_ctrl_ect) { alarm[0] = 10 }
			
		break;
	}
	
}

