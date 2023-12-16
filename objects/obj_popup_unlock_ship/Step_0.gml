if (keyboard_check_pressed(ord("Y"))){
	if (global.coins >= price){
		global.coins -= price;
		obtain_ship(obj_ship.ship_index);
	}
	instance_destroy();
}
if (keyboard_check_pressed(ord("N"))){
	instance_destroy();
}