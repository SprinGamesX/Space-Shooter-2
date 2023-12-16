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

// Basic attack
if (atk_cd == 0) and (_key_space) and (charge <= 0){
	atk_cd = max_atk_cd;
	basic_attack();
}
if(atk_cd > 0){ atk_cd-- }


if (skill_active){
	if (!lasering){
		f_1.laser(charge);
		f_2.laser(charge);
		lasering = true;
		charge+= seconds(0.5);
	}
	else {
		charge-=2;
		if (charge <= 0){
			charge = 0;
			skill_active = false;
			lasering = false;
			f_1.dir = 45;
			f_2.dir = 45;
			f_1.image_angle = 0;
			f_2.image_angle = 0;
		}
	}
}
else {
	// Skill
	if (skill_cd < max_skill_cd - seconds(1)){
		if (_key_skill) and (skill_cd < max_skill_cd - (seconds(1) + 1)){
			skill_cd+=2;
			charge++;
			f_1.dir = 15;
			f_1.image_angle = -3;
			f_2.dir = 15;
			f_2.image_angle = 3;
			make_charge_particle(x + 24, y, ELEMENTS.LIGHTNING, 50);
		}
		else if(charge > 0){
			skill();
			skill_cd += seconds(1);
		}
	}
	if(skill_cd > 0) {skill_cd --}
}

// Ult
if (_key_ult) and (ult_cd == 0){
	ult_cd = max_ult_cd;
	ultimate();
}
if(ult_cd > 0) {ult_cd --}
if (_key_dodge) and (immune_cd == 0){
	immune = true;
	immune_cd = immune_cd_max;
}

if (immune){
	immune_time--;
	if (immune_time <= 0){
		immune = false;
		immune_time = immune_time_max;
		immune_cd = immune_cd_max;
	}
}
if (immune_cd > 0) immune_cd--;
	
	
if (immune_cd < 0) immune_cd = 0;
if (ult_cd < 0) ult_cd = 0;
if (skill_cd < 0) skill_cd = 0;
if (atk_cd < 0) atk_cd = 0;


if (hp <= 0){
	death();
}

draw_echo(echo);

if (immune){
	image_alpha = 0.5;
}
else image_alpha = 1;
