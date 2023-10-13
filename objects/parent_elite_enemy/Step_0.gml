
if (entrance_animation_ongoing){
	entrance_animation();
}
else special_movement();

if (!entrance_animation_ongoing) and (!is_dead){
	if (atk_cd == 0){
		atk_cd = max_atk_cd;
		basic_atk();
	}
	if(atk_cd != 0){ atk_cd-- }

	// Skill
	if (skill_cd == 0){
		skill_cd = max_skill_cd;
		skill();
	}
	if(skill_cd != 0) {skill_cd --}

	// Ult
	if (ult_cd == 0){
		ult_cd = max_ult_cd;
		ult();
	}
	if(ult_cd != 0) {ult_cd --}
}
if (hp <= 0){
	hp = 0;
	is_dead = true;
}

if (is_dead){
	death_animation();
}

if (entrance_animation_ongoing or is_dead){
	immune = true;
}
else {immune = false}

