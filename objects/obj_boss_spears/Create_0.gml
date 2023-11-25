event_inherited();

#region General
phase = 0;




#endregion
// Entrance
scale = 0;
echo_scale = 0;
spin_speed = 30;
spin_acc = 0.5;
echo = make_echo(ECHO.LONG, scale, spr_boss_spears_echo);
shaking = 0;

// Movement
radius = 0;
radius_max = 64;
rot = 0;
angle = 0;
spd = 1;

x = room_width - 200;
y = room_height / 2;
center_x = x;
center_y = y;

// Death
death_stage = 0;


basic_atk = function(){
	switch(phase){
		case 0:
			for (var i = 0; i < 360; i += 90)
				summon_enemy(obj_enemy1, lv, x, y, i);
		break;
		case 1:
			for (var i = 0; i < 360; i += 45)
				summon_enemy(obj_enemy1, lv, x, y, i);
		break;
		case 2:
			summon_enemy(obj_enemy1, lv, room_width, random_range(10, room_height - 10), random_range(170, 190));
		break;
	}
	
}

skill = function(){
	switch(phase){
		case 0:
			summon_enemy(obj_sword_bomb, lv, random_range(room_width / 2, room_width), random_range(0, room_height));
		break;
		case 1:
			summon_enemy(obj_sword_bomb, lv, random_range(room_width / 2, room_width), random_range(0, room_height));
			summon_enemy(obj_sword_bomb, lv, random_range(room_width / 2, room_width), random_range(0, room_height));
		break;
		case 2:
			summon_enemy_bladie(x, y, dmg, 0.2, true);
		break;
		case 4:
			summon_enemy(obj_sword_bomb, lv, random_range(0, room_width), random_range(0, room_height));
		break;
	}
}

ult = function(){
	switch(phase){
		case 2:
			summon_enemy_bladie(x, y, dmg, 0.2, true);
			summon_enemy(obj_sword_bomb, lv, random_range(room_width / 2, room_width), random_range(0, room_height));
		break;
	}
}

special_movement = function(){
	// write special movement pattern if there is one
	if (phase < 2){
		if (radius < radius_max) radius += 0.2;
		angle-=spd;
		rot+=spd;
		x = center_x + lengthdir_x(radius, rot);
		y = center_y + lengthdir_y(radius, rot);
		image_angle = angle;
	}
	if (phase == 2) or (phase == 4){
		angle-=spd;
		image_angle = angle;
	}
	draw_echo(echo);
	
	// Phases
	if (hp <= (maxhp / 100) * 90) and (phase == 0) {
		phase = 1;
		spd = 2;
	}
	if (hp <= (maxhp / 100) * 60) and (phase == 1){
		phase = 2;
		def = 0.2;
		entrance_animation_ongoing = true;
		max_atk_cd /= 2;
		max_skill_cd = seconds(2);
		max_ult_cd = seconds(5);
	}
	if (hp <= (maxhp / 100) * 20) and (phase == 2){
		phase = 3;
		def = 0.5;
		entrance_animation_ongoing = true;
		shaking = seconds(2);
		spd = 0.5;
		max_skill_cd = seconds(3);
	}
}

entrance_animation = function(){
	switch(phase){
		case 0:
		if (scale < 3)
			scale += 0.1;
		image_xscale = scale;
		image_yscale = scale;
		image_angle += spin_speed;
		spin_speed -= 0.5;
		if (spin_speed == 0){
			entrance_animation_ongoing = false;
			screen_flash();
			screenshake(seconds(1), 0.6, 0.05);
		}
		echo_scale = scale;
		break;
		case 2:
			if (round(x) < room_width) x ++;
			if (round(y) < room_height / 2) y++;
			if (round(y) > room_height / 2) y--;
			if (scale < 4){ scale+= 0.02; echo_scale += 0.04;}
			angle-=spd;
			image_angle = angle;
			if (round(x) == room_width) and (round(y) == room_height / 2){
				entrance_animation_ongoing = false;
				screen_flash();
				screenshake(seconds(1), 0.5, 0.05);
			}
		break;
		case 3:
			if (shaking > 0) {
				shaking--
				x = room_width + random_range(-5, 5);
				y = room_height / 2 + random_range(-5, 5);
			}
			else {
				if (scale > 0) {
					scale -= 0.04;
					echo_scale -= 0.05;
				}
				else phase = 4;
			}
		break;
		case 4:
			x = room_width / 2;
			y = room_height / 2;
			angle-=spd;
			image_angle = angle;
			if (echo_scale < 8) echo_scale += 0.05;
			else{
				if (scale < 8) scale += 0.05;
				else {
					entrance_animation_ongoing = false;
				}
			}
		break;
		
	}
	image_xscale = scale;
	image_yscale = scale;
	echo = make_echo(ECHO.MID, echo_scale);
	draw_echo(echo);
}

death_animation = function(){
	x = room_width / 2 + random_range(-5, 5);
	y = room_height / 2 + random_range(-5, 5);
	if (death_stage == 0){
	if (scale < 10) scale+= 0.02;
	else {
		death_stage = 1;
	}}
	if (death_stage == 1){
		if (scale > 0) scale-= 0.05;
		else {
			instance_destroy()
			screenshake(seconds(1), 1, 0.02);
		}
	}
	
	image_xscale = scale;
	image_yscale = scale;
	echo_scale = scale;
	echo = make_echo(ECHO.MID, echo_scale);
	draw_echo(echo);
}