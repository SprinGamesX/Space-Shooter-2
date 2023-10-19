scale = 1;
diff = 0;
image_speed = 0;
selected = false;
locked = false;

image_xscale = scale;
image_yscale = scale;

click = function(){
	if (!locked){
		obj_trial_controller.deselect();
		selected = true;
		global.difficulty = diff;
		obj_trial_controller.update_level();
	}
}

setup = function(_diff){
	diff = _diff;
	image_index = _diff - 1;
}