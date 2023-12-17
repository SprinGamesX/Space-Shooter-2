/// @description Insert description here
// You can write your code in this editor
if (explosions > 0){
	
	create_aoe_direct(ult_scale / 10, 4, ELEMENTS.FIRE, random_range(20, room_width - 20), random_range(20, room_height - 20),,self);
	alarm[0] = seconds(0.1);
	explosions--;
	screenshake(seconds(0.2), 0.3, 0.05);
}
else {
	var _enemy = instance_nearest(x, y, parent_elite_enemy);
	var _dmgbonus = min(kills * 0.05, 1);
	if (instance_exists(_enemy)){
		create_aoe_direct(ult_scale + _dmgbonus, 20, ELEMENTS.FIRE, _enemy.x, _enemy.y,,self);
		screenshake(seconds(1.5), 1, 0.01);
	}
	resume_all_enemys();
	kills = 0;
}





