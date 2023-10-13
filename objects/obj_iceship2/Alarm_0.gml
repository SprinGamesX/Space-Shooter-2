if (skill_count > 0){
	alarm[0] = seconds(0.1);
	create_projectile(obj_iceshard3, skill_scale, 0, self, 10);
	skill_count--;
}
else { skill_count = 10;}