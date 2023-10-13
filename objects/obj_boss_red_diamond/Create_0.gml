event_inherited();


basic_atk = function(){
	summon_enemy(obj_enemy1, self.lv, room_width + 20, random_range(50, room_height - 50));
}

skill = function(){
	randomize();
	var _attack = irandom_range(1, 3);
	show_debug_message("attack: " + string(_attack));
	switch (_attack){
		case 1: rd_attack_1(self); break;
		case 2: rd_attack_2(self); break;
		case 3: rd_attack_3(self); break;
	}
}

ult = function(){
	// write ultimate
}

special_movement = function(){
	layer1rot += 0.5;
	layer2rot -= 0.2;
	layer3rot += 0.1;
}

entrance_animation = function(){
	special_movement();
	x -= 0.1;
	if (x <= room_width - 70) entrance_animation_ongoing = false;
}

death_animation = function(){
	layer1_scale -= 0.1;
	layer2_scale -= 0.1;
	layer3_scale -= 0.1;
	if (layer1_scale <= 0){
		instance_destroy(self);
		for (var _i = 0; _i < 20; _i++)
			summon_enemy(obj_enemy1, lv, x,y, random_range(0, 360))
	}
}

scale = 4
layer1_scale = scale;
layer2_scale = scale;
layer3_scale = scale;

layer1rot = 0;
layer2rot = 0;
layer3rot = 0;

image_xscale = scale;
image_yscale = scale;

stage = 0;
moving = true;

alarm[0] = seconds(20);

// Special Effects
fragment = make_fragment();

