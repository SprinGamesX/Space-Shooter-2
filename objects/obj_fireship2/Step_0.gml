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
	_key_dodge = keyboard_check(vk_shift);

	preform_skills(_key_space,_key_skill, true, _key_dodge);
}

if (kills >= 30){
	kills = 0;
	create_dmg_indicator(x,y,"SKILL CD -100%", false, ELEMENTS.FIRE);
	skill_cd = 0;
}

if (hp <= 0){
	death();
}

draw_echo(echo);