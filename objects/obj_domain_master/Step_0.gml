if (!instance_exists(win_condition)) and (!instance_exists(win_condition2)){
	alarm[10] = seconds(2);
	win_condition = self;
	display_time = false;
}
if (!instance_exists(lose_condition)){
	alarm[9] = seconds(2);
	lose_condition = self;
	display_time = false;
}

if (global.current_domain_type == DOMAIN_TYPE.TIME){
	time--;
	if (time <= time_limit){
		instance_destroy(parent_follower)
		instance_destroy(parent_ship);
		instance_destroy(obj_team_manager);
	}
	
}