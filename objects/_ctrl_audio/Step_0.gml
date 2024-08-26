
// Check until the system is initialised
if !audio_initialised and audio_system_is_initialised() and audio_system_is_available() {
    audio_initialised = true
    
    // First-time initialization
    global.ae_sfx = audio_emitter_create()
	global.ae_music = audio_emitter_create()
	
	alarm[0] = 60
}
if not audio_initialised exit

var _m = global.master_audio_volume

if global.sfx_enable and global.master_audio_enable
	audio_emitter_gain(global.ae_sfx, global.sfx_volume*_m)
else
	audio_emitter_gain(global.ae_sfx, 0)

if global.music_enable and global.master_audio_enable
	audio_emitter_gain(global.ae_music, global.music_volume*_m)
else
	audio_emitter_gain(global.ae_music, 0)