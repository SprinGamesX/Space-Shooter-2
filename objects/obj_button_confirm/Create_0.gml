event_inherited();
image_speed = 0;

set_button = function(_parent){
	parent = _parent;
	image_xscale = 1.5;
	image_yscale = 1.5;
}

on_click = function(){
	global.selected_ship = parent.index;
	transition_start(rm_domain_roadmap, seq_slide_out, seq_slide_in);
}