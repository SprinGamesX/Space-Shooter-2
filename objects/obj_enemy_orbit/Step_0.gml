if (orbited_dis != orbited_dis_target){
	orbited_dis++;
}

if (!stopped){
	x = orbited_x + lengthdir_x(orbited_dis, angle);
	y = orbited_y + lengthdir_y(orbited_dis, angle);
	angle += spin_speed;
	image_angle = angle;
}

if (scale < 1){
	scale += 0.02;
	echo = make_echo(, scale);
}

if (hp <= 0){
	instance_destroy();
	parent_ship.kills++;
}

image_xscale = scale;
image_yscale = scale;
draw_echo(echo);