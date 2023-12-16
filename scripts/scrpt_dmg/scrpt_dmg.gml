// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function execute_dmg(_ship, _enemy, _projectile, _alternative_scale = noone, _make_indicator = true){
	if (_enemy.immune){
		create_status_indicator(_enemy.x, _enemy.y, "Immune", 0, c_gray);
		return 0;
	}
	else if (instance_exists(_ship)){
		var alt = _alternative_scale != noone;
		// Is crit
		randomize();
		var _crit = chance(_ship.critrate);
	
		// base damage
		var _dmg = 0;
		if (!alt)	
			_dmg = base_dmg(_dmg, _ship, _projectile.scaling);
		else {
			_dmg = base_dmg(_dmg, _ship, _alternative_scale);
		}
		
		// Augment
		if (!alt) _dmg = augment_dmg(_dmg, _ship, _enemy, _projectile.element);
		else _dmg = augment_dmg(_dmg, _ship, _enemy, -1);
		
		// if crit add crit dmg
		if (_crit) _dmg += _dmg * _ship.critdmg;
		
		if (!alt){
			// apply elemental effects
			apply_ex(_enemy, _projectile);
	
			// trigger projectile on_hit
			_projectile.on_hit(_enemy);
			
			// Shock
			if(_enemy.shocked) shock_nearby_enemys(_enemy, _dmg, _ship);
		}
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

function base_dmg(_dmg, _ship, _scale){
	_dmg += (_ship.atk * (1+global.b_atk)) * _scale;
	return _dmg;
}

function augment_dmg(_dmg, _ship, _enemy, _element){
	var _augment = 0;
	switch (_element){
		case ELEMENTS.ICE: _augment = global.b_elem[0]; break;
		case ELEMENTS.FIRE: _augment = global.b_elem[1]; break;
		case ELEMENTS.LIFE: _augment = global.b_elem[2]; break;
		case ELEMENTS.VENOM: _augment = global.b_elem[3]; break;
		case ELEMENTS.LIGHTNING: _augment = global.b_elem[4]; break;
		default: _augment = 0;
	}
	// add elemental dmg bonus
	_dmg += (_dmg * (_ship.elemental_bonus + _augment)) + add_extra_dmg(_dmg, _enemy, _ship);
	
	// dmg bonuses/reductions
	_dmg *= 1 + (_enemy.dmg_amp + global.b_totaldmg);
	_dmg -= (_dmg) * _enemy.def;
	
	return _dmg;
}

function add_extra_dmg(_dmg, _inst, _ship){
	var f_dmg = 0;
	// Life ripe dmg amp
	var _amp = 1;
	if (chance(_ship.ex)) _amp = 1.5;
	f_dmg += (_ship.max_hp / 100) * _inst.life_ripe * _amp;
	return f_dmg;
	
}