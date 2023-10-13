// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function projectile_collision(_object = self, _hitlist = -1, _aoe_size = -1){
	var _inst = instance_place(x, y, parent_enemy);
	if (_hitlist != -1) and (exists_in_hitlist(_hitlist, _inst)) exit;
	if (_inst != noone) and (!_inst.immune){
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
				if (_inst.poison + self.venom_amp <= 15) _inst.poison += self.venom_amp;
				else _inst.poison = 15;
				
			}
		var _ship = instance_nearest(x, y, parent_ship);		
		var _dmg = _object.dmg + (_ship.max_hp / 100) * _inst.life_ripe;
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

function exists_in_hitlist(_hit_list, _enemy){
	if (_hit_list != -1)
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