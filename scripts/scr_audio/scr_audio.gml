
function set_song_ingane(_song, _fade_out_current_song_frames=0, _fade_in_frames=0, _song_overlap=false) {
	
	with (_ctrl_audio) {
		next_song_asset = _song
		end_fade_out_time = _fade_out_current_song_frames
		start_fade_in_time = _fade_in_frames
		song_overlap = _song_overlap
	}
	
}

function my_play_audio(_sound, _emitter=global.ae_sfx, _priority=5, _loop=false, _pitch=1.0, _pitch_vary=0, _gain=1.0) {

	var _sound_params = {
		sound: _sound,
		priority: _priority,
		loop: _loop,
		gain: _gain,
		pitch: random_range(_pitch - _pitch_vary, _pitch + _pitch_vary),
		emitter: _emitter,
	}
	
	return audio_play_sound_ext(_sound_params)
	
}
