// allow the ship to move
function allow_movement(_spd){
	key_left = keyboard_check(ord("A"))
	key_right = keyboard_check(ord("D"))
	key_up = keyboard_check(ord("W"))
	key_down = keyboard_check(ord("S"))
	
	var _hmove = key_right - key_left
	var _vmove = key_down - key_up
	var _hsp = _hmove * _spd;
	var _vsp = _vmove * _spd;
	
	if (immune){
		_hsp *= immune_spd_multiplier;
		_vsp *= immune_spd_multiplier;
	}
	
	
	if (place_meeting(x + _hsp, y, obj_movement_barrier)){
		while(abs(_hsp) > 0.1){
			_hsp *= 0.5;
			if (!place_meeting(x + _hsp, y, obj_movement_barrier)) x += _hsp;
		}
		_hsp = 0;
	}
	x += _hsp;
	
	if (place_meeting(x, y + _vsp, obj_movement_barrier)){
		while(abs(_vsp) > 0.1){
			_vsp *= 0.5;
			if (!place_meeting(x, y + _vsp, obj_movement_barrier)) y += _vsp;
		}
		_vsp = 0;
	}
	y += _vsp;
	
	
}

function preform_skills(_key_attack, _key_skill, _key_ult, _key_dodge){
	// Basic attack
	if (atk_cd == 0) and (_key_attack){
		atk_cd = max_atk_cd;
		basic_attack();
	}
	if(atk_cd > 0){ atk_cd-- }

	// Skill
	if (_key_skill) and (skill_cd == 0){
		skill_cd = max_skill_cd;
		skill();
	}
	if(skill_cd > 0) {skill_cd --}

	// Ult
	if (_key_ult) and (ult_cd == 0){
		ult_cd = max_ult_cd;
		ultimate();
	}
	if(ult_cd > 0) {ult_cd --}
	
	if (_key_dodge) and (immune_cd == 0){
		immune = true;
		immune_cd = immune_cd_max;
	}
	if (immune){
		immune_time--;
		if (immune_time <= 0){
			immune = false;
			immune_time = immune_time_max;
			immune_cd = immune_cd_max;
		}
	}
	if (immune_cd > 0) immune_cd--;
	
	
	if (immune_cd < 0) immune_cd = 0;
	if (ult_cd < 0) ult_cd = 0;
	if (skill_cd < 0) skill_cd = 0;
	if (atk_cd < 0) atk_cd = 0;
}

function create_projectile(_obj, _scaling, _dir, _parent, _speed, _x = x, _y = y, _aoe = -1, _base_chance = 0.2, _pierce = 0){
	 var _inst = instance_create_layer(_x, _y, "Projectiles", _obj);
	 with(_inst){
		scaling = _scaling;
		source = _parent;
		direction = _dir;
		speed = _speed;
		aoe = _aoe;
		pierce = _pierce;
		if (pierce > 0){
			hit_list = ds_list_create();
		}
		effect_chance = _base_chance;
	 }
	 return _inst;
}

function create_charge_projectile(_obj, _scaling, _dir, _parent, _speed, _charge, _x = x, _y = y, _aoe = -1, _base_chance = 0.2){
	 with(instance_create_layer(_x, _y, "Projectiles", _obj)){
		scaling = _scaling;
		charge = _charge;
		source = _parent;
		direction = _dir;
		speed = _speed;
		aoe = _aoe;
		effect_chance = _base_chance;
	 }
}

function create_projectile_attach(_obj, _scaling, _parent, _hits, _cd,_lenx,_leny, _x = x, _y = y, _aoe = -1, _base_chance = 0.2){
	 with(instance_create_layer(_x, _y, "Projectiles", _obj)){
		cd = _cd;
		hits = _hits;
		length = _lenx;
		height = _leny;
		source = _parent;
		aoe = _aoe;
		effect_chance = _base_chance;
		scaling = _scaling / _hits;
		alarm[0] = cd;
	 }
}

function create_mine(_obj, _scale, _parent, _target, _aoe_size, _base_chance = 0.2){
	var _inst = create_projectile(_obj, _scale, random(360), _parent, 0, _target.x, _target.y, _aoe_size, _base_chance);
	with(_inst){
		target = _target;
	}
	return _inst;
}

function create_deployable(_type, _hp, _parent = self){
	with(instance_create_layer(x, y, "Deployables", _type)){
		hp = _hp;
		maxhp = hp;
		parent = _parent;
	}
}
function create_follower(_type,_dis_x,_dis_y, _scaling, _cd, _duration, _target = self, _source = self){
	var _inst = instance_create_layer(x, y, "Deployables", _type);
	with(_inst){
		setup(_target,_dis_x,_dis_y, _scaling, _cd, _duration);
		_inst.source = _source;
	}
	return _inst;
}

function create_healing_orb(_x, _y, _heal, _spd){
	with(instance_create_layer(_x, _y, "Projectiles", obj_healing_orb)){
		heal = _heal;
		speed = _spd;
	}
}

function consume_hp(_amount){
	if (hp == 1) return false;
	if (hp - _amount > 0){
		hp -= _amount;
		return true
	}
	else {
		hp = 1;
		return true;	
	}
}

function count_poisoned_enemys(){
	var _enemys = ds_list_create();
	var n = collision_rectangle_list(0, 0, room_width, room_height, parent_enemy, 0, 0, _enemys, 0);
	var count = 0;
	for (var i = 0; i < n; i++){
		var _enemy = _enemys[|i];
		count += _enemy.poison;
	}
	ds_list_destroy(_enemys);
	return count;
}

function create_buff(_type, _dur, _mag){
	var _inst = instance_create_depth(-200, -200, -999, obj_buff);
	_inst.setup(_type, _dur, _mag);
}