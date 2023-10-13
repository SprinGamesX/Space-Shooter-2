event_inherited();
if (hp <= 0) {
	instance_destroy();
	parent_ship.kills++;	
}
speed = spd - frozen(spd / 30);
image_angle += 0.5;
if (scale < 1){
	scale += 0.02;
	echo = make_echo(, scale);
}
image_xscale = scale;
image_yscale = scale;
draw_echo(echo);