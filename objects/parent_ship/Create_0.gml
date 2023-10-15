skill_bar_color = c_white;
ult_bar_color = c_white;

function set_max_cds(){
	
	max_skill_cd = skill_cd;
	max_ult_cd = ult_cd;
	max_atk_cd = atk_cd;
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
	max_hp = hp;
	set_max_cds();
	set_bar_colors();
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

