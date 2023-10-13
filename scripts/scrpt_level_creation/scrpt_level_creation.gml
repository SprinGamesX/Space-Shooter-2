global.currentfloor = 0;
global.currentpos = -10;
global.domains = ds_list_create();
global.game_lost = false;


function create_domain(_x, _y, _floore, _pos, _domain_type = obj_domain_combat){
	var _inst = instance_create_layer(_x, _y, "Domains", _domain_type)
	_inst.floore = _floore;
	_inst.pos = _pos;
	return _inst;
}

function create_random_domain(_x, _y, _floore, _pos){
	var _doms = [obj_domain_combat, obj_domain_elite];
	var _r = irandom(array_length(_doms) - 1);
	ds_list_add(global.domains, _doms[_r]);
	return create_domain(_x, _y, _floore, _pos, _doms[_r]);
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
