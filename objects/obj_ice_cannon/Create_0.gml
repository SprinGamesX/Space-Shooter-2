event_inherited();
set = false;

follow = function(){
	if (!set) {
		y = y + dis_y;
		set = true;	
	}
	if (instance_exists(parent_enemy))
		direction = point_direction(x, y, parent_enemy.x, parent_enemy.y);
	image_angle = direction;
}

animation = function(){
	// animate
}
skill = function(){
	create_projectile_laser(obj_ice_laser, source.ult_scale, self, 3, seconds(0.1), 1000, 6,,,,,direction);
}