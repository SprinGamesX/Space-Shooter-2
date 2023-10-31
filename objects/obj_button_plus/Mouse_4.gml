/// @description 
if (obj_ship.is_bonus_updateable(index) and global.upgrade_points > 0){
	obj_ship.update_bonus(index);
	global.upgrade_points--;
}
else {
	shaking = true;
	alarm[0] = seconds(0.5);
}
