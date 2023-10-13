if (skill_uses > 0){
	skill_uses--;
	alarm[0] = seconds(0.1);
	create_projectile(obj_venom_seeking_needle, skill_scale, 0, self, 3, x + 5,,,,1);
}