if (stopped){
	speed = 0;
	exit;
}
if (!ready){
	alpha += 0.05;
	image_alpha = alpha;
	if (instance_exists(obj_team_manager)){
		var _ship = obj_team_manager.get_active_ship();
		if (auto_aim) and (instance_exists(_ship)){
			direction = point_direction(x, y, _ship.x, _ship.y);
		}
	}
	if (alpha >= 1) ready = true;
}
else {
	spd += acc;
	speed = spd;
	
	if (dir_acc != 0){
		direction += dir_acc;
	}
}
image_angle = direction;

var _collision = instance_place(x, y, parent_ship)
if (_collision != noone){
	_collision.on_hit(dmg);
	instance_destroy(self);
	screenshake(seconds(0.5), 1, 0.25);
}

draw_echo(echo);
kill_outside_bounds();