event_inherited();


basic_attack = function(){
	// do basic attack
	create_projectile(obj_iceshard2, atk_scale/3, 0, self, 6, x, y - 6,,0.75);
	create_projectile(obj_iceshard2, atk_scale/3, 0, self, 6, x, y,,0.75);
	create_projectile(obj_iceshard2, atk_scale/3, 0, self, 6, x, y + 6,,0.75);
}

skill = function(){
	create_follower(obj_ice_engine, 24, 24, skill_scale, seconds(2), seconds(21));
}

ultimate = function(){
	create_follower(obj_ice_generator, 0, 0, ult_scale, seconds(1), seconds(20));
}