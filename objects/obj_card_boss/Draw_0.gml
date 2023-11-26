draw_self();

switch(global.trialtype){
	case TRIAL.BLADE: sprite_index = spr_card_red_blade; break;
	case TRIAL.DECIMATION: sprite_index = spr_card_spears; break;
	default: sprite_index = spr_card_red_blade; break;	
}

draw_set(fnt_boss_hb, fa_center, fa_bottom, c_red);
draw_text_scribble(x, y - 1, "[scale, 0.8]BOSS - LV " + string(global.lvl));