is_being_dragged = false;

amount_current = 0;
max_amount = 50;
draw_on_gui = false;

send_to_parent = function(){
	if (parent != noone) and (instance_exists(parent))
		parent.slider = amount_current + 1;
}