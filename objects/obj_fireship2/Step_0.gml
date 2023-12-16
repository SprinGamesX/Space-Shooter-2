var _key_space = 0;
var _key_skill = 0;
var _key_ult = 0;

if (active){
	// Movement
	allow_movement(spd);
	// Keyboard inputs
	_key_space = attack_by_key(ATTACK_TYPES.NORMAL);
	_key_skill = attack_by_key(ATTACK_TYPES.SKILL);
	_key_ult = attack_by_key(ATTACK_TYPES.ULT);

}
preform_skills(_key_space,_key_skill, active, false);

if (kills >= 30){
	kills = 0;
	create_dmg_indicator(x,y,"-100%", "SKILL CD", ELEMENTS.FIRE);
	skill_cd = 0;
}

if (hp <= 0){
	death();
}

draw_echo(echo);