
show_debug_message("Ship Created")

skill_bar_color = c_white;
ult_bar_color = c_white;

lvl = ds_map_find_value(global.ship_datas[|global.selected_ship], "level");
show_debug_message(lvl);

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
	hp += (hp * 0.2) * (lvl - 1);
	atk += (atk * 0.15) * (lvl - 1);
	switch(element){
		case ELEMENTS.ICE: critrate += ((lvl) / 200) break;
		case ELEMENTS.FIRE: critdmg += ((lvl) / 100) break;
		case ELEMENTS.LIFE: hp += ((lvl) * 20); break;
		case ELEMENTS.VENOM: atk += ((lvl) * 7); break;
	}
}

set_base_stats();
max_hp = hp;
set_max_cds();
set_bar_colors();
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

