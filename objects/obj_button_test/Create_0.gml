on_click = function(){
	global.current_domain_type = DOMAIN_TYPE.TEST;
	transition_start(rm_test_battle, seq_fade_out, seq_fade_in);
	
}