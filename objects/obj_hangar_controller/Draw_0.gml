var _obtained = c_white;
if (!global.obtained_ships[index]) _obtained = c_dkgrey;

draw_sprite_ext(object_get_sprite(global.ships[?index]), 0, room_width / 4, room_height / 2, 4, 4, 0 , _obtained, 1);
draw_line_width_color(room_width / 2, -10, room_width / 2, room_height + 20, 5, color, color);