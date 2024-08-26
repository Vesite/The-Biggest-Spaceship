
// Player
global.player_id = mycon_thing(GAME_WIDTH/2, GAME_HEIGHT/2, true, SHIP_SPRITE.CRUISER, 1.5, 0)
global.ship_width = global.player_id.sprite_width
global.ship_height = global.player_id.sprite_height

with (instance_create_layer(0, 0, "Instances_Background", background_drawing)) {
	draw_style = DRAW_TYPE.STARS_SMALL
	event_user(0)
}

with (instance_create_layer(0, 0, "Instances_Background", background_drawing)) {
	draw_style = DRAW_TYPE.STARS_BIG
	event_user(0)
}

with (instance_create_layer(0, 0, "Instances_Background", background_drawing)) {
	draw_style = DRAW_TYPE.NEBULA
	event_user(0)
}
