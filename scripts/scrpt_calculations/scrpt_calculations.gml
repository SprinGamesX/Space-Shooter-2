// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function execute_dmg(_ship, _enemy, _projectile, _alternative_scale = noone, _make_indicator = true){
	if (_enemy.immune){
		create_status_indicator(_enemy.x, _enemy.y, "Immune", 0, c_gray);
		return 0;
	}
	else if (instance_exists(_ship)){
		var alt = _alternative_scale != noone;
		var _inst = instance_nearest(x, y, obj_team_manager);
		var _dmgboost = 0;
		var _atk_boost = 0;
		if (!alt){
			switch(_projectile.element){
				case ELEMENTS.ICE: _dmgboost = global.b_elem[0]; break;
				case ELEMENTS.FIRE: _dmgboost = global.b_elem[1]; break;
				case ELEMENTS.LIFE: _dmgboost = global.b_elem[2]; break;
				case ELEMENTS.VENOM: _dmgboost = global.b_elem[3]; break;
				case ELEMENTS.LIGHTNING: _dmgboost = global.b_elem[4]; break;
			}
		}
		
		// Is crit
		randomize();
		var _crit = chance(_ship.critrate);
	
		// base damage
		var _dmg = 0;
		if (!alt){
			_dmg = (_ship.atk * _projectile.scaling);
		}
		else{
			_dmg = (_ship.atk * _alternative_scale);
		}
	
		// if crit add crit dmg
		if (_crit) _dmg += _dmg * _ship.critdmg;
	
		// add elemental dmg bonus
		_dmg += _dmg * _ship.elemental_bonus;
		if (!alt){
			// apply elemental effects
			apply_ex(_enemy, _projectile);
	
			// trigger projectile on_hit
			_projectile.on_hit(_enemy);
			
			// add extra dmg based on elemental status
			_dmg += add_extra_dmg(_dmg, _enemy, _ship);
		}
		
	
		// dmg bonuses/reductions
		_dmg -= (_dmg) * _enemy.def;
		_dmg *= 1 + _enemy.dmg_amp;
	
		// Apply dmg to enemy
		_enemy.on_hit(_dmg);
	
		// Make indicator
		if (!alt){
			var _a = "";
			if (_crit) _a = "CRIT";
			create_dmg_indicator(_enemy.x, _enemy.y, _dmg, _a, _projectile.element);
		}
		global.overalldmg += _dmg;
		check_for_highest_hit(_dmg);
		// return the total dmg
		return _dmg;
	}
}

function chance(_var){
	randomize();
	return random(1) < _var;

}

function seconds(_seconds){
	return _seconds * game_get_speed(gamespeed_fps);
}

function time_to_seconds(_time){
	return _time / game_get_speed(gamespeed_fps);
}

function kill_outside_bounds(_custom_bound = -30){
	if (x < 0 + _custom_bound) or (x > room_width - _custom_bound) or (y > room_height - _custom_bound) or (y < 0 + _custom_bound){
		instance_destroy(self);
	}
}

function draw_set(_fnt, _halign = fa_center, _valign = fa_middle, _color = c_white, _alpha = 1){
	draw_set_font(_fnt);
	draw_set_color(_color);
	draw_set_valign(_valign);
	draw_set_halign(_halign);
	draw_set_alpha(_alpha)
}

function round_to_1_decimal(_num){
	var _n = _num * 10;
	_n = round(_n);
	_n = _n / 10;
	return _n;
}

function color_for_element(_element){
	var _color = c_white;
	if (_element = ELEMENTS.ICE) _color = c_aqua;
	if (_element = ELEMENTS.FIRE) _color = c_orange;
	if (_element = ELEMENTS.LIFE) _color = c_lime;
	if (_element = ELEMENTS.VENOM) _color = c_purple;
	if (_element = ELEMENTS.LIGHTNING) _color = c_yellow;
	return _color;
}

function num_in_range(_num, _min, _max){
	return _max >= _num and _num >= _min; 
}

function bounce_on_edge(_dir, _bounces){
	
	
	var _bounced = false;
	var _b = _bounces;
	if (place_meeting(x, y, obj_movement_barrier_horizontal)){
		direction = 360 - _dir;
		_bounced = true;
		_dir = direction;
	}
	if (place_meeting(x, y, obj_movement_barrier_vertical)){
		direction = 180 - _dir;
		_bounced = true;
	}
	if (_bounced) _b--;
	
	return _b;
}
