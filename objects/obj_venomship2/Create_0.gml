event_inherited();
basic_attack = function(){
	create_projectile(obj_venom_ball, atk_scale, -5, self, 3, x, y + 10,,1);
	create_projectile(obj_venom_ball, atk_scale, 0, self, 3, x, y + 10,,1);
	create_projectile(obj_venom_ball, atk_scale, 5, self, 3, x, y + 10,,1);
	
	create_projectile(obj_venom_ball, atk_scale, -5, self, 3, x, y - 10,,1);
	create_projectile(obj_venom_ball, atk_scale, 0, self, 3, x, y - 10,,1);
	create_projectile(obj_venom_ball, atk_scale, 5, self, 3, x, y - 10,,1);
}

skill = function(){
	create_projectile(obj_venom_amplifier, skill_scale, 0, self, 3, x + 10, y,2, 1);
}

ultimate = function(){
	instance_create_layer(0, 0, "SpecialEffects", obj_venom_blackhole);
}