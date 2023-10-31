event_inherited();
echo = make_echo(ECHO.MID, 3);

image_xscale = 3;
image_yscale = 3;

x = -200;
y = room_height / 2;
start_y = y;
start_x = x;
image_angle = -135;
start_ang = 45;

acc = 0.2;
spd = 17.5;
time = 0;
wait_time = seconds(0.5);
wave_height = 64;
wave_ang = 15;
saved_ang = 0;
dir = 0;
dmg = dmg * lv;
cycle = 0;
skilling = false;
ulting = false;
ult_stage = 0;
ult_cd = seconds(10);
sword_x = 0;
dying = false;

alarm[3] = seconds(5);
alarm[4] = seconds(0.1);

basic_atk = function(){
	if (!ulting)
		randomize();
		var _x = random_range(x, x + 64);
		var _y = random_range(y - 32, y + 32);
		summon_enemy_bladie(_x, _y, dmg, 0.1, true);
}

skill = function(){
	skilling = true;
	cycle = 0;
	alarm[0] = seconds(0.2);	
}


ult = function(){
	dir = start_ang;
	image_angle = dir;
	ulting = true;
	ult_stage = 0;
	spd = 0;
}

ult_animation = function(){
	switch(ult_stage){
		case 0:
			x -= 2;
			dir += 2;
			if (dir == 225) ult_stage++;
			break;
		case 1:
			spd += 0.3;
			x += spd;
			if (x >= room_width - 100){
				screenshake(1, 2, 0.25);
				screen_flash();
				ult_stage++;
				x = round(x);
				alarm[1] = seconds(0.2);
				alarm[2] = seconds(10); // ult length
			}
			break;
		case 3: {
			if (x != start_x)
				x += 0.5;
			if (round(dir) != start_ang) {
				dir += 1.5;
			}
			else {
				screen_flash();
				ulting = false;
			}
		}
	
	}
}

special_movement = function(){
	if (!entrance_animation_ongoing) and (!ulting) and (!skilling) and (!dying){
		y = start_y + (sin(time / 40) * wave_height);
		image_angle = start_ang + (sin(time / 40)* wave_ang);
		time++;
	}
	if (skilling){
		dir += 3;
		cycle++;
		image_angle = dir;
		if (cycle == 120){
			skilling = false;
		}
	}
	if (ulting){
		ult_animation();
		image_angle = dir;
	}
}

entrance_animation = function(){
	
	if (spd > 0){
		spd -= acc;
		x += spd;
	}
	else {
		spd = 0;
		if (wait_time > 0){
			wait_time--;
		}
		else {
			image_angle++;
			if (image_angle == 45){
				entrance_animation_ongoing = false;
				dir = image_angle;
				screen_flash();
				start_x = round(x);
			}
		}
	}
	
	
}

death_animation = function(){
	if (round(image_angle) == start_ang){
		dying = true;
		spd += 0.2;
		x -= spd;
	}
	else { x = start_x + random_range(-3, 3); }
	if (x < 64){
		instance_destroy();
		screenshake(seconds(1), 2, 0.25);
		frg = make_fragment();
		draw_fragments(frg, FRAG_AMOUNT.MASSIVE);
	}
}