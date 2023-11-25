global.currentfloor = 0;
global.currentpos = -10;
global.domains = ds_list_create();
global.pending_reset = false;


function create_domain(_x, _y, _floore, _pos, _domain_type = obj_domain_combat){
	var _inst = instance_create_layer(_x, _y, "Domains", _domain_type)
	_inst.floore = _floore;
	_inst.pos = _pos;
	return _inst;
}

function create_random_domain(_x, _y, _floore, _pos){
	var _dom = choose(obj_domain_elite, obj_domain_combat, obj_domain_time);
	ds_list_add(global.domains, _dom);
	return create_domain(_x, _y, _floore, _pos, _dom);
}

function set_available(_domains){
	for (var _i = 0; _i < ds_list_size(_domains); _i++){
		var _dom = _domains[|_i];
		if (instance_exists(_dom)){
			_dom.access();
			if (_dom.floore != global.currentfloor + 1) _dom.lock();
			if (_dom.pos > global.currentpos + 1) or (_dom.pos < global.currentpos - 1) _dom.lock();
	}}
}

function get_elite_for_trial(){
	var _elite = noone;
	switch(global.trialtype){
		case TRIAL.BLADE: _elite = choose(obj_enemy_double, obj_enemy_orbiter, obj_enemy_magnet); break;
		case TRIAL.DECIMATION: _elite = choose(obj_elite_cannon, obj_elite_meteor, obj_enemy_double); break;
		default: _elite = choose(obj_enemy_double, obj_enemy_orbiter, obj_enemy_magnet, obj_elite_cannon, obj_elite_meteor);
	}
	return _elite;
}

function summon_chosen_elite(_elite, lvl){
	switch(_elite){
		case obj_enemy_orbiter: 
			win_condition = summon_enemy_orbiter(lvl);
			win_condition2 = win_condition.duo;
			break;
		case obj_enemy_double: 
			win_condition = summon_enemy_double(lvl);
			break;
		case obj_enemy_magnet: 
			win_condition = summon_enemy_magnet(lvl);
			break;
		case obj_elite_cannon: 
			win_condition = summon_elite_cannon(lvl);
			break;
		case obj_elite_meteor: 
			win_condition = summon_elite_meteor(lvl);
			break;
	}
}