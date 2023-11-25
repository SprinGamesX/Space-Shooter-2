/// @description Domain Elite
randomize();
lose_condition = instance_nearest(x,y,parent_ship);
var _chosen_enemy = get_elite_for_trial();
summon_chosen_elite(_chosen_enemy, global.lvl * 2);