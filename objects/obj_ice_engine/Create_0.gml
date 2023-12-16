event_inherited();
dir = 180;
angle = 0;
echo = make_echo();
create_buff(BUFF.ICE_DMG, seconds(20), 0.25);

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
	
	dir += 5;
	angle--;
	image_angle = angle;
	draw_echo(echo);
}
animation = function(){
	// animate
}
skill = function(){
	create_projectile_laser(obj_ice_laser, source.skill_scale, self, 3, seconds(0.15), 1000, 6);
}