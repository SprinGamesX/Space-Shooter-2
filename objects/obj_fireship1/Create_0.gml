event_inherited();

skill_pulses = 5;
ult_overdrive_time = seconds(10);
overdrive = false;
proj = obj_fireball1;


basic_attack = function(){
	if (overdrive){
		atk_cd = max_atk_cd / 2;
		create_projectile(proj, ult_scale, 0, self, 5, x, y + 5);
		create_projectile(proj, ult_scale, 0, self, 5, x, y - 5);
		create_projectile(proj, atk_scale, -10, self, 5, x, y + 7);
		create_projectile(proj, atk_scale, 10, self, 5, x, y - 7);
	}
	else {
		atk_cd = max_atk_cd;
		create_projectile(proj, atk_scale, 0, self, 4, x, y + 5);
		create_projectile(proj, atk_scale, 0, self, 4, x, y - 5);
	}
}

skill = function(){
	alarm[0] = 1;
}

ultimate = function(){
	overdrive = true;
	alarm[1] = ult_overdrive_time;
}