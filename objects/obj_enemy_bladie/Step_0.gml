event_inherited();
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

draw_echo(echo);