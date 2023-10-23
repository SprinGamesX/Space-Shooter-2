sprite_index = spr_lightning_ship2_base;
event_inherited();
crosshair_scale = 1;
crosshair_alpha = 1;
target = noone;
target_boss = false;
crosshair_index = 0;
attack_index = 0;
ult_hits = 5;
ult_cd = 0;
ult_ongoing = false;
rot = 0;
trail = make_trail(5, element);

basic_attack = function(){
	if (target != noone) and (instance_exists(target)){
		if (attack_index > 2) attack_index = 0;
		switch(attack_index){
			case 0:
				draw_lightning_slash(45, target.x, target.y);
				create_projectile(obj_lightning_rod2, atk_scale, 0, self, 0, target.x, target.y,,1);
				break;
			case 1:
				draw_lightning_slash(135, target.x, target.y);
				create_projectile(obj_lightning_rod2, atk_scale, 0, self, 0, target.x, target.y,,1);
				break;
			case 2:
				draw_lightning_slash(0, target.x, target.y);
				draw_lightning_slash(90, target.x, target.y);
				create_projectile(obj_lightning_rod2, atk_scale * 1.5, 0, self, 0, target.x, target.y,,1);
				break;
		}
		screenshake(seconds(0.25), 0.5, 3);
		attack_index++;
		sprite_index = spr_lightning_ship2_attack;
		image_index = 0;
	}
}

skill = function(){
	if (target_boss){
		if (instance_exists(parent_elite_enemy)){
			target = instance_nearest(x, y, parent_elite_enemy);
			target_boss = false;
		}
		else target = instance_nearest(x, y, parent_enemy);
	}
	else {
		target = instance_nearest(x, y, parent_enemy);
		target_boss = true;	
	}
	crosshair_scale = 2;
	crosshair_alpha = 0;
}

ultimate = function(){
	if (target != noone) and (instance_exists(target)){
		ult_ongoing = true;
		pause_all_enemys();
		alarm[1] = 1;
	}
}

alarm[0] = seconds(0.5);