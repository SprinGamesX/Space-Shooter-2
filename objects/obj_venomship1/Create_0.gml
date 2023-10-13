event_inherited();
skill_uses = 3;
ult_uses = 5;

basic_attack = function(){
	create_projectile(obj_venom_needle, atk_scale, 0, self, 3, x + 5,,,,3);
}

skill = function(){
	skill_uses = 3;
	alarm[0] = seconds(0.1);
}

ultimate = function(){
	ult_uses = 5;
	alarm[1] = seconds(0.2);
}