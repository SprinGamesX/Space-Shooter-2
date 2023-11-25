if (hp <= 0) {
	instance_destroy();
	parent_ship.kills++;
}
if (stopped) {
	speed = 0;
	exit;
}
speed = spd - (spd * slowed);
image_angle += 0.5;
if (scale < 1){
	scale += 0.02;
	echo = make_trail_meteor(TRAIL_LENGTH.MID, scale);
}
stoppable();
kill_outside_bounds(0);
apply_debuffs();
draw_trail_meteor(echo);