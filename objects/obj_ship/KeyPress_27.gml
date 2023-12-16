if (room = rm_battle){
	if (!instance_exists(obj_mid_game_settings)){
		instance_deactivate_all(true);
		instance_create_depth(0, 0, -999, obj_mid_game_settings);
		pause_all_enemys();
		
	}
}
else if (!instance_exists(obj_settings)){
	instance_create_depth(0, 0, -999, obj_settings);
}
