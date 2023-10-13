animation_stage = 0;
moving = false;
movement_target = noone;
image_scale = 1;

move_to_domain = function(_target){
	animation_stage = 0;
	moving = true;
	movement_target = _target;
}