/// @description 

timer = max(timer - 1, 0)
var _a = ((timer/timer_max))*0.4

// Define the replacement color
var replaceColor = draw_col

// Convert the color to a format usable by the shader
var replaceColorVec = [color_get_red(replaceColor) / 255, color_get_green(replaceColor) / 255, color_get_blue(replaceColor) / 255]

// Apply the shader
shader_set(sh_change_color)

// Set the uniform for the replacement color
shader_set_uniform_f_array(shader_get_uniform(sh_change_color, "u_replaceColor"), replaceColorVec)

draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, _a)
draw_sprite_ext(sprite_index, 2, x, y, image_xscale, image_yscale, image_angle, c_white, _a)

shader_reset()

if timer == 0 {
	instance_destroy()	
}
