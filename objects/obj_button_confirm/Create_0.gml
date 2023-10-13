set_button = function(_parent){
	parent = _parent;
}

click = function(){
	global.selected_ship = parent.index;
	transition_start(rm_domain_selection, seq_slide_out, seq_slide_in);
}