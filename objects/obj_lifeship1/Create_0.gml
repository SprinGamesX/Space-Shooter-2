event_inherited();
create_hp_scaling(0, 0.2, 0.3);


basic_attack = function(){
	create_projectile(obj_lifeball, atk_scale, 0, self, 3);
}

skill = function(){
	if (hp < max_hp - 10) hp += 10;
	else hp = max_hp;
	create_dmg_indicator(x, y, "+10", false, ELEMENTS.HEALING);
	for(var _i = -15; _i <= 15; _i += 15){
		create_projectile(obj_lifeball, skill_scale, _i, self, 3,,,max_hp, skill_hp_scale);
	}
}

ultimate = function(){
	create_deployable(obj_life_windmaker, max_hp / 2);
}