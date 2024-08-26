/// @description 

// Define the replacement color
var replaceColor = draw_col

// Convert the color to a format usable by the shader
var replaceColorVec = [color_get_red(replaceColor) / 255, color_get_green(replaceColor) / 255, color_get_blue(replaceColor) / 255]

// Apply the shader
shader_set(sh_change_color)

// Set the uniform for the replacement color
shader_set_uniform_f_array(shader_get_uniform(sh_change_color, "u_replaceColor"), replaceColorVec)

draw_sprite_ext(sprite_data_array[0], 1, x, y, image_xscale, image_yscale, image_angle, c_white, 1)

draw_sprite_ext(sprite_data_array[0], 0, x, y, image_xscale, image_yscale, image_angle, c_white, 1)

var _scale = (sprite_width + sprite_height)/100
draw_sprite_ext(s_red_square, 0, x, y, _scale, _scale, current_time/5, c_white, 1)
draw_sprite_ext(s_red_square, 0, x, y, _scale*0.66, _scale*0.66, -current_time/4, c_white, 1)
draw_sprite_ext(s_red_square, 0, x, y, _scale*0.33, _scale*0.33, current_time/3, c_white, 1)

if id == global.player_id {
	outside_ship_alpha += 0.004
	outside_ship_alpha = min(outside_ship_alpha, 1)
} else {
	outside_ship_alpha = 0
}
draw_sprite_ext(sprite_data_array[1], 2, x, y, image_xscale, image_yscale, image_angle, c_white, outside_ship_alpha)

shader_reset()
