var _key_space = 0;
var _key_skill = 0;
var _key_ult = 0;
var _key_dodge = 0;
if (active){
	// Movement
	allow_movement(spd);
	// Keyboard inputs
	_key_space = attack_by_key(ATTACK_TYPES.NORMAL);
	_key_skill = attack_by_key(ATTACK_TYPES.SKILL);
	_key_ult = attack_by_key(ATTACK_TYPES.ULT);
}

preform_skills(_key_space,_key_skill, _key_ult, false);

if (hp <= 0){
	death();
}

draw_echo(echo);

if (immune){
	image_alpha = 0.5;
}
else image_alpha = 1;

passive();
