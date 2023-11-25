draw_bg_box(x - 125 , y - 14, 250, 40, c_maroon);
draw_bg_box(16, 48, 32, 200, c_maroon, 1);

draw_self();

set_trial();

switch(global.trialtype){
	case TRIAL.BLADE: 
		trial_name = "TRIAL OF THE BLADE";
		subtext = "[scale,0.7]recommanded elements:\n[scale,0.75][spr_element_icons,0] [spr_element_icons,3]";
					break;
	case TRIAL.DECIMATION: 
		trial_name = "TRIAL OF DECIMATION";
		subtext = "[scale,0.7]recommanded elements:\n[scale,0.75][spr_element_icons,2] [spr_element_icons,4]"
		break;
	case TRIAL.BALANCE:
		trial_name = "TRIAL OF BALANCE";
		subtext = "[scale,0.7]recommanded elements:\n[scale,0.75][spr_element_icons,1] [spr_element_icons,2] [spr_element_icons,4]"
		break;
}
draw_set(fnt_boss_hb, fa_center, fa_middle, c_red, 1);
draw_text_scribble(x, y + 16, trial_name);
draw_set(fnt_boss_hb, fa_left, fa_top, c_white, 1);
draw_text_scribble(10, 5, subtext);