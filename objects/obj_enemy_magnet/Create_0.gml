event_inherited();
scale = 2;
start_y = y;
start_x = x;
wave_height = room_height / 8;
time = 0;
ini_speed = -5;
ini_acc = 0.2;
echo = make_echo(ECHO.MID, scale);

// Summon 4 followers
f_dis = 20;
followers = [0,0,0,0];
followers[0] = summon_enemy_magnet_follower(lv, room_width/2, room_height/2);
followers[1] = summon_enemy_magnet_follower(lv, room_width/2, room_height/2);
followers[2] = summon_enemy_magnet_follower(lv, room_width/2, room_height/2);
followers[3] = summon_enemy_magnet_follower(lv, room_width/2, room_height/2);

show_debug_message(followers);
basic_atk = function(){
	var _c = choose(followers[0], followers[1],followers[2],followers[3]);
	if (instance_exists(_c))
		_c.shoot(10, random_range(160, 200));
}

skill = function(){
	summon_enemy_orbit(x, room_height / 2, lv, 8, 128, 2);
	summon_enemy_orbit(x, room_height / 2, lv, 4, 136, -3);
}

ult = function(){
	screen_flash();
	if (!instance_exists(followers[0]))
		followers[0] = summon_enemy_magnet_follower(lv, room_width, room_height/2);
	if (!instance_exists(followers[1]))
		followers[1] = summon_enemy_magnet_follower(lv, room_width, room_height/2);
	if (!instance_exists(followers[2]))
		followers[2] = summon_enemy_magnet_follower(lv, room_width, room_height/2);
	if (!instance_exists(followers[3]))
		followers[3] = summon_enemy_magnet_follower(lv, room_width, room_height/2);
}

special_movement = function(){
	if (!entrance_animation_ongoing) and !stopped{
		y = start_y + (sin(time / 40) * wave_height);
		time += 1 - (freeze * 0.025);
		draw_echo(echo);
	}
	if (instance_exists(followers[0]))
		followers[0].set_base(x+f_dis, y+f_dis);
	if (instance_exists(followers[1]))
		followers[1].set_base(x-f_dis, y+f_dis);
	if (instance_exists(followers[2]))
		followers[2].set_base(x+f_dis, y-f_dis);
	if (instance_exists(followers[3]))
		followers[3].set_base(x-f_dis, y-f_dis);
}

entrance_animation = function(){
	ini_speed += ini_acc;
	x += ini_speed;
	if (ini_speed == 0) {
		entrance_animation_ongoing = false;
		screen_flash();
	}
}

death_animation = function(){
	for (var i = 0; i < 4; i++){
		var _c = followers[i];
		if (instance_exists(_c))
			_c.shoot(10, random_range(160, 200));
	}
	instance_destroy();
}