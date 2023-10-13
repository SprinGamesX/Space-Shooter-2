if (moving){
	if (animation_stage == 0){
		image_scale -= 0.05;	
	}
	if (animation_stage == 1){
		image_scale += 0.05;
		if (image_scale == 1){
			moving = false;
			obj_level_maker.advance(movement_target.pos);
			global.current_domain_type = movement_target.domain_type;
			transition_start(movement_target.room_target, seq_fade_out, seq_fade_in);
		}
	}
	if (image_scale <= 0){
		x = movement_target.x;
		y = movement_target.y;
		animation_stage = 1;
	}
	image_xscale = image_scale;
	image_yscale = image_scale;
}