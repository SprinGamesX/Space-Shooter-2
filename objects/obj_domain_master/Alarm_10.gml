/// @description won battle
randomize();
global.reward += (irandom_range(100, 500) * global.lvl);
if (global.current_domain_type == DOMAIN_TYPE.ELITE) global.reward *= 2;
if (global.current_domain_type == DOMAIN_TYPE.TIME) global.reward *= 2;
if (global.current_domain_type == DOMAIN_TYPE.BOSS){
	global.reward += (irandom_range(1000, 5000) * global.lvl);
	global.pending_reset = true;
	delete_latest_run_file();
	transition_start(rm_trial_selection, seq_fade_out, seq_fade_in);
}
else{
	global.game_won = true;
	transition_start(rm_domain_roadmap, seq_fade_out, seq_fade_in);
}


