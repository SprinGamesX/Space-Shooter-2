if (ult_count > 0){
	alarm[1] = seconds(0.05);
	create_projectile(obj_iceshard3, ult_scale, 0, self, 10, x, random_range(y - 100, y + 100));
	ult_count--;
}
else { ult_count = 40;}