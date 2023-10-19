// Movement
allow_movement(spd);
// Keyboard inputs
var _key_space = keyboard_check(vk_space);
var _key_skill = keyboard_check(ord("E"));
var _key_ult = keyboard_check(ord("Q"));

preform_skills(_key_space,_key_skill, _key_ult);

if (hp <= 0){
	death();
}

draw_echo(echo);
