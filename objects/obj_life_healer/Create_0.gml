event_inherited();
dir = 180;
angle = 0;
trail = make_trail(2, ELEMENTS.LIFE);

follow = function(){
	if (instance_exists(obj_team_manager)){
		target = obj_team_manager.get_active_ship();
	}
	var _x = target.x + lengthdir_x(dis_x, dir);
	var _y = target.y + lengthdir_y(dis_x, dir);
	var correction = 2;
	
	var error_x = abs(x - _x) / 10;
	if (x > _x) x -= correction * sqrt(error_x);
	if (x < _x) x += correction * sqrt(error_x);
	// y axis
	var error_y = abs(y - _y) / 10;
	if (y > _y) y -= correction * sqrt(error_y);
	if (y < _y) y += correction * sqrt(error_y);
	
	dir += 2;
	angle--;
	image_angle = angle;
	draw_trail(trail);
}
skill = function(){
	if (instance_exists(obj_team_manager)){
		target = obj_team_manager.get_active_ship();
		if (instance_exists(target) and instance_exists(source))
			restore_hp(source.max_hp * scaling, target);
	}
}