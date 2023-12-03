// Health & skill bars
skill_bar_color = c_white;
ult_bar_color = c_white;
bar_width = 64;
bar_height = 8;
bar_scale = 4;
bar_width *= bar_scale;
bar_height *= bar_scale;

// Dodge
immune = 0;
immune_time = seconds(0.1);
immune_time_max = immune_time;
immune_cd = seconds(2);
immune_cd_max = immune_cd;
immune_spd_multiplier = 3;

// Team
active = false;



function set_max_cds(_aspd, _cd){
	
	max_skill_cd = round(skill_cd - (skill_cd * _cd));
	max_ult_cd = round(ult_cd - (ult_cd * _cd));
	max_atk_cd = round(atk_cd - (atk_cd * _aspd));
}

function set_bar_colors(){
	switch (element){
		case ELEMENTS.ICE:
			skill_bar_color = c_aqua;
			ult_bar_color = c_purple;
			break;
		case ELEMENTS.FIRE:
			skill_bar_color = c_orange;
			ult_bar_color = c_red;
			break;
		case ELEMENTS.LIFE:
			skill_bar_color = c_green;
			ult_bar_color = c_lime;
			break;
		case ELEMENTS.VENOM:
			skill_bar_color = c_purple;
			ult_bar_color = c_fuchsia;
			break;
		case ELEMENTS.LIGHTNING:
			skill_bar_color = c_yellow;
			ult_bar_color = c_gray;
			break;
	}
	frg = make_fragment();
}

function set_base_stats(){
	obj_ship.update_index(ship_id);
	atk = obj_ship.f_atk;
	hp = obj_ship.f_hp;
	spd = obj_ship.f_spd;
	critrate = obj_ship.f_cr;
	critdmg = obj_ship.f_crd;
	atk_cd = obj_ship.cds[0];
	skill_cd = obj_ship.cds[1];
	ult_cd = obj_ship.cds[2];
	atk_scale = obj_ship.scales[0];
	skill_scale = obj_ship.scales[1];
	ult_scale = obj_ship.scales[2];
	element = obj_ship.element;
	aspd = (obj_ship.bonus_aspd * 0.02); //every stack of ASPD will give 2% cooldown reduction to basic attack
	cd_reduction = (obj_ship.bonus_cd * 0.01); // every stack of CD will give 1% cooldown reduction to skill and ultimate
	ex = (obj_ship.bonus_ex * 0.02); // every stack of EX will give 2% chance of causing an enhanced effect
	elemental_bonus = (obj_ship.bonus_elmt_dmg * 0.04); // every stack of E-DMG will give 4% DMG increase
	effect_hit_rate = (obj_ship.bonus_ehr * 0.04); // every stack of EHR will give 4% effect hit rate
	max_hp = hp;
	set_max_cds(aspd, cd_reduction);
	set_bar_colors();
	if (element == ELEMENTS.VENOM) dot_scale = obj_ship.dot_scale;
}

set_base_stats();
echo = make_echo();
atk = round(atk);
hp = round(hp);
kills = 0;

// set all cds to half
skill_cd = max_skill_cd / 2;
ult_cd = max_ult_cd / 2;

basic_attack = function(){
	// do basic attack
}

skill = function(){
	// do skill
}

ultimate = function(){
	// do ultimate
}

death = function(){
	instance_destroy();
	draw_fragments(frg, FRAG_AMOUNT.BIG);
}

on_hit = function(_dmg){
	if (!immune)
		hp -= _dmg;
}

