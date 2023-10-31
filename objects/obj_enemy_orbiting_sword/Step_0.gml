if (orbited_dis != orbited_dis_target){
	orbited_dis++;
}
else ready = true;

x = orbited_x + lengthdir_x(orbited_dis, angle);
y = orbited_y + lengthdir_y(orbited_dis, angle);
angle += spin_speed;
image_angle = angle + 180;

if (scale < 1){
	scale += 0.02;
}

if(lifetime > 0){
	lifetime--;
}
else {
	ready = false;
	image_alpha -= 0.02;
	if (image_alpha <= 0){
		instance_destroy();
	}
}

var _collision = instance_place(x, y, parent_ship)
if (_collision != noone) and (ready){
	_collision.on_hit(dmg);
	instance_destroy(self);
}


image_xscale = scale;
image_yscale = scale;