// Variables
ship_index = 0;
name = "";
lvl = 0;
element = 0;
atk = 0;
hp = 0;
spd = 0;
critrate = 0;
critdmg = 0;
cds = [0,0,0];
scales = [0,0,0];
dot_scale = 0;

// Bonuses
bonus_atk = 0;
bonus_hp = 0;
bonus_spd = 0;
bonus_cr = 0;
bonus_crd = 0;
bonus_dot = 0;
bonus_elmt_dmg = 0;

// Functions

set_variables = function(_map){
	lvl = ds_map_find_value(_map, "lvl");
	atk = ds_map_find_value(_map, "atk");
	hp = ds_map_find_value(_map, "hp");
	spd = ds_map_find_value(_map, "spd");
	critrate = ds_map_find_value(_map, "critrate");
	critdmg = ds_map_find_value(_map, "critdmg");
	cds[0] = ds_map_find_value(_map, "cd_atk");
	cds[1] = ds_map_find_value(_map, "cd_skill");
	cds[2] = ds_map_find_value(_map, "cd_ult");
	scales[0] = ds_map_find_value(_map, "scale_atk");
	scales[1] = ds_map_find_value(_map, "scale_skill");
	scales[2] = ds_map_find_value(_map, "scale_ult");
	dot_scale = ds_map_find_value(_map, "scale_dot");
}

set_bonus = function(_map){
	bonus_atk = ds_map_find_value(_map, "atk");
	bonus_hp = ds_map_find_value(_map, "hp");
	bonus_spd = ds_map_find_value(_map, "spd");
	bonus_cr = ds_map_find_value(_map, "cr");
	bonus_crd = ds_map_find_value(_map, "crd");
	bonus_dot = ds_map_find_value(_map, "dot");
	bonus_elmt_dmg = ds_map_find_value(_map, "elmt");
}

setup = function(_id){
	ini_open("characters.ini");
	var _temp = ds_map_create();
	var _data = ini_read_string(_id, "gen", "");
	ds_map_read(_temp, _data);
	set_variables(_temp);
	ds_map_clear(_temp);
	var _data2 = ini_read_string(_id, "bonus", "");
	ds_map_read(_temp, _data2);
	set_bonus(_temp);
	ds_map_destroy(_temp);
	ini_close();
}

save = function(_id){
	ini_open("characters.ini");
	var _temp = ds_map_create();
	ds_map_set(_temp, "lvl", lvl);
	ds_map_set(_temp, "atk", lvl);
	ds_map_set(_temp, "hp", lvl);
	ds_map_set(_temp, "spd", lvl);
	ds_map_set(_temp, "lvl", lvl);
	ds_map_set(_temp, "lvl", lvl);
	ds_map_set(_temp, "lvl", lvl);
	ds_map_set(_temp, "lvl", lvl);
	ds_map_set(_temp, "lvl", lvl);
	ds_map_set(_temp, "lvl", lvl);
	ds_map_set(_temp, "lvl", lvl);
	ds_map_set(_temp, "lvl", lvl);
	ds_map_set(_temp, "lvl", lvl);
	ds_map_destroy(_temp);
	ini_close();
}
