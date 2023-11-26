event_inherited();

on_click = function(){
	if (room == rm_domain_selection){
		obj_level_maker.reset();
	}
	transition_start(rm_main_menu, seq_fade_out, seq_fade_in);
}