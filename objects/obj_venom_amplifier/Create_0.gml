event_inherited();
on_hit = function(_enemy){
	apply_status(_enemy, STATUS.POISON_AMP, 2, seconds(10), 0.25);
}