// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function projectile_collision(_object = self, _hitlist = -1, _aoe_size = -1){
	var _inst = instance_place(x, y, parent_enemy);
	if (_hitlist != -1) and (exists_in_hitlist(_hitlist, _inst)) exit;
	if (_inst != noone) {
		var _ship = _object.source;
		if (_ship == noone){
			_ship = instance_nearest(x, y, parent_ship);
		}
		// AOE
		if (_aoe_size != -1){
			if (_hitlist != -1)
				ds_list_add(_hitlist, _inst)
			else instance_destroy(_object);
			create_aoe(_object, _aoe_size);
		}
		else{
			// pierce
			if (_hitlist != -1) and ((pierce > 0) or (object_index == obj_aoe)){
				ds_list_add(_hitlist, _inst);
				execute_dmg(_ship, _inst, _object);
				create_hit_indicator(_object);
				if (_object.object_index != obj_aoe){
					if (object_is_ancestor(_inst.object_index, parent_elite_enemy)) instance_destroy();
				}
			}
			else {
				instance_destroy();
				create_hit_indicator(_object);
				execute_dmg(_ship, _inst, _object);
			}
		}
		
	}
	
}
function projectile_attach_collision(_hitlist, _lenx, _leny, _source, _centered = false, _aoe_size = -1){
	var _y = y;
	var _ship = _source;
	if (object_is_ancestor(_source.object_index, parent_follower)){
		_ship = _source.source;
	}
	if (_centered) _y = y - _leny / 2;
	draw_rectangle(x - _lenx / 2, _y, x + _lenx, y + _leny, false);
	var _num = collision_rectangle_list(x - _lenx / 2, _y, x + _lenx, y + _leny, parent_enemy, false, true, _hitlist, false);
	for(var _i = 0; _i < _num; _i++){
		var _inst = ds_list_find_value(_hitlist, _i);
		if (!_inst.immune){
			create_hit_indicator(self, _inst.x, _inst.y);
			execute_dmg(_ship, _inst, self);
		}
	}
	ds_list_clear(_hitlist);
}

function projectile_laser_collision(_hitlist, _source, _aoe_size = -1){
	var _y = y;
	var _ship = _source;
	if (object_is_ancestor(_source.object_index, parent_follower)){
		_ship = _source.source;
	}
	var _num = instance_place_list(x, y, parent_enemy, _hitlist, false);
	for(var _i = 0; _i < _num; _i++){
		var _inst = ds_list_find_value(_hitlist, _i);
		if (!_inst.immune){
			create_hit_indicator(self, _inst.x, _inst.y);
			execute_dmg(_ship, _inst, self);
		}
	}
	ds_list_clear(_hitlist);
}

function apply_ex(_inst, _source){
	if (chance(_source.effect_chance - _inst.resist)){
		if (_source.element == ELEMENTS.ICE){
				if (_inst.freeze < 20) _inst.freeze++;
				if (_inst.freeze > 0){
					apply_status(_inst, STATUS.DMG_AMP, 1, seconds(5), 0.01 * _inst.freeze, false);
					apply_status(_inst, STATUS.SLOW, 1, seconds(5), 0.01 * _inst.freeze, false);
				}
				_inst.alarm[11] = seconds(5);
			}
		if (_source.element == ELEMENTS.FIRE){
				randomize();
				if (_inst.explosive = false) and (random(1) < 0.5){
					_inst.explosive = true;
					_inst.alarm[10] = seconds(10);
				}
			}
		if (_source.element == ELEMENTS.LIFE){
				if (_inst.life_ripe < 10) _inst.life_ripe++;
				_inst.alarm[8] = seconds(10);
			}
		if (_source.element == ELEMENTS.VENOM){
				if (_inst.poison + 1 <= 15) _inst.poison += 1;
				else _inst.poison = 15;	
			}
		if (_source.element == ELEMENTS.LIGHTNING){
			if(_inst.shocked = false) and (chance(0.5)){
				_inst.shocked = true;
				_inst.alarm[7] = seconds(20);
			}
		}
	}
}



function shock_nearby_enemys(_inst, _dmg, _ship){
	var _list = ds_list_create();
	var _r = 64;
	if (chance(_ship.ex)) _r *= 2;
	var _num = collision_circle_list(_inst.x, _inst.y, _r, parent_enemy, false, true, _list, true);
	for(var i = 0; i < _num; i++){
		var _e = _list[|i];
		if (_e.id != _inst.id){
			_dmg = execute_dmg(_ship, _e, noone, 0.1, false);
			create_dmg_indicator(_e.x, _e.y, _dmg, "Shocked", ELEMENTS.LIGHTNING);
		}
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
		scaling = _parent.scaling;
		size = _size;
		switch(_parent.element){
			case ELEMENTS.FIRE: sprite_index = spr_fire_aoe; break;
			case ELEMENTS.ICE: sprite_index = spr_ice_aoe; break;
			case ELEMENTS.VENOM: sprite_index = spr_venom_aoe; break;
			case ELEMENTS.LIFE: sprite_index = spr_life_aoe; break;
			case ELEMENTS.LIGHTNING: sprite_index = spr_lightning_aoe; break;
		}
		element = _parent.element;
		venom_amp = _parent.venom_amp;
		source = _parent.source;
	}
}

function create_aoe_direct(_scale, _size, _element, _x = x, _y = y, _venom_amp = 0, _source = self){
	with(instance_create_layer(_x, _y, "SpecialEffects", obj_aoe)){
		scaling = _scale;
		size = _size;
		switch(_element){
			case ELEMENTS.FIRE: sprite_index = spr_fire_aoe; break;
			case ELEMENTS.ICE: sprite_index = spr_ice_aoe; break;
			case ELEMENTS.VENOM: sprite_index = spr_venom_aoe; break;
			case ELEMENTS.LIFE: sprite_index = spr_life_aoe; break;
			case ELEMENTS.LIGHTNING: sprite_index = spr_lightning_aoe; break;
		}
		element = _element;
		venom_amp = _venom_amp;
		source = _source;
	}
}



function aoe_collision(_hit_list){
	projectile_collision(self, _hit_list);
}

function create_hit_indicator(_parent ,_x = x, _y = y){
	with(instance_create_layer(_x, _y, "SpecialEffects", obj_aoe)){
		scaling = 0;
		is_crit = false;
		size = 0.5;
		switch(_parent.element){
			case ELEMENTS.FIRE: sprite_index = spr_fire_aoe; break;
			case ELEMENTS.ICE: sprite_index = spr_ice_aoe; break;
			case ELEMENTS.VENOM: sprite_index = spr_venom_aoe; break;
			case ELEMENTS.LIFE: sprite_index = spr_life_aoe; break;
			case ELEMENTS.LIGHTNING: sprite_index = spr_lightning_aoe; break;
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
	if (instance_exists(obj_team_manager)){
		var _enemy = obj_team_manager.get_active_ship;
		var _dir = point_direction(x,y, _enemy.x, _enemy.y);
		var _d = direction;
		var _r = _dir;
		var _error = abs((_r - _d) / 180);
		if ((_r - _d) > 0) direction += _s * _error;
		if ((_r - _d) < 0) direction -= _s * _error;
	}
	else seek_closest_enemy();
}

function make_ice_sword(_target, _scale = 1, _dir = 0){
	with(instance_create_layer(x, y, "Projectiles", obj_ice_sword)){
		target = _target;
		image_xscale = _scale;
		image_yscale = _scale;
		image_angle = _dir;
	}
}

function detonate_all_mines(){
	var list = ds_list_create();
	var num = collision_rectangle_list(-50, -50, room_width + 50, room_height + 50, parent_mine, false, true, list, false);
	for (var i = 0; i < num; i++){
		list[|i].detonate();
	}
	screenshake(seconds(2), 1, 0.25);
	ds_list_destroy(list);
}