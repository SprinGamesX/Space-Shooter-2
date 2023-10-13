if (ulting) and (ult_stage == 2){
	alarm[1] = seconds(0.3);
	randomize();
	for(var _i = 0; _i < 3; _i++)
		summon_enemy_bladie(x, y, dmg, 0.1, false, random_range(-0.7, 0.7))
}