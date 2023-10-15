// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function string_desc_for_id(_id, _skill, _skill_scale, _skill_cd, _hpscale = 0){
	var _str = "";
	var _str_scale = string(_skill_scale * 100);
	_hpscale = string(_hpscale * 100);
	_skill_cd = string(seconds_to_time(_skill_cd)) + "s";
	switch(_id){
		case 0: 
			switch(_skill){
				case DESC_DISPLAY.BASIC_ATTACK:
					_str = "Deals ICE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.SKILL:
					_str = "Shoots 19 ICE shards, each dealing ICE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.ULT:
					_str = "Shoots 5 ICE bombs, each dealing ICE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. each bomb when exploded shoots ICE shards to all directions. \nCD: " + _skill_cd;
			}
			break;
		case 1: 
			switch(_skill){
				case DESC_DISPLAY.BASIC_ATTACK:
					_str = "Deals FIRE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.SKILL:
					_str = "Shoots 5 pulses of FIRE, each fireball dealing FIRE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.ULT:
					_str = "Enters OVERDRIVE state, when OVERDRIVE is active ship shoots 2x faster and deals enhanced FIRE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. OVERDRIVE lasts 10s \nCD: " + _skill_cd;
			}
			break;
		case 2: 
			switch(_skill){
				case DESC_DISPLAY.BASIC_ATTACK:
					_str = "Deals LIFE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.SKILL:
					_str = "Heals 10 HP and fires 3 bullets, each bullet dealing LIFE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK and [c_orange]" + _hpscale + "%[c_white] of HP. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.ULT:
					_str = "Deploys WINDMAKER, when deployed WINDMAKER's HP is set to 50% of this ships' HP, WINDMAKER shoots bullets that deal LIFE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK and [c_orange]" + _hpscale + "%[c_white] of HP. \nCD: " + _skill_cd;
			}
			break;
		case 3:
			switch(_skill){
				case DESC_DISPLAY.BASIC_ATTACK:
					_str = "Deals ICE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.SKILL:
					_str = "Shoots 10 shards of ICE, each shard dealing ICE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.ULT:
					_str = "Shoots 40 shards, each deals ICE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. \nCD: " + _skill_cd;
			}
			break;
		case 4:
			switch(_skill){
				case DESC_DISPLAY.BASIC_ATTACK:
					_str = "Deals VENOM damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK and applys 1 POISON. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.SKILL:
					_str = "Shoots 3 VENOM needles, each dealing VENOM damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK and each has 100% base chance to apply POISON. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.ULT:
					_str = "Shoots 15 VENOM needles in a snake formation, each deals VENOM damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK and each has a 50% base chance to apply POISON. \nCD: " + _skill_cd;
			}
			break;
		case 5:
			switch(_skill){
				case DESC_DISPLAY.BASIC_ATTACK:
					_str = "Deals AOE FIRE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.SKILL:
					_str = "Fires a barrage of missiles, each dealing AOE FIRE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. In addition when killing 20 ENEMYS skill cooldown is reset. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.ULT:
					_str = "Applys a buff to itself: increasing ATK by 10%. This skill activates automatically. \nCD: " + _skill_cd;
			}
			break;
		case 6:
			switch(_skill){
				case DESC_DISPLAY.BASIC_ATTACK:
					_str = "Deals LIFE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. \nCD: " + _skill_cd + "\nCharged attack deals LIFE damage equal to [c_orange]" + string(obj_ship.scales[1] * 100) + "%[c_white] of ATK";
					break;
				case DESC_DISPLAY.SKILL:
					_str = "Enters CHARGED state for 20s, CHARGED state will consume 20% of ship's HP and increase ship's ATK by [c_orange]" + _str_scale + "%[c_white] of max HP and will change the basic attack to a charged attack. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.ULT:
					_str = "Causes all enemys(except bosses) to immidiatly drop to 50% HP, if the enemys are already below 50% HP they will be destroyed. Additionally for each existing enemy ship will generate a healing orb that heals for 5% of ship's max HP \nCD: " + _skill_cd;
			}
			break;
			
	}
	return _str;
	
}


function stringify_stats(){
	var _ship = instance_nearest(x,y, obj_ship);
	var _str = "";
	
	_str += "ATK: " + string(_ship.f_atk) + "\n";
	_str += "HP: " + string(_ship.f_hp) + "\n";
	_str += "SPD: " + string(_ship.f_spd) + "\n";
	_str += "CRIT RATE: " + string(_ship.f_cr * 100) + "% \n";
	_str += "CRIT DAMAGE: " + string(_ship.f_crd * 100) + "% \n";
	return _str;
}

function stringify_bonuses(){
	var _str = "";
	
	_str += "+" + string(obj_ship.bonus_atk) + "/25 \n";
	_str += "+" + string(obj_ship.bonus_hp) + "/25 \n";
	_str += "+" + string(obj_ship.bonus_spd) + "/25 \n";
	_str += "+" + string(obj_ship.bonus_cr) + "/25 \n";
	_str += "+" + string(obj_ship.bonus_crd) + "/25 \n";
	_str += "+" + string(obj_ship.bonus_ex) + "/25 \n";
	_str += "+" + string(obj_ship.bonus_elmt_dmg) + "/25 \n";
	_str += "+" + string(obj_ship.bonus_aspd) + "/25 \n";
	_str += "+" + string(obj_ship.bonus_cd) + "/25 \n";
	_str += "+" + string(obj_ship.bonus_ehr) + "/25 \n";
	return _str;
}

function stringify_bonuses2(){
	var _str = "";
	
	_str += "ATK: \n";
	_str += "HP: \n";
	_str += "SPD: \n";
	_str += "CRIT: \n";
	_str += "CRIT DMG: \n";
	_str += "EX: \n";
	_str += "EM DMG: \n";
	_str += "ASPD: \n";
	_str += "CDS: \n";
	_str += "EHR: \n";
	return _str;
}

function draw_bg_box(_x,_y,_width, _height, _color, _alpha = 1){
	draw_sprite_stretched_ext(spr_bg_box, 0, _x, _y, _width, _height, _color, _alpha);
}