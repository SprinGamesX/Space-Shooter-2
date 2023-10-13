// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function string_desc_for_id(_id, _skill, _skill_scale, _skill_cd, _hpscale = 0){
	var _str = "";
	var _str_scale = string(_skill_scale * 100);
	_hpscale = string(_hpscale * 100);
	_skill_cd = string(seconds_to_time(_skill_cd)) + "s";
	switch(_id){
		// Ice ship 1
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
					_str = "Shoots 3 VENOM needles, each dealing VENOM damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK and each applys 2 POISON. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.ULT:
					_str = "Shoots 15 VENOM needles in a snake formation, each deals VENOM damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK and each applys 1 POISON. \nCD: " + _skill_cd;
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
			
	}
	return _str;
	
}

function stringify_stats(_stats_map){
	var _str = "";
	
	_str += "ATK: " + string(ds_map_find_value(_stats_map, "atk")) + "\n";
	_str += "HP: " + string(ds_map_find_value(_stats_map, "hp")) + "\n";
	_str += "SPD: " + string(ds_map_find_value(_stats_map, "spd")) + "\n";
	_str += "CRIT RATE: " + string(round_to_1_decimal(ds_map_find_value(_stats_map, "crit rate") * 100)) + "% \n";
	_str += "CRIT DAMAGE: " + string(round_to_1_decimal(ds_map_find_value(_stats_map, "crit dmg") * 100)) + "% \n";
	return _str;
}

function draw_bg_box(_x,_y,_width, _height, _color){
	draw_sprite_stretched_ext(spr_bg_box, 0, _x, _y, _width, _height, _color, 1);
}