event_inherited();
skill_count = 10;
ult_count = 40;

basic_attack = function(){
	create_projectile(obj_iceshard2, atk_scale, 0, self, 4,, y + 8);
	create_projectile(obj_iceshard2, atk_scale, 0, self, 4,, y - 8);
}

skill = function(){
	alarm[0] = seconds(0.1);
}

ultimate = function(){
	alarm[1] = seconds(0.2);
}