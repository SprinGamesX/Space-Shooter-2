event_inherited();


basic_attack = function(){
	create_projectile(obj_fire_missile, atk_scale, 0, self, 5, ,,,,,4);
}

skill = function(){
	for(var _i = 0; _i < 360; _i += 30){
		create_projectile(obj_fire_seeking_missile, skill_scale, _i, self, 5, ,,,,,5);
	}
}

ultimate = function(){
	create_dmg_indicator(x,y,"ATK +10%", false, ELEMENTS.FIRE);
	atk = atk + (atk / 100) * 10;
}
