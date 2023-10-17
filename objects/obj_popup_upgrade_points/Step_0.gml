if (keyboard_check_pressed(ord("Y"))){
	instance_destroy();
	if (global.coins >= 5000){
		global.coins -= 5000;
		global.upgrade_points += 1;
		obj_coins.save_coins();
		obj_upgrade_points.save_coins();
	}
}
if (keyboard_check_pressed(ord("N"))){
	instance_destroy();
}