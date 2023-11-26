event_inherited();
image_xscale = 1;
image_yscale = 1;
on_hit = function(_enemy){
	apply_status(_enemy, STATUS.POISON_AMP, 2, seconds(10), 0.25);
}