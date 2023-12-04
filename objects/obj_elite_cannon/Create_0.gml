event_inherited();
downed = false;
scale = 3;
shield = self;
recoil = 0;
phase = 0;
overdrive = 0;

// entrance
ani_cd = seconds(1);
ani_cd_max = ani_cd;
ani_rounds = 4;
skill_cd = seconds(1);

//death
dying = seconds(2);

basic_atk = function(){
	if (!downed){
		var xx = x + lengthdir_x(64, direction)
		var yy = y + lengthdir_y(64, direction)
		summon_enemy(obj_enemy1, lv, xx, yy, direction, 5);
		summon_enemy(obj_enemy1, lv, xx, yy, direction + 15, 5);
		summon_enemy(obj_enemy1, lv, xx, yy, direction - 15, 5);
		summon_enemy(obj_enemy1, lv, xx, yy, direction + random_range(-15, 15), 5);
		recoil = 16;
		if (overdrive > 0){
			overdrive--;
			atk_cd = seconds(0.25);
		}
	}
}

skill = function(){
	if (shield == self) and (!downed){
		shield = summon_enemy(obj_enemy_wall, lv * 2, x, y,,6);
	}
}

ult = function(){
	if (!downed) overdrive = 10;
}

special_movement = function(){
	if (!downed){
		if (instance_exists(obj_team_manager)){
			var _ship = obj_team_manager.get_active_ship();
			if (_ship != noone) and (instance_exists(_ship))
				direction = point_direction(x, y, _ship.x, _ship.y);
		}
	}
	else {
		direction = round(direction)
		if (direction > 210) direction--;
		if (direction < 210) direction++; 
	}
	if (!instance_exists(shield)) {
		downed = true;
		shield = self;
		skill_cd = seconds(20);
	}
	if (hp <= maxhp / 2) and (phase == 0){
		phase = 1;
		downed = false;
		max_atk_cd = seconds(1);
		atk_cd = max_atk_cd;
		skill_cd = seconds(0.5);
	}
	if (shield != self){
		def = 0.9;
	}
	else def = 0;
}

entrance_animation = function(){
	if (ani_cd > 0) ani_cd--;
	else {
		ani_cd = ani_cd_max;
		direction -= 45;
		ani_rounds--;
		if (ani_rounds == 0){
			entrance_animation_ongoing = false;
			screen_flash();
			screenshake(seconds(0.5), 1, 0.05);
		}
		else {
			screenshake(seconds(0.5), 0.5, 0.05);
		}
	}
}

death_animation = function(){
	if (dying > 0){
		dying--;
		direction = direction + random_range(-3, 3);
	}
	else {
		instance_destroy();
		screenshake(seconds(1), 1, 0.05);
		frag = make_fragment();
		draw_fragments(frag, FRAG_AMOUNT.MASSIVE);
	}
}

image_xscale = scale;
image_yscale = scale;