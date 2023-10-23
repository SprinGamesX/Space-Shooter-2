event_inherited();
if (follow_parent) follow();
if (x < 0) or (x > room_width) or (y < 0) or (y > room_height){
	speed = 0;
	if (shooting){
		screenshake(seconds(0.25), 1, 0.25);
		alarm[0] = seconds(1);
		shooting = false;
	}
}

if (hp <= 0) {
	instance_destroy();
	parent_ship.kills++;
}

if (!can_dmg) image_alpha = 0.5;
else image_alpha = 1;

if (!follow_parent) draw_echo(echo);

// Immunities
life_ripe = 0;
freeze = 0;
poison = 0;
shocked = false;
explosive = false;
