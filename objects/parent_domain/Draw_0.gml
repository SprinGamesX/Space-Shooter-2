if (accessable) {
	image_alpha = 1
	if (instance_exists(obj_menu_player)) and (!obj_menu_player.moving)
		draw_line_width_color(x, y, obj_menu_player.x, obj_menu_player.y, 2, c_red, c_maroon);	
}
else if(global.currentfloor >= floore) image_alpha = 0.1;
else image_alpha = 0.5;
draw_self();