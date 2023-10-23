/// @description Domain Elite
randomize();
var _chosen_enemy = choose(obj_enemy_orbiter, obj_enemy_double, obj_enemy_magnet)
lose_condition = instance_nearest(x,y,parent_ship);
switch(_chosen_enemy){
	case obj_enemy_orbiter: 
		win_condition = summon_enemy_orbiter(global.lvl + 5);
		win_condition2 = win_condition.duo;
		break;
	case obj_enemy_double: 
		win_condition = summon_enemy_double(global.lvl + 5);
		break;
	case obj_enemy_magnet: 
		win_condition = summon_enemy_magnet(global.lvl + 5);
		break;
}
