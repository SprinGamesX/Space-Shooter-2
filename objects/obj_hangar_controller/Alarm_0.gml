/// @description Change from stats to tree
if (show_stats){
	// deletion of skill buttons
	for(var _i = 0; _i < array_length(skill_buttons);_i++){
		instance_destroy(skill_buttons[_i]);
	}
	skill_buttons = noone;	
	instance_create_layer((room_width / 4) * 3 + 48, (room_height / 3), "Instances", obj_skill_tree);
}
else {
	skill_buttons = generate_skill_buttons(room_width / 2 + 48, 128);
	if (instance_exists(obj_skill_tree)) instance_destroy(obj_skill_tree);
}

// Change state
show_stats = !show_stats



