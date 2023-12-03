var _key_space = 0;
var _key_skill = 0;
var _key_ult = 0;
var _key_dodge = 0;
if (active){
	// Movement
	allow_movement(spd);
	// Keyboard inputs
	_key_space = keyboard_check(vk_space);
	_key_skill = keyboard_check(ord("E"));
	_key_ult = keyboard_check(ord("Q"));
	_key_dodge = keyboard_check_pressed(vk_shift);
}

preform_skills(_key_space,_key_skill, _key_ult, _key_dodge);

if (hp <= 0){
	death();
}

draw_echo(echo);

if (immune){
	image_alpha = 0.5;
}
else image_alpha = 1;
