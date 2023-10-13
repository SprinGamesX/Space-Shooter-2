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

function preform_skills(_key_attack, _key_skill, _key_ult){
	// Basic attack
	if (atk_cd == 0) and (_key_attack){
		atk_cd = max_atk_cd;
		basic_attack();
	}
	if(atk_cd != 0){ atk_cd-- }

	// Skill
	if (_key_skill) and (skill_cd == 0){
		skill_cd = max_skill_cd;
		skill();
	}
	if(skill_cd != 0) {skill_cd --}

	// Ult
	if (_key_ult) and (ult_cd == 0){
		ult_cd = max_ult_cd;
		ultimate();
	}
	if(ult_cd != 0) {ult_cd --}
}

function create_projectile(_obj, _scaling, _dir, _parent, _speed, _x = x, _y = y, _maxhp = 0, _hpscale = 0, _venom_amp = 0, _aoe = -1){
	 with(instance_create_layer(_x, _y, "Projectiles", _obj)){
		dmg = calculate_dmg(_parent.atk, _parent.critrate, _parent.critdmg, _scaling, _maxhp, _hpscale);
		if (_hpscale > 0){
			if (dmg = _parent.atk * _scaling + (_maxhp * _hpscale)) is_crit = false;
			else is_crit = true;
		
		}
		else {
			if (dmg = _parent.atk * _scaling) is_crit = false;
			else is_crit = true;
		}
		source = _parent;
		direction = _dir;
		speed = _speed;
		venom_amp = _venom_amp;
		aoe = _aoe;
	 }
}

function create_hp_scaling(_basic_scale,_skill_scale,_ult_scale,_obj = self){
	_obj.atk_hp_scale = _basic_scale;
	_obj.skill_hp_scale = _skill_scale;
	_obj.ult_hp_scale = _ult_scale;
}

function create_deployable(_type, _hp, _parent = self){
	with(instance_create_layer(x, y, "Deployables", _type)){
		hp = _hp;
		maxhp = hp;
		parent = _parent;
	}
}

