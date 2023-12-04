if (charge > 0){
	charge--;
	create_projectile(obj_fireball1, scaling, direction, source, 5,,,2,0.5);
	alarm[0] = seconds(0.1);
}