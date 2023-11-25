on_click = function(){
	global.current_domain_type = DOMAIN_TYPE.TEST;
	transition_start(rm_existing_run, seq_fade_out, seq_fade_in);
	
}