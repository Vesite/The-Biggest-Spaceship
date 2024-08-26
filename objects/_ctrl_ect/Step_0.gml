/// @description Spawn "ingame_thing_ai"

/*
Basically spawn a good amount of the "ingame_thing_ai" constantly off screen
spawn them in an area around the player
And if any "ingame_thing_ai" is outside of that area it gets destroyed
Spawn them with random scale
*/

if P exit

global.sound_cd_collision_sound = max(global.sound_cd_collision_sound - 1, 0)

spawn_timer = max(spawn_timer - 1, 0)
if spawn_timer == 0 {
	
	var _left_x = camera_get_view_x(view_camera[0])
	var _top_y = camera_get_view_y(view_camera[0])
	
	spawn_timer = spawn_timer_max
	if instance_number(ingame_thing) < 100 {
		
		var _x = choose(irandom_range(_left_x - GAME_WIDTH, _left_x), irandom_range(_left_x + GAME_WIDTH, _left_x + GAME_WIDTH*2))
		
		var _y = choose(irandom_range(_top_y - GAME_HEIGHT, _top_y), irandom_range(_top_y + GAME_HEIGHT, _top_y + GAME_HEIGHT*2))
		
		var _sprite_enum = ALL_SHIPS_RANDOM
		var _data_array = data_from_ship_sprite_enum(_sprite_enum)
		var _sprite = _data_array[0]
		var _size_max = GAME_WIDTH*1.2
		var _size_min = GAME_WIDTH/15
		
		var _size = random_range(_size_max, _size_min)
		var _scale = _size/(sprite_get_width(_sprite) + sprite_get_height(_sprite))
		var _id = mycon_thing(_x, _y, false, _sprite_enum, _scale, 0)
		
		with (_id) {
			if place_meeting(x, y, parent_ingame) {
				instance_destroy()	
			}
			
			x_speed = random_range(10, -10)
			y_speed = random_range(10, -10)
		}
		
	}
	
	// Delete them if they are ouside the view
	with (ingame_thing) {
		if id != global.player_id {
			// How many screen sizes it needs to go extra after the spawn area to despawn
			var _dist_to_despawn = 0
		
			if (x < (_left_x - GAME_WIDTH) - GAME_WIDTH*_dist_to_despawn)
			or (x > (_left_x + GAME_WIDTH*2) + GAME_WIDTH*_dist_to_despawn)
			or (y < (_top_y - GAME_HEIGHT) - GAME_HEIGHT*_dist_to_despawn)
			or (y > (_top_y + GAME_WIDTH*2) - GAME_HEIGHT*_dist_to_despawn) {
			
				instance_destroy()
				
			}
		}
	}
}
