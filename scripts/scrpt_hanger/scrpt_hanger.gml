
global.ship_datas = ds_list_create();


function set_ship_levels(){
	ds_map_add(global.ship_levels,obj_iceship1, 20);
	ds_map_add(global.ship_levels,obj_iceship2, 5);
	ds_map_add(global.ship_levels,obj_fireship1, 5);
	ds_map_add(global.ship_levels,obj_fireship2, 5);
	ds_map_add(global.ship_levels,obj_lifeship1, 5);
	ds_map_add(global.ship_levels,obj_venomship1, 5);
}

function ini_ship_data(_id, _name){
	var _ship_data = ds_map_create();
	ds_map_add(_ship_data, "id", _id);
	ds_map_add(_ship_data, "name", _name);
	ds_map_add(_ship_data, "level", 1);
	ds_map_add(_ship_data, "atk level", 1);
	ds_map_add(_ship_data, "skill level", 1);
	ds_map_add(_ship_data, "ult level", 1);
	ds_list_add(global.ship_datas, _ship_data);

}

function ini_all_ships(){
	ini_ship_data(0, "Ice Ship 1");
	ini_ship_data(1, "Fire Ship 1");
	ini_ship_data(2, "Life Ship 1");
	ini_ship_data(3, "Ice Ship 2");
	ini_ship_data(4, "Venom Ship 1");
	ini_ship_data(5, "Fire Ship 2");
}

function save_ship_levels(){
	ini_open("data.ini");
	var _json = json_encode(global.ship_levels, true)
	ini_write_string("ship data", "levels", _json);
	ini_close();
}

function save_ship_data(_id){
	var _ship_data = ds_list_find_value(global.ship_datas, _id);
	ini_open("data.ini");
	var _str = ds_map_write(_ship_data);
	ini_write_string("ship data", _id, _str);
	ini_close();
}

function save_all_ships_datas(){
	for(var _i = 0; _i < ds_list_size(global.ship_datas); _i++){
		save_ship_data(_i);
	}
}

function load_ship_data(){
	if (!file_exists("data.ini")){
		ini_all_ships();
	}
	else {
		read_all_ship_datas();
		print_ship_datas();
	}
}

function read_all_ship_datas(){
	ini_open("data.ini");
	for (var _i = 0; _i <= 5; _i++){
		var _data = ini_read_string("ship data", _i, "");
		var _ship_data = ds_map_create();
		ds_map_read(_ship_data, _data);
		ds_list_set(global.ship_datas, _i, _ship_data);
	}
	ini_close();
}

function print_ds_map(_map){
	var _next = ds_map_find_first( _map );
	var _count = 0;
	while ( !is_undefined( _next ) ) {
	  var _string = string( _next ) + " :" + string( _map[? _next ] );
	  show_debug_message(_string);
 
	  _next = ds_map_find_next( _map, _next );
	  _count++;
	}
}

function print_ship_datas(){
	for (var i = 0; i < ds_list_size(global.ship_datas); i++){
		print_ds_map(ds_list_find_value(global.ship_datas, i));
	}
}


function copy_data(_list){
	load_ship_data();
	for (var _i = 0; _i < ds_map_size(global.ships); _i++){
		global.selected_ship = _i;
		var _database = ds_map_create();
		var _ship = instance_create_depth(-9999, -9999, 999, ds_map_find_value(global.ships, _i));
		ds_map_add(_database, "level", _ship.lvl);
		ds_map_add(_database, "hp", _ship.hp);
		ds_map_add(_database, "atk", _ship.atk);
		ds_map_add(_database, "spd", _ship.spd);
		ds_map_add(_database, "crit rate", _ship.critrate);
		ds_map_add(_database, "crit dmg", _ship.critdmg);
		ds_map_add(_database, "atk cd", _ship.atk_cd);
		ds_map_add(_database, "skill cd", _ship.skill_cd);
		ds_map_add(_database, "ult cd", _ship.ult_cd);
		ds_map_add(_database, "atk scale", _ship.atk_scale);
		ds_map_add(_database, "skill scale", _ship.skill_scale);
		ds_map_add(_database, "ult scale", _ship.ult_scale);
		ds_map_add(_database, "element", _ship.element);
		ds_map_add(_database, "dot scale", _ship.dot_scale);
		if (variable_instance_exists(_ship.id, "atk_hp_scale")){
			ds_map_add(_database, "atk hp scale", _ship.atk_hp_scale);
			ds_map_add(_database, "skill hp scale", _ship.skill_hp_scale);
			ds_map_add(_database, "ult hp scale", _ship.ult_hp_scale);
		}
		ds_list_set(_list, _i, _database);
		instance_destroy(_ship);
	}
}

function generate_skill_buttons(_x, _y){
	var _buttons;
	_buttons[0] = instance_create_layer(_x, _y, "Skills", obj_button_basic_attack);
	_buttons[1] = instance_create_layer(_x + 32 * 2, _y, "Skills", obj_button_skill);
	_buttons[2] = instance_create_layer(_x + 64 * 2, _y, "Skills", obj_button_ult);
	return _buttons;
}
