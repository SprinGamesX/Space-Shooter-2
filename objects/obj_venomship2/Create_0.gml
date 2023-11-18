event_inherited();

attack_index = 0;
og_atk = atk;

basic_attack = function(){
	if (attack_index == 0) or (attack_index == 2){
		create_projectile(obj_venom_ball, atk_scale, -5, self, 3, x, y + 10,,1);
		create_projectile(obj_venom_ball, atk_scale, 0, self, 3, x, y + 10,,1);
		create_projectile(obj_venom_ball, atk_scale, 5, self, 3, x, y + 10,,1);
	}
	if (attack_index == 1) or (attack_index == 2){
		create_projectile(obj_venom_ball, atk_scale, -5, self, 3, x, y - 10,,1);
		create_projectile(obj_venom_ball, atk_scale, 0, self, 3, x, y - 10,,1);
		create_projectile(obj_venom_ball, atk_scale, 5, self, 3, x, y - 10,,1);
	}
	
	attack_index++;
	if (attack_index > 2) {
		attack_index = 0;
		atk_cd = max_atk_cd * 1.5;
	}
}

skill = function(){
	create_projectile(obj_venom_amplifier, skill_scale, 0, self, 3, x + 10, y,2, 1);
}

ultimate = function(){
	instance_create_layer(0, 0, "SpecialEffects", obj_venom_blackhole);
	screenshake(seconds(2), 0.5, 0.02);
}