event_inherited();
scale = 0;
rot = 0;
echo = make_echo(ECHO.SHORT);
start_y = y;
start_x = x;
wave_height = room_height / 4;
time = 0;
death_time = seconds(3);
frg = make_fragment();
// ultimate
ultimate_state = false;
charge = 0;
charge_max = 20;
sped = 10;

basic_atk = function(){
	summon_enemy(obj_enemy1, lv, x, y);
	summon_enemy(obj_enemy1, lv, x, y, 175);
	summon_enemy(obj_enemy1, lv, x, y, 185);
}

skill = function(){
	for (var _i = 180 - 45; _i <= 180 + 45; _i += 15)
		summon_enemy(obj_enemy1, lv, x, y, _i);
}

ult = function(){
	ultimate_state = true;
}

special_movement = function(){
	if (!entrance_animation_ongoing) and !stopped{
		if (!ultimate_state){
			def = 0;
			rot += 0.5;
			y = start_y + (sin(time / 40) * wave_height);
			time += 1 - (slowed);
		}
		else {
			def = 0.5;
			rot += charge;
			charge += 0.1;
			if (charge >= charge_max){
				x -= sped;
				if (x <= 0){
					screenshake(seconds(1), 1, 0.05);
					for (var _i = 0; _i < 360; _i += 20)
						summon_enemy(obj_enemy1, lv, x, y, _i);
					scale = 0;
					x = start_x;
					y = start_y;
					entrance_animation_ongoing = true;
					ultimate_state = false;
					charge = 0;
				}
			}
		}
		draw_echo(echo);
	}
	image_angle = rot;
}

entrance_animation = function(){
	scale += 0.05;
	rot += 2;
	if (scale == 1){
		entrance_animation_ongoing = false;
		screen_flash();
		for (var _i = 0; _i < 360; _i += 20)
			summon_enemy(obj_enemy1, lv, x, y, _i);
	}
	
}

death_animation = function(){

	x = start_x + random_range(-3, 3);
	death_time--;
	if (death_time == 0){
		instance_destroy();
		screenshake(seconds(1), 0.5, 0.1);
		draw_fragments(frg, FRAG_AMOUNT.MASSIVE);
	}
}