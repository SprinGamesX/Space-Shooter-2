event_inherited();
image_xscale = 2;
image_yscale = 2;

on_click = function(){
	if (room = rm_menu_team){
		transition_start(rm_trial_selection, seq_fade_out, seq_fade_in);
	} else {
		transition_start(rm_main_menu, seq_fade_out, seq_fade_in);
	}
	
}