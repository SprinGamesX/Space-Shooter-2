event_inherited();
crosshair_scale = 1;
crosshair_alpha = 1;
target = noone;
target_boss = false;
crosshair_index = 0;

basic_attack = function(){
	if (target != noone) and (instance_exists(target)){
		instance_create_layer(target.x, target.y, "Projectiles", obj_lightning_slash);
		create_projectile(obj_lightning_rod, atk_scale, 0, self, 0, target.x, target.y,,1);
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
	// do ultimate
}

alarm[0] = seconds(0.5);