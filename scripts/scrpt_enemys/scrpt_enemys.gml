global.lvl = 0;

enum STATUS{
	DMG_AMP,
	SLOW,
	POISON_AMP,
	FREEZE,
	EXPLOSIVE,
	LIFE_RIPE,
	POISON,
	SHOCKED
}

function frozen(_amp){
	if (freeze > 0){
		return _amp * freeze;
	}
	else return 0;
}

function summon_enemy(_type, _lv, _x , _y, _dir = 180){
	var _inst = instance_create_layer(_x, _y, "Enemy", _type);
	set_enemy(_inst, _lv, _dir);
	return _inst;
}

function set_enemy(_enemy ,_lv, _dir){
	with(_enemy){
		lv = _lv;
		hp = hp * _lv;
		maxhp = hp;
		dmg += lv * 0.5 * dmg;
		direction = _dir;
	}
}

function summon_enemy_orbit(_x,_y,_lv, _amount, _distance, _spin_speed){
	var _r = 360 / _amount;
	for (var _i = 0; _i < 360; _i += _r){
		var _inst = summon_enemy(obj_enemy_orbit, _lv, _x, _y);
		_inst.set_orbit(_x, _y, _distance, _i, _spin_speed);
	}
}

function summon_enemy_double(_lv){
	return summon_enemy(obj_enemy_double, _lv, room_width - 32, room_height / 2, 0);
}

function summon_enemy_magnet(_lv){
	// 734.5
	return summon_enemy(obj_enemy_magnet, _lv,  room_width - 32, room_height / 2, 0);
}

function summon_boss_reddiamond(_lv){
	return summon_enemy(obj_boss_red_diamond, _lv, room_width + 100, room_height / 2);
}
function summon_boss_sword(_lv){
	return summon_enemy(obj_boss_sword, _lv, -200, room_height / 2);
}

function summon_enemy_orbiter(_lv){
	var _x = room_width - 64;
	var _y = room_height / 2;
	var _inst1 = summon_enemy(obj_enemy_orbiter, _lv, _x, room_height + 32, 0);
	var _inst2 = summon_enemy(obj_enemy_orbiter, _lv, _x, - 32, 0);
	_inst1.set_orbit(_x, _y, 1, _inst2);
	_inst2.set_orbit(_x, _y, 2, _inst1);
	return _inst1;
}

function summon_enemy_bladie(_x ,_y ,_dmg, _acc, _auto_aim = false, _dir_acc = 0, _dir = 180){
	var _inst = instance_create_layer(_x, _y, "Enemy", obj_enemy_bladie);
	with(_inst){
		dmg = _dmg;
		acc = _acc;
		auto_aim = _auto_aim;
		dir_acc = _dir_acc;
		direction = _dir;
	}
	return _inst;
}
function summon_enemy_orbiting_sword(_x,_y,_dmg , _amount, _distance, _spin_speed, _lifetime){
	var _r = 360 / _amount;
	for (var _i = 0; _i < 360; _i += _r){
		var _inst = instance_create_layer(_x, _y, "Enemy", obj_enemy_orbiting_sword);
		_inst.set_orbit(_x, _y, _distance, _i, _spin_speed);
		_inst.dmg = _dmg;
		_inst.lifetime = _lifetime;
	}
}

function summon_enemy_magnet_follower(_lvl, _x, _y){
	var _inst = instance_create_layer(_x, _y, "Enemy", obj_enemy_magent_follower)
	with(_inst){
		base_x = x;
		base_y = y;
		lv = _lvl;
		hp = base_hp * lv;
		dmg = base_dmg * lv;
		max_hp = hp;
	}
	return _inst;
}

function stoppable(){
	if (stopped) {
		speed = 0;
		exit;
	}
}

function pause_all_enemys(){
	var _insts = ds_list_create();
	var _num = collision_rectangle_list(-50, -50, room_width + 50, room_height + 50, parent_enemy, false, false, _insts, false);
	
	for (var i = 0; i < _num; i++){
		var _inst = ds_list_find_value(_insts, i);
		_inst.stopped = true;
	}
	
	
	ds_list_destroy(_insts);
}

function resume_all_enemys(){
	var _insts = ds_list_create();
	var _num = collision_rectangle_list(-50, -50, room_width + 50, room_height + 50, parent_enemy, false, false, _insts, false);
	
	for (var i = 0; i < _num; i++){
		var _inst = ds_list_find_value(_insts, i);
		_inst.stopped = false;
	}
	
	
	ds_list_destroy(_insts);
}

function apply_status(_enemy, _type, _chance, _time, _magnitude, _display = true){
	switch(_type){
		case STATUS.DMG_AMP:
			if(_enemy.dmg_amp <= _magnitude) and (chance(_chance - _enemy.resist)){
				_enemy.dmg_amp = _magnitude;
				_enemy.debuff_cds[0] = _time;
				if (_display)
					create_status_indicator(_enemy.x, _enemy.y, "DMG AMP", _magnitude, c_red);
			}
			break;
		case STATUS.SLOW:
			if(_enemy.slowed <= _magnitude) and (chance(_chance - _enemy.resist)){
				_enemy.slowed = _magnitude;
				_enemy.debuff_cds[1] = _time;
				if (_display)
					create_status_indicator(_enemy.x, _enemy.y, "SLOWED", _magnitude, c_gray);
			}
			break;
		case STATUS.POISON_AMP:
			if(_enemy.poison_amp <= _magnitude) and (chance(_chance - _enemy.resist)){
				_enemy.poison_amp = _magnitude;
				_enemy.debuff_cds[2] = _time;
				if (_display)
					create_status_indicator(_enemy.x, _enemy.y, "POISON AMP", _magnitude, c_purple);
			}
			break;
	}
}

function apply_status_elemental(_enemy, _type, _chance, _amount, _display = false){
	switch(_type){
		case STATUS.POISON:
			if (chance(_chance)){
				if (_enemy.poison + _amount <= 15) _enemy.poison += _amount;
					else _enemy.poison = 15;
				if (_display){
					create_status_indicator(_enemy.x, _enemy.y, "POISON +" + string(_amount), 0, c_purple);
				}
			}
			break;
	}
}
