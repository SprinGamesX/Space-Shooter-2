// Movement
allow_movement(spd);
// Keyboard inputs
var _key_space = keyboard_check(vk_space);
var _key_skill = keyboard_check(ord("E"));
var _key_ult = keyboard_check(ord("Q"));

preform_skills(_key_space,_key_skill, true);

if (kills >= 30){
	kills = 0;
	create_dmg_indicator(x,y,"SKILL CD -100%", false, ELEMENTS.FIRE);
	skill_cd = 0;
}

if (hp <= 0){
	death();
}

draw_echo(echo);