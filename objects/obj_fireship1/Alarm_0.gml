if (skill_pulses > 0){
	alarm[0] = seconds(1);
	for (var _i =0; _i < 360; _i += 20){
		create_projectile(proj, skill_scale, _i, self, 7);
	}
	skill_pulses--;
}
else {
	skill_pulses = 5;
}