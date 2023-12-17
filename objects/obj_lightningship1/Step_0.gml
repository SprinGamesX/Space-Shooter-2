
var _key_space = 0;
var _key_skill = 0;
var _key_ult = 0;

if (active){
	// Movement
	allow_movement(spd);
	// Keyboard inputs
	_key_space = vk_space;
	_key_skill = attack_by_key(ATTACK_TYPES.SKILL);
	_key_ult = attack_by_key(ATTACK_TYPES.ULT);
}
// Basic attack
if (atk_cd == 0){
	if ((keyboard_check(_key_space)) or (mouse_check_button(mb_left)) or (keyboard_check(ord("J")))){
		if (skill_dur > 0){
			if (charge < 300){ charge += 10 }
		}
		if (charge < 300){ charge++ }
	}
	else if (charge > 0){
		if (charge >= 300) create_projectile_laser(obj_lightning_laser1, atk_scale * 20, self, 5, seconds(0.2),700,6,x + 12);
		else if (charge >= 200) create_charge_projectile(obj_lightning_rod, atk_scale * 3, 0, self, 5, 2,x + 12);
		else if (charge >= 100) create_charge_projectile(obj_lightning_rod, atk_scale * 2, 0, self, 5, 1,x + 12);
		else create_charge_projectile(obj_lightning_rod, atk_scale, 0, self, 5, 0,x + 12);
		charge = 0;
		atk_cd = max_atk_cd;
		if (skill_dur > 0) skill_dur--;
	}
}
	
if(atk_cd > 0){ atk_cd-- }

// Skill
if (_key_skill) and (skill_cd == 0){
	skill_cd = max_skill_cd;
	skill();
}
if(skill_cd > 0) {skill_cd --}

// Ult
if (_key_ult) and (ult_cd == 0){
	ult_cd = max_ult_cd;
	ultimate();
}
if(ult_cd > 0) {ult_cd --}



if (hp <= 0){
	death();
}

draw_echo(echo);