
// Make the object a Singleton
if (assign_singleton() == false) exit

window_set_cursor(cr_none)

spawn_timer_max = 20
spawn_timer = spawn_timer_max
global.zoom_out_amount = 1
global.sound_cd_collision_sound = 0
global.times_upgraded = 0
global.player_ship_sound = noone
global.zoom_sound = noone

// Units
#macro SQUARE_KILOMETERS (1000*1000)
#macro SQUARE_LIGHTSECONDS (299792458*299792458)

#macro AREA_FOOTBALL_FIELD 5352
#macro AREA_CENTRAL_PARK 3625000
#macro AREA_TOKYO 2190*SQUARE_KILOMETERS
#macro AREA_CANADA 9984670*SQUARE_KILOMETERS
#macro AREA_EARTH 510064472*SQUARE_KILOMETERS
#macro AREA_JUPITER 61418738571*SQUARE_KILOMETERS
#macro AREA_SUN 6078747774547*SQUARE_KILOMETERS

area_landmarks_array = [[AREA_FOOTBALL_FIELD, "Your spaceship has surpassed the size of a football field\n(" + string(AREA_FOOTBALL_FIELD) + " m^2)"],
						[AREA_CENTRAL_PARK, "Your spaceship has surpassed the size of Central Park, New York\n(" + string(AREA_CENTRAL_PARK) + " m^2)"],
						[AREA_TOKYO, "Your spaceship has surpassed the size of Tokyo\n(" + string(AREA_TOKYO/SQUARE_KILOMETERS) + " km^2)"],
						[AREA_CANADA, "Your spaceship has surpassed the size of Canada\n(" + string(AREA_CANADA/SQUARE_KILOMETERS) + " km^2)"],
						[AREA_EARTH, "Your spaceship has surpassed the size of Earth\n(" + string(AREA_EARTH/SQUARE_KILOMETERS) + " km^2)"],
						[AREA_JUPITER, "Your spaceship has surpassed the size of Jupiter\n(" + string(AREA_JUPITER/SQUARE_KILOMETERS) + " km^2)"],
						[AREA_SUN, "Your spaceship has surpassed the size of the Sun\n(" + string(AREA_SUN/SQUARE_KILOMETERS) + " km^2)"]]

draw_trivia_timer_max = 60*9
draw_trivia_timer = draw_trivia_timer_max
current_trivia_text = ""
