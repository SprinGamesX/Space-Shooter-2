// Movement
allow_movement(spd);
// Keyboard inputs
var _key_space = keyboard_check(vk_space);
var _key_skill = keyboard_check(ord("E"));
var _key_ult = keyboard_check(ord("Q"));
var _key_dodge = keyboard_check_pressed(vk_shift);

preform_skills(_key_space,_key_skill, _key_ult, _key_dodge);

if (hp <= 0){
	death();
}

draw_echo(echo);

if (immune){
	image_alpha = 0.5;
}
else image_alpha = 1;
