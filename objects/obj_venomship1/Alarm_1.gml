if (ult_uses > 0){
	ult_uses--;
	alarm[1] = seconds(0.2);
	create_projectile(obj_venom_seeking_needle, ult_scale, 0, self, 3, x + 5,,,1);
	create_projectile(obj_venom_seeking_needle, ult_scale, 0, self, 3, x + 5, y + 6,,0.5);
	create_projectile(obj_venom_seeking_needle, ult_scale, 0, self, 3, x + 5, y - 6,,0.5);
}