event_inherited();
attack_index = 0;
max_atk_cd2 = max_atk_cd * 2;
target = noone;
dir = 0;
ult_num = 20;

basic_attack = function(){
	switch(attack_index){
		case 0: 
		create_projectile(obj_iceshard2, atk_scale / 4, -5, self, 7, x + 12,,,,0);
		create_projectile(obj_iceshard2, atk_scale / 4, 0, self, 7, x + 12,,,,0);
		create_projectile(obj_iceshard2, atk_scale / 4, 5, self, 7, x + 12,,,,0);
		break;
		case 1:
		create_projectile(obj_iceshard4, atk_scale / 2, 0, self, 7, x + 12);
		break;
		case 2:
		create_projectile(obj_icesword, atk_scale, 0, self, 4,,,,1);
		atk_cd = max_atk_cd2;
		break;
	}
}

skill = function(){
	attack_index++;
	if (attack_index > 2){
		attack_index = 0;
	} 
}

ultimate = function(){
	target = instance_nearest(x, y, parent_elite_enemy);
	dir = 0;
	ult_num = 5;
	pause_all_enemys();
	alarm[0] = seconds(0.05);
}