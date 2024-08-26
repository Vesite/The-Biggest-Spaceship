/// @description Start Audio

my_play_audio(so_sfx_game_start)
my_play_audio(so_mu_galactic_temple, global.ae_sfx, 1, true)
global.player_ship_sound = my_play_audio(so_sfx_ship_movement, global.ae_sfx, 10, true)
global.zoom_sound = my_play_audio(so_sfx_zoom_out, global.ae_sfx, 10, true, 1, 0, 0)
