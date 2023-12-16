event_inherited();
// Ship gains atk equal to 40% of HP
atk += ((max_hp / 100) * 40);

basic_attack = function(){
	create_projectile(obj_lifeball, atk_scale, 0, self, 3);
}

skill = function(){
	create_follower(obj_life_healer, 32, 32, skill_scale, seconds(5), seconds(20));
}

ultimate = function(){
	create_deployable(obj_life_windmaker, max_hp / 2);
}