if (index == 0){
	buttons[1].deactivate();
}
else buttons[1].activate();

if (index == options - 1){
	buttons[0].deactivate();
}
else buttons[0].activate();

if (instance_exists(parent_pop_up)){
	buttons[0].deactivate();
	buttons[1].deactivate();
}

obj_ship.update_index(index);

for (var i = 0; i < 30; i++){
	var _r = (room_width / 2) + 100;
	var _dir = random(360);
	var _x = room_width / 2 + lengthdir_x(_r, _dir);
	var _y = room_height / 2 + lengthdir_y(_r, _dir);
	_dir -= 180;
	part_type_size(part, 1, 2, -0.01, 0);
	part_type_color_hsv(part, 0, 255, 0, 100, 255, 255);
	part_type_direction(part, _dir, _dir, 0, 2);
	part_type_orientation(part, _dir, _dir, 0, 0, 0);
	part_particles_create(part_sys, _x, _y, part, 1);
}




