/// @desc Domain combat
randomize();
var _chosen_enemy = choose(obj_enemy_orbiter, obj_enemy_double)
lose_condition = instance_nearest(x,y,parent_ship);
switch(_chosen_enemy){
	case obj_enemy_orbiter: 
		win_condition = summon_enemy_orbiter(global.lvl);
		win_condition2 = win_condition.duo;
		break;
	case obj_enemy_double: 
		win_condition = summon_enemy_double(global.lvl);
		break;
}
