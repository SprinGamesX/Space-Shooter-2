adjust_gui_alpha();

// base stats
ship_index = 0;
ship_name = "";
lvl = 0;
element = 0;
atk = 0;
hp = 0;
spd = 0;
critrate = 0;
critdmg = 0;
cds = [0,0,0];
scales = [0,0,0];
ex_scale = 0;
dot_scale = 0;

// Bonuses
bonus_atk = 0;
bonus_hp = 0;
bonus_spd = 0;
bonus_cr = 0;
bonus_crd = 0;
bonus_ex = 0;
bonus_elmt_dmg = 0;
bonus_aspd = 0;
bonus_cd = 0;
bonus_ehr = 0;

// final
f_atk = 0;
f_hp = 0;
f_spd = 0;
f_cr = 0;
f_crd = 0;

// Additional
lvl_atk = 1;
lvl_skill = 1;
lvl_ult = 1;
passives = [false, false, false];

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
	ex_scale = ds_map_find_value(_map, "scale_ex");
}

set_bonus = function(_map){
	bonus_atk = ds_map_find_value(_map, "atk");
	bonus_hp = ds_map_find_value(_map, "hp");
	bonus_spd = ds_map_find_value(_map, "spd");
	bonus_cr = ds_map_find_value(_map, "cr");
	bonus_crd = ds_map_find_value(_map, "crd");
	bonus_ex = ds_map_find_value(_map, "ex");
	bonus_elmt_dmg = ds_map_find_value(_map, "elmt");
	bonus_aspd = ds_map_find_value(_map, "aspd");
	bonus_cd = ds_map_find_value(_map, "cds");
	bonus_ehr = ds_map_find_value(_map, "ehr");
}

set_adds = function(_map){
	ship_name = ds_map_find_value(_map, "name");
	element = ds_map_find_value(_map, "element");
	lvl_atk = ds_map_find_value(_map, "lvl_atk");
	lvl_skill = ds_map_find_value(_map, "lvl_skill");
	lvl_ult = ds_map_find_value(_map, "lvl_ult");
	passives[0] = ds_map_find_value(_map, "p1");
	passives[1] = ds_map_find_value(_map, "p2");
	passives[2] = ds_map_find_value(_map, "p3");
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
	ds_map_clear(_temp);
	var _data3 = ini_read_string(_id, "adds", "");
	ds_map_read(_temp, _data3);
	set_adds(_temp);
	ds_map_destroy(_temp);
	ini_close();
}
	
	

save_base = function(_id){
	ini_open("characters.ini");
	var _temp = ds_map_create();
	ds_map_set(_temp, "lvl", lvl);
	ds_map_set(_temp, "atk", atk);
	ds_map_set(_temp, "hp", hp);
	ds_map_set(_temp, "spd", spd);
	ds_map_set(_temp, "critrate", critrate);
	ds_map_set(_temp, "critdmg", critdmg);
	ds_map_set(_temp, "cd_atk", cds[0]);
	ds_map_set(_temp, "cd_skill", cds[1]);
	ds_map_set(_temp, "cd_ult", cds[2]);
	ds_map_set(_temp, "scale_atk", scales[0]);
	ds_map_set(_temp, "scale_skill", scales[1]);
	ds_map_set(_temp, "scale_ult", scales[2]);
	ds_map_set(_temp, "scale_ex", ex_scale);
	ini_write_string(_id, "gen", ds_map_write(_temp));
	ds_map_destroy(_temp);
	ini_close();
}

save_bonus = function(_id){
	ini_open("characters.ini");
	var _temp = ds_map_create();
	ds_map_set(_temp, "atk", bonus_atk);
	ds_map_set(_temp, "hp", bonus_hp);
	ds_map_set(_temp, "spd", bonus_spd);
	ds_map_set(_temp, "cr", bonus_cr);
	ds_map_set(_temp, "crd", bonus_crd);
	ds_map_set(_temp, "ex", bonus_ex);
	ds_map_set(_temp, "elmt", bonus_elmt_dmg);
	ds_map_set(_temp, "aspd", bonus_aspd);
	ds_map_set(_temp, "cds", bonus_cd);
	ds_map_set(_temp, "ehr", bonus_ehr);
	ini_write_string(_id, "bonus", ds_map_write(_temp));
	ds_map_destroy(_temp);
	ini_close();
}

save_adds = function(_id){
	ini_open("characters.ini");
	var _temp = ds_map_create();
	ds_map_set(_temp, "name", ship_name);
	ds_map_set(_temp, "element", element);
	ds_map_set(_temp, "lvl_atk", lvl_atk);
	ds_map_set(_temp, "lvl_skill", lvl_skill);
	ds_map_set(_temp, "lvl_ult", lvl_ult);
	ds_map_set(_temp, "p1", passives[0]);
	ds_map_set(_temp, "p2", passives[1]);
	ds_map_set(_temp, "p3", passives[2]);
	ini_write_string(_id, "adds", ds_map_write(_temp));
	ds_map_destroy(_temp);
	ini_close();
}
	
save = function(_id){
	save_base(_id);
	save_bonus(_id);
	save_adds(_id);
}
	
update_index = function(_index){
	ship_index = _index;
	setup(_index);
	save();
	base();
}
	
update_bonus = function(_id){
	switch(_id){
		case 0: bonus_atk++;      break;
		case 1: bonus_hp++;       break;
		case 2: bonus_spd++;      break;
		case 3: bonus_cr++;       break;
		case 4: bonus_crd++;      break;
		case 5: bonus_ex++;       break;
		case 6: bonus_elmt_dmg++; break;
		case 7: bonus_aspd++;     break;
		case 8: bonus_cd++;       break;
		case 9: bonus_ehr++;      break;
	}
	save_bonus(ship_index);
}



get_bonus_list = function(){
	return [bonus_atk,bonus_hp,bonus_spd,bonus_cr,bonus_crd,bonus_ex,bonus_elmt_dmg,bonus_aspd,bonus_cd,bonus_ehr];
}

is_bonus_updateable = function(_index){
	var _list = get_bonus_list();
	return _list[_index] < 25;
}

update_level = function(){
	if (lvl < 100){
		lvl++;
		save_base(ship_index);
	}
}
	
base = function(){
	f_atk = (atk + ((atk / 10) * (lvl-1))); // lvls
	f_atk += f_atk + ((f_atk / 20) * bonus_atk);
	f_hp = hp + ((hp / 10) * (lvl-1)); // lvls
	f_hp += f_hp + ((f_hp / 20) * bonus_hp);
	f_spd = spd + (0.05 * bonus_spd);
	f_cr = critrate + (critrate * 0.36 * bonus_cr);
	f_crd = critdmg + (critdmg * 0.16 * bonus_crd);
	
}
	
// set base stats
var _num = 13;
if (!file_exists("characters.ini")){
	
	for(var _i = 0; _i < _num; _i++){
		ship_index = _i;
		ini_ship_stats(_i);
		base_stats_on_element(element);
		save_base(ship_index);
		save_bonus(ship_index);
		save_adds(ship_index);
	}
}
else { 
	
	setup(ship_index);
	ini_ship_stats(ship_index);
	save_base(ship_index);
	setup(ship_index);
	
}
