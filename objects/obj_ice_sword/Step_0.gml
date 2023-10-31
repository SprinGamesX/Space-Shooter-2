if (image_index > 3) and (hits > 0) and (instance_exists(target)){
	target.hp -= dmg;
	create_dmg_indicator(x,y,dmg,true,ELEMENTS.ICE);
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