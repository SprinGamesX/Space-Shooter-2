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

basic_atk = function(){
	summon_enemy(obj_enemy1, lv, x, y);
}

skill = function(){
	for (var _i = 180 - 45; _i <= 180 + 45; _i += 15)
		summon_enemy(obj_enemy1, lv, x, y, _i);
}

ult = function(){
	max_skill_cd -= max_skill_cd / 4;
	max_atk_cd -= max_atk_cd / 4;
}

special_movement = function(){
	// write special movement pattern if there is one
	if (!entrance_animation_ongoing){
		rot += 0.5;
		y = start_y + (sin(time / 40) * wave_height);
		time += 1 - (freeze * 0.025);
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