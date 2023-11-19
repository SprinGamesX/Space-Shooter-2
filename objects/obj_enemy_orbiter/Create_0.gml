event_inherited();
orbited_x = room_width / 2;
orbited_y = room_height / 2;
orbited_dis = 32;
scale = 2;
rot = 0;
echo = make_echo(ECHO.LONG, 1.75);
frg = make_fragment();

hp_bar_height = 8 * 3;
hp_bar_width = 64 * 3;

entrance_animation_ongoing = true;
recovered = true;
recover_hp = 0;

randomize();

set_orbit = function(_x, _y, _num, _duo){
	orbited_x = _x;
	orbited_y = _y;
	num = _num;
	if (_num == 1) angle = 90;
	if (_num == 2) angle = 270;
	duo = _duo;
}

basic_atk = function(){
	if (random(1) <= 0.5)
		summon_enemy(obj_enemy1, lv, x, y, direction + 5);
}

skill = function(){
	if (num == 1) and (instance_exists(duo)) and (instance_exists(parent_ship))
		summon_enemy(obj_enemy1, lv, orbited_x, orbited_y, point_direction(orbited_x, orbited_y, parent_ship.x, parent_ship.y));
}

ult = function(){
	if (num == 1) and (instance_exists(duo))
		summon_enemy_orbit(orbited_x, orbited_y, lv, 20, 64, 2);
}

special_movement = function(){
	if (!is_dead) and !stopped{
		x = orbited_x + lengthdir_x(orbited_dis, angle);
		y = orbited_y + lengthdir_y(orbited_dis, angle);
		image_xscale = scale;
		image_yscale = scale;
		angle += 2;
		rot -= 1;
		image_angle = rot;
		direction = angle + 90;
		draw_echo(echo);
		if (!recovered){
			recover();
		}
	}
}

entrance_animation = function(){
	image_xscale = scale;
	image_yscale = scale;
	draw_echo(echo);
	if (num == 1){
		if (y != orbited_y + orbited_dis){
			y -= 4;
		}
		else{
			screen_flash();
			entrance_animation_ongoing = false;
			screenshake(seconds(0.2), 1, 0.01);
		}
	}
	if (num == 2){
		if (y != orbited_y - orbited_dis){
			y += 4;
		}
		else{
			screen_flash();
			entrance_animation_ongoing = false;
		}
	}
}

death_animation = function(){
	if (instance_exists(duo)) and (duo.hp > (maxhp / 100) * 30){
		recovered = false;
		is_dead = false;
		recover_hp = duo.hp / 2;
		
	}
	else {
		speed += 0.1;
		if (x <= 0) or (x >= room_width) or (y <= 0) or (y >= room_height){
			instance_destroy();
			screenshake(seconds(1), 0.5, 0.1);
			draw_fragments(frg, FRAG_AMOUNT.MASSIVE);
		} 
	}
}

function recover(){
	immune = true;
	duo.immune = true;
	if (recover_hp > 0){
		var heal = (maxhp / 100)
		hp += heal;
		duo.hp -= heal;
		recover_hp -= heal;
	}
	else {
		immune = false;
		duo.immune = false;
		recovered = true;
		is_dead = false;
	}
}


