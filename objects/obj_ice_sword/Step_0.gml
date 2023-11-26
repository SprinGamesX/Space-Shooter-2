var _ship = instance_nearest(x, y, parent_ship)
if (image_index > 3) and (hits > 0) and (instance_exists(target)){
	execute_dmg(_ship, target, self);
	create_hit_indicator(self);
	hits--;
	screenshake(seconds(0.2), 0.5, 0.1);
}
else{
	if (instance_exists(target)){
		x = target.x;
		y = target.y;
	}
}