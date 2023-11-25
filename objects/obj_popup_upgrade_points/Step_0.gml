if (keyboard_check_pressed(ord("Y"))){
	instance_destroy();
	if (global.coins >= cost){
		global.coins -= cost;
		global.upgrade_points += slider;
		obj_coins.save_coins();
		obj_upgrade_points.save_coins();
	}
}
if (keyboard_check_pressed(ord("N"))){
	instance_destroy();
}
update();