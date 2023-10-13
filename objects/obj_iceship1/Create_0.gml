event_inherited();

basic_attack = function(){
	create_projectile(obj_iceshard1, atk_scale, 0, self, 3);
}

skill = function(){
	for(var _i = -45; _i <= 45; _i += 5){
		create_projectile(obj_iceshard1, skill_scale, _i, self, 3);	
	}
}

ultimate = function(){
	for(var _i = -60; _i <= 60; _i += 30){
		create_projectile(obj_icebomb, ult_scale, _i, self, 2);
	}
}
