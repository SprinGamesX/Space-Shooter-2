if (keyboard_check_pressed(ord("Y"))){
	if (global.coins >= price) and (obj_ship.lvl < 100){
		global.coins -= price;
		obj_ship.update_level();
		update_price();
	}
}
if (keyboard_check_pressed(ord("N"))){
	instance_destroy();
}