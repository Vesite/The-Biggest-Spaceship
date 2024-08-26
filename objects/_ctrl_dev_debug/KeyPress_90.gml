/// @description Teleport to biggest ship

var _biggest_id = noone
var _biggest_width = -1
with (ingame_thing_ai) {
	if id.sprite_width > _biggest_width and id.sprite_width > global.player_id.sprite_width {
		_biggest_id = id
		_biggest_width = id.sprite_width
	}
}

if _biggest_id != noone {
	global.player_id.x = _biggest_id.x
	global.player_id.y = _biggest_id.y
}
