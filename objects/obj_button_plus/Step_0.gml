if(!instance_exists(parent)){
	instance_destroy();
}
if (!obj_ship.is_bonus_updateable(index)){
	image_alpha = 0.5;
}
else image_alpha = 1;

if (shaking){
	var _mag = 1;
	x = start_x + random_range(-_mag,_mag);
	y = start_y + random_range(-_mag,_mag);
}
else {
	if (x != start_x) x = start_x;
	if (y != start_y) y = start_y;
}