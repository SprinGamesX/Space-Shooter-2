/// @description background stuff
randomize();

if (!layer_exists("Back")) layer_create(500, "Back");

var dir = 2;
var _x = 0;
var _y = 0;
switch(dir){
	case 0: _x = -20; _y = random_range(20, room_height - 20); break;
	case 2: _x = room_width + 20; _y = random_range(20, room_height - 20); break;
	case 3: _y = -20; _x = random_range(20, room_width - 20); break;
	case 1: _y = room_height + 20; _x = random_range(20, room_width - 20); break;
}

with(instance_create_layer(_x, _y, "Back", obj_menu_enemy)){
	speed = random_range(1, 3);
	direction = 180;
}


alarm[0] = seconds(0.2);