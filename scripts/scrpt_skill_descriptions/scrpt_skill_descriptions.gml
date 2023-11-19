// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function string_desc_for_id(_id, _skill, _skill_scale, _skill_cd, _hpscale = 0){
	var _str = "";
	var _str_scale = string(_skill_scale * 100);
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
					break;
				case DESC_DISPLAY.PASSIVE:
					_str = "This ship does not have a passive ability";
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
					break;
				case DESC_DISPLAY.PASSIVE:
					_str = "This ship does not have a passive ability";
			}
			break;
		case 2: 
			switch(_skill){
				case DESC_DISPLAY.BASIC_ATTACK:
					_str = "Deals LIFE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.SKILL:
					_str = "Heals 10 HP and fires 3 bullets, each bullet dealing LIFE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.ULT:
					_str = "Deploys WINDMAKER, when deployed WINDMAKER's HP is set to 50% of this ships' HP, WINDMAKER shoots bullets that deal LIFE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.PASSIVE:
					_str = "This ship does not have a passive ability";
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
					break;
				case DESC_DISPLAY.PASSIVE:
					_str = "This ship does not have a passive ability";
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
					break;
				case DESC_DISPLAY.PASSIVE:
					_str = "This ship does not have a passive ability";
			}
			break;
		case 5:
			switch(_skill){
				case DESC_DISPLAY.BASIC_ATTACK:
					_str = "Deals AOE FIRE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.SKILL:
					_str = "Fires a barrage of missiles, each dealing AOE FIRE damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.ULT:
					_str = "Applys a buff to itself: increasing ATK by 10%. This skill activates automatically. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.PASSIVE:
					_str = "For each 20 ENEMYS killed the skill cooldown is reset";
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
					break;
				case DESC_DISPLAY.PASSIVE:
					_str = "This ship does not have a passive ability";
			}
			break;
		case 7:
			switch(_skill){
				case DESC_DISPLAY.BASIC_ATTACK:
					_str = "Deals LIGHTNING damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. Ship's attack can be charged up to 3 stages, stage 1 and 2 increase its dmg by 200% and 300%. stage 3 unleashes a laser that can hit multiple enemys, said deals LIGHTNING dmg equal to [c_orange]" + string(obj_ship.scales[0] * 100 * 20) + "%[c_white] of ATK.\nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.SKILL:
					_str = "Decreases the amount of time it takes to charge for 3 shots, charge time decreases by 500%. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.ULT:
					_str = "Summons two chargers that fire a laser when done charging dealing LIGHTNING dmg equal to [c_orange]" + _str_scale + "%[c_white] of ATK. \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.PASSIVE:
					_str = "This ship does not have a passive ability";
			}
			break;
		case 8:
			switch(_skill){
				case DESC_DISPLAY.BASIC_ATTACK:
					_str = "Deals LIGHTNING damage equal to [c_orange]" + _str_scale + "%[c_white] of ATK. Every 3rd attack deliverd by ship deals enhanced dmg equal to [c_orange]" + string(obj_ship.scales[0] * 150) + "%[c_white] of ATK \nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.SKILL:
					_str = "Switches the target of ship between the closest enemy and the boss enemy. When basic attack is used, instead of firing a projectile the target will instantly take dmg. if the target is killed a new target will be selected.\nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.ULT:
					_str = "Deals LIGHTNING dmg equal to [c_orange]"+ _str_scale + "%[c_white] of ATK to the target. the first attack has 150% base chance to apply SHOCKED to the target.\nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.PASSIVE:
					_str = "This ship does not have a passive ability";
			}
			break;
		case 9:
			switch(_skill){
				case DESC_DISPLAY.BASIC_ATTACK:
					_str = "Ship has 3 TYPES of basic attack, attack-1 fires 3 shards that deal dmg equal to [c_orange]" + string(obj_ship.scales[0] * 100 / 4) + "%[c_white] of ATK. attack-2 fires a single ICE shard that deals dmg equal to [c_orange]" + string(obj_ship.scales[0] * 100 / 2) + "%[c_white] of ATK. attack-3 shoots an ICE sword dealing dmg equal to [c_orange]" + string(obj_ship.scales[0] * 100) + "%[c_white] of ATK.\nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.SKILL:
					_str = "Changes the ships basic attack type.\nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.ULT:
					_str = "Summons a ring of ICE swords around the ELITE enemy and deals dmg equal to [c_orange]" + string(1.5 * 30 * 100) + "%[c_white] of ATK to the target.\nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.PASSIVE:
					_str = "When attack TYPE-2 hits an enemy it will unleash 3 shards dealing ICE dmg equal to [c_orange]" + string(obj_ship.scales[0] * 100 / 5) + "%[c_white] of ATK. And when attack TYPE-3 hits an enemy, it will cause the it to be hit 2 additional times by the ICE SWORD.";
			}
			break;
		case 10:
			switch(_skill){
				case DESC_DISPLAY.BASIC_ATTACK:
					_str = "Ship shoots a fireball that deal dmg equal to [c_orange]" + _str_scale + "%[c_white] of ATK.\nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.SKILL:
					_str = "Summons FRIEND, when an enemy is killed FRIEND will gain 1 stack for charge. if skill is used when FRIEND is on field it will fire a number of shoots equal to the number of charges it currently has. each charge deals dmg equal to [c_orange]" + _str_scale + "%[c_white] of ATK.\nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.ULT:
					_str = "If FRIEND is on field it will tag every enemy on field and plant a bomb on it, when all enemys are tagged it will go back and detonate all bombs. each bomb deals dmg equal to [c_orange]"+ _str_scale + "%[c_white] of ATK.\nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.PASSIVE:
					_str = "When FRIEND is on the field it will decrease the dmg taken by the ship by 75% and every time the ship is hit it will gain 3 charge stacks.";
			}
			break;
		case 11:
			switch(_skill){
				case DESC_DISPLAY.BASIC_ATTACK:
					_str = "Ship shoots 3 lifeballs that deal dmg equal to [c_orange]3x" + (string(obj_ship.scales[0] * 100 / 3)) + "%[c_white] of ATK.\nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.SKILL:
					_str = "Consumes 15% HP to summon a turret to fight along with it, the turret will fire every 1s.its projectile deals dmg equal to [c_orange]" + _str_scale + "%[c_white] of ATK. Up to 5 turrets can be summoned.\nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.ULT:
					_str = "Sends all existing turrets to FRENZY state, when in FRENZY state turrets will fire rapidly.\nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.PASSIVE:
					_str = "When the ship recieves a killing blow and there is at least 1 turret on field: all turrets will be destoryed and the ship will be healed 10% of its MAX HP per turret.";
			}
			break;
		case 12:
			switch(_skill){
				case DESC_DISPLAY.BASIC_ATTACK:
					_str = "Ship shoots 3 void balls that deal dmg equal to [c_orange]3x" + (string(obj_ship.scales[0] * 100 / 3)) + "%[c_white] of ATK.\nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.SKILL:
					_str = "Ships fires a void ball that applies 25% POISON AMP and deals dmg equal to [c_orange]" + _str_scale + "%[c_white] of ATK.\nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.ULT:
					_str = "Creates a black hole that applies 4 debuffs to all enemys on field:[c_orange] 75% POISON AMP, 50% SLOWED, 25% DMG AMP, 5 stacks of POISON[c_white].\nCD: " + _skill_cd;
					break;
				case DESC_DISPLAY.PASSIVE:
					_str = "For every stack of POISON any enemy has: ATK is increased by 2% (up to 100%).";
			}
			break;
		
			
	}
	return _str;
	
}


function stringify_stats(){
	var _ship = instance_nearest(x,y, obj_ship);
	var _str = "";
	
	_str += "ATK: " + string(round(_ship.f_atk)) + "\n";
	_str += "HP: " + string(round(_ship.f_hp)) + "\n";
	_str += "SPD: " + string(_ship.f_spd) + "\n";
	_str += "CRIT RATE: " + string(round(_ship.f_cr * 100)) + "% \n";
	_str += "CRIT DAMAGE: " + string(round(_ship.f_crd * 100)) + "% \n";
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