/// @description Insert description here
// You can write your code in this editor


speed = 2;
alpha = 0;

on_create = function(_target_x, _target_y, _element, _dis){
	xx = _target_x;
	yy = _target_y;
	color = color_for_element(_element);
	image_blend = color;
	x = xx + random_range(-_dis, _dis);
	y = yy + random_range(-_dis, _dis);
	echo = make_echo();
}

track = function(){
	var dir = point_direction(x, y, xx, yy);
	direction = dir;
	
	if (num_in_range(x, xx - 3, xx + 3) and num_in_range(y, yy - 3, yy + 3)) instance_destroy();
}



