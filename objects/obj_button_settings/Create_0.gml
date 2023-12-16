on_click = function(){
	if (!instance_exists(obj_settings)){
		instance_create_depth(0, 0, -999, obj_settings);
	}
}