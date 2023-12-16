// scale menu according to options
var new_w = 0;
for (var i = 0; i < op_length; i++){
	
	var _op_w = string_width(options[level,i]);
	new_w = max(new_w, _op_w);
}
width = new_w + op_border*2;
height = op_border*2 + string_height(options[level,0]) + (op_length - 1)* op_space;

// center menu
x = camera_get_view_x(view_camera[0]) + global.screen_width/2 - width/2;
y = camera_get_view_y(view_camera[0]) + global.screen_height/2 - height/2;


draw_sprite_stretched_ext(sprite_index, image_index, x, y, width, height, c_blue, alpha);

draw_set(fnt_menus, fa_left, fa_top,, alpha);

for (var i = 0; i < op_length; i++){
	
	var _c = "[c_white]";
	if (i == pos) _c = "[c_purple]";
	draw_text_scribble(x + op_border, y + op_border + op_space * i, _c + options[level,i]);
	
}