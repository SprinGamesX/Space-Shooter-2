event_inherited();
passive_cd = seconds(0.1);
passive_max_cd = passive_cd;

explosions = 10;

basic_attack = function(){
	for (var i = -10; i <= 10; i += 5){
		create_projectile(obj_fireball1, atk_scale/5, i, self, 5,,,,1,2);
	}
}

skill = function(){
	create_projectile(obj_fire_missile, skill_scale/3, -5, self, 5,,,3,1,2);
	create_projectile(obj_fire_missile, skill_scale/3, 0, self, 5,,,3,1,2);
	create_projectile(obj_fire_missile, skill_scale/3, 5, self, 5,,,3,1,2);
}

ultimate = function(){
	alarm[0] = 1;
	explosions = kills;
	pause_all_enemys();
}

passive = function(){
	if (passive_cd > 0) passive_cd--;
	else {
		var _dis = random_range(50, 75);
		var _dir = random(360);
		var xx = x + lengthdir_x(_dis, _dir);
		var yy = y + lengthdir_y(_dis, _dir);
		create_aoe_direct(0.5, 2, ELEMENTS.FIRE, xx, yy,,self);
		passive_cd = passive_max_cd;
	}
}