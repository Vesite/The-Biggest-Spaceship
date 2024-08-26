/*
Audio Variables
Music & Ambiance
Audio Emitters
*/

// Make the object a singleton
if (assign_singleton() == false) exit

global.master_audio_enable = true
global.master_audio_volume = 1

global.sfx_enable = true
global.sfx_volume = 1

global.music_enable = true
global.music_volume = 1

// Initially, the audio system is not initialised
audio_initialised = false
global.ae_sfx = -1
global.ae_music = -1
