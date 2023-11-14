if (hp <= 0) {
	instance_destroy();
	parent_ship.kills++;
}
if (stopped) {
	speed = 0;
	exit;
}
event_inherited();
speed = spd - (spd * slowed);
image_angle += 0.5;
if (scale < 1){
	scale += 0.02;
	echo = make_echo(, scale);
}

part_type_orientation(echo, image_angle, image_angle, 0, 0, 0);
draw_echo(echo);