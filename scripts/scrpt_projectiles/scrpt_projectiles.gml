// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function projectile_collision(_object = self, _hitlist = -1, _aoe_size = -1){
	var _inst = instance_place(x, y, parent_enemy);
	if (_hitlist != -1) and (exists_in_hitlist(_hitlist, _inst)) exit;
	if (_inst != noone) and (!_inst.immune){
		var _ship = instance_nearest(x, y, parent_ship);
		apply_ex(_inst, _ship.ex,self.effect_chance + _ship.effect_hit_rate);	
		var _dmg = add_extra_dmg(_object.dmg, _inst);
		// AOE
		if (_aoe_size != -1){
			if (_hitlist != -1)
				ds_list_add(_hitlist, _inst)
			else instance_destroy(_object);
			create_aoe(_object, _aoe_size);
		}
		else{
			// pierce
			if (_hitlist != -1){
				ds_list_add(_hitlist, _inst);
				_inst.hp -= _dmg;
				create_hit_indicator(_object);
				create_dmg_indicator(_inst.x,_inst.y,_dmg, _object.is_crit, self.element);
				if (_object.object_index != obj_aoe){
					if (object_is_ancestor(_inst.object_index, parent_elite_enemy)) instance_destroy();
				}
			}
			else {
				instance_destroy();
				create_hit_indicator(_object);
				_inst.hp -= _dmg;
				create_dmg_indicator(_inst.x,_inst.y,_dmg, _object.is_crit, self.element);
			}
		}
		
	}
	
}
function projectile_attach_collision(_hitlist, _lenx, _leny, _source, _centered = false, _aoe_size = -1){
	var _y = y;
	if (_centered) _y = y - _leny / 2;
	draw_rectangle(x - _lenx / 2, _y, x + _lenx, y + _leny, false);
	var _num = collision_rectangle_list(x - _lenx / 2, _y, x + _lenx, y + _leny, parent_enemy, false, true, _hitlist, false);
	show_debug_message(_num);
	for(var _i = 0; _i < _num; _i++){
		var _inst = ds_list_find_value(_hitlist, _i);
		if (!_inst.immune){
			var _dmg = calculate_dmg(_source.atk, _source.critrate, _source.critdmg, self.dmg_scale);
			_dmg = add_extra_dmg(_dmg, _inst);
			//show_debug_message(string(_source.atk) + ", " + string(_source.critrate) + ", " + string(_source.critdmg) + ", " + string(self.dmg_scale))
			create_dmg_indicator(_inst.x, _inst.y, _dmg, false ,element);
			_inst.hp -= _dmg;
			//show_debug_message(_dmg)
			apply_ex(_inst, _source.ex, effect_chance);
		}
	}
	ds_list_clear(_hitlist);
}

function apply_ex(_inst, _ex, _chance){
	if (chance(_chance - _inst.resist)){
		if (self.element == ELEMENTS.ICE){
				if (_inst.freeze < 20) _inst.freeze++;
				_inst.alarm[11] = seconds(5);
			}
		if (self.element == ELEMENTS.FIRE){
				randomize();
				if (_inst.explosive = false) and (random(1) < 0.5){
					_inst.explosive = true;
					_inst.alarm[10] = seconds(10);
				}
			}
		if (self.element == ELEMENTS.LIFE){
				if (_inst.life_ripe < 10) _inst.life_ripe++;
				_inst.alarm[8] = seconds(10);
			}
		if (self.element == ELEMENTS.VENOM){
				if (_inst.poison + 1 <= 15) _inst.poison += 1;
				else _inst.poison = 15;	
			}
		if (self.element == ELEMENTS.LIGHTNING){
			if(_inst.shocked = false) and (chance(0.5)){
				_inst.shocked = true;
				_inst.alarm[7] = seconds(20);
			}
		}
	}
}

function add_extra_dmg(_dmg, _inst){
	var f_dmg = _dmg;
	var _ship = instance_nearest(x, y, parent_ship);
	// Freeze dmg amp
	var _amp = 1;
	if (chance(_ship.ex)) _amp = 1.5;
	f_dmg += (_dmg / 100) * _inst.freeze * _amp;
	// Life ripe dmg amp
	_amp = 1;
	if (chance(_ship.ex)) _amp = 1.5;
	f_dmg += (_ship.max_hp / 100) * _inst.life_ripe * _amp;
	// Elemental dmg bonus amp
	f_dmg += (f_dmg / 100) * (_ship.elemental_bonus);
	// Shock
	if(_inst.shocked) shock_nearby_enemys(_inst, f_dmg, _ship);
	return f_dmg;
	
}

function shock_nearby_enemys(_inst, _dmg, _ship){
	var _list = ds_list_create();
	var _r = 64;
	if (chance(_ship.ex)) _r *= 2;
	var _num = collision_circle_list(_inst.x, _inst.y, _r, parent_enemy, false, true, _list, true);
	_dmg /= 2;
	for(var i = 0; i < _num; i++){
		var _e = _list[|i];
		create_dmg_indicator(_e.x, _e.y, string(_dmg) + "\n Shocked",,ELEMENTS.LIGHTNING);
		_e.hp -= _dmg;
	}
	ds_list_destroy(_list);
}

function exists_in_hitlist(_hit_list, _enemy){
	if (ds_exists(_hit_list, ds_type_list))
		return ds_list_find_index(_hit_list, _enemy) != -1;
	else return true;
}

function create_aoe(_parent, _size, _x = x, _y = y){
	with(instance_create_layer(_x, _y, "SpecialEffects", obj_aoe)){
		dmg = _parent.dmg;
		is_crit = _parent.is_crit;
		size = _size;
		switch(_parent.element){
			case ELEMENTS.FIRE: sprite_index = spr_fire_aoe; break;
			case ELEMENTS.ICE: sprite_index = spr_ice_aoe; break;
			case ELEMENTS.VENOM: sprite_index = spr_venom_aoe; break;
			case ELEMENTS.LIFE: sprite_index = spr_life_aoe; break;
		}
		element = _parent.element;
		venom_amp = _parent.venom_amp;
		source = _parent.source;
	}
}



function aoe_collision(_hit_list){
	projectile_collision(self, _hit_list);
}

function create_hit_indicator(_parent ,_x = x, _y = y){
	with(instance_create_layer(_x, _y, "SpecialEffects", obj_aoe)){
		dmg = 0;
		is_crit = false;
		size = 0.5;
		switch(_parent.element){
			case ELEMENTS.FIRE: sprite_index = spr_fire_aoe; break;
			case ELEMENTS.ICE: sprite_index = spr_ice_aoe; break;
			case ELEMENTS.VENOM: sprite_index = spr_venom_aoe; break;
			case ELEMENTS.LIFE: sprite_index = spr_life_aoe; break;
		}
	}
}


function seek_closest_enemy(){
	if (instance_exists(parent_enemy)){
		var _enemy = instance_nearest(x,y, parent_enemy);
		var _dir = point_direction(x,y, _enemy.x, _enemy.y);
		direction = _dir;
	}
}

function seek_closest_elite(_s = 30){
	if (instance_exists(parent_elite_enemy)){
		var _enemy = instance_nearest(x,y, parent_elite_enemy);
		var _dir = point_direction(x,y, _enemy.x, _enemy.y);
		var _d = direction;
		if (_d > 180) _d -= 360;
		var _r = _dir;
		if (_r > 180) _r -= 360;
		var _error = abs((_r - _d) / 180);
		if ((_r - _d) > 0) direction += _s * _error;
		if ((_r - _d) < 0) direction -= _s * _error;
	}
	else seek_closest_enemy();
}

function seek_closest_player(_s = 30){
	if (instance_exists(parent_ship)){
		var _enemy = instance_nearest(x,y, parent_ship);
		var _dir = point_direction(x,y, _enemy.x, _enemy.y);
		var _d = direction;
		var _r = _dir;
		var _error = abs((_r - _d) / 180);
		if ((_r - _d) > 0) direction += _s * _error;
		if ((_r - _d) < 0) direction -= _s * _error;
	}
	else seek_closest_enemy();
}