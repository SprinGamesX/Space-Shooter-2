event_inherited();
element = ELEMENTS.ICE;

on_hit = function(_enemy){
	apply_status(_enemy, STATUS.DMG_AMP, 0.5, seconds(5), 0.1);
}