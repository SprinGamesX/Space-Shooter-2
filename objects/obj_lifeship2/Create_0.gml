event_inherited();
charged = false;
base_atk = atk;

basic_attack = function(){
	if(!charged){
		create_projectile(obj_life_plank, atk_scale, 10, self, 3, x + 5, y);
		create_projectile(obj_life_plank, atk_scale, -10, self, 3, x + 5, y);
	}
	else{
		create_projectile(obj_life_charged_plank, skill_scale, 0, self, 4, x + 5, y, 3, 1);
	}
}

skill = function(){
	alarm[0] = seconds(19.5);
	var _hp = (max_hp / 5);
	if (hp > _hp) hp -= _hp;
	else hp = 1;
	charged = true;
	atk = atk + (hp / 2);
}

ultimate = function(){
	var _enemy;
	var _num = 0;
	screen_flash();
	for (var _i = 0; _i < ds_list_size(global.enemylist); ++_i;)
	{
		var _e = global.enemylist[|_i];
		create_healing_orb(_e.x, _e.y, (max_hp / 20), 5);
		apply_status(_e, STATUS.DMG_AMP, 2, seconds(10), 1);
	}
	
	
}