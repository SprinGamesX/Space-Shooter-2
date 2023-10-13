if (skilling){
	alarm[0] = seconds(0.2);
	var _d = dir + 180;
	var _x = x + lengthdir_x(64, _d);
	var _y = y + lengthdir_y(64, _d);
	summon_enemy_bladie(_x, _y, dmg, 0.1, true);	
}