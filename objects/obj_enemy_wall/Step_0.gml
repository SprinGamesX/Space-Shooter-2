// Immune to freeze
freeze = 0;

if (explosive) explosive = false;
spd += acc;
if (spd <= 0) {
	spd = 0;
	acc = 0;
}
speed = spd;
image_angle = direction;

if (hp <= 0){
	instance_destroy();
	parent_ship.kills++;		
}

draw_echo(echo);