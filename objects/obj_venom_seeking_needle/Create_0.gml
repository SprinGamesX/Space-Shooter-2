event_inherited();
on_hit = function(_enemy){
	apply_status(_enemy, STATUS.POISON_AMP, 0.5, seconds(10), 0.1, true);
	apply_status_elemental(_enemy, STATUS.POISON, 1, 2);
}