if (stopped){
	speed = 0;
	exit;
}
if (!ready){
	alpha += 0.05;
	image_alpha = alpha;
	if (auto_aim) and (instance_exists(parent_ship)){
		direction = point_direction(x, y, parent_ship.x, parent_ship.y);
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