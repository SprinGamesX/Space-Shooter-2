event_inherited();
on_hit = function(_enemy){
	apply_status_elemental(_enemy, STATUS.POISON, 1, 2);
}