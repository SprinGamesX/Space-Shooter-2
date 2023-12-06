global.team = [noone, noone, noone];
active_index = 0;

// Team Setup
global.team[0] = instance_create_layer(48, 176, "Player", ds_map_find_value(global.ships, global.selected_ship));
global.team[1] = instance_create_layer(x, y, "Player", ds_map_find_value(global.ships, 10));
global.team[2] = instance_create_layer(x, y, "Player", ds_map_find_value(global.ships, 7));

// Switch
switch_cd = seconds(1);
switch_cd_max = switch_cd;
global.team[0].active = true;

#region Team Buffs

enum BUFF{
	ATK = 0,
	ICE_DMG = 1,
	FIRE_DMG = 2,
	LIFE_DMG = 3,
	VENOM_DMG = 4,
	LIGHTNING_DMG = 5,
	TOTAL_DMG = 6,
	
}

buff_amount = 7;

for (var i = 0; i < buff_amount; i++)
	global.buffs[i] = ds_list_create();

global.b_atk = 0;
global.b_elem = [0,0,0,0,0];
global.b_totaldmg = 0;

update_buffs = function(){
	// ATK
	global.b_atk = 0;
	for (var i = 0; i < ds_list_size(global.buffs[BUFF.ATK]); i++){
		var _b = ds_list_find_value(global.buffs[BUFF.ATK], i)
		global.b_atk += _b.magnitude;
	}
	// ELEMENTAL BUFFS
	global.b_elem = [0,0,0,0,0];
	for (var j = 0; j < array_length(global.b_elem); j++){
		for (var i = 0; i < ds_list_size(global.buffs[j]); i++){
			var _b = ds_list_find_value(global.buffs[j], i)
			global.b_elem[j] += _b.magnitude;
		}
	}
	// TOTAL DMG
	global.b_totaldmg = 0;
	for (var i = 0; i < ds_list_size(global.buffs[BUFF.TOTAL_DMG]); i++){
		var _b = ds_list_find_value(global.buffs[BUFF.TOTAL_DMG], i)
		global.b_totaldmg += _b.magnitude;
	}
}

add_buff = function(_me){
	if ( _me != noone and instance_exists(_me)){
		ds_list_add(global.buffs[_me.type], _me);
	}
	update_buffs();
}

remove_buff = function(_me){
	if ( _me != noone and instance_exists(_me)){
		var _index = ds_list_find_index(global.buffs[_me.type], _me);
		ds_list_delete(global.buffs[_me.type], _index);
	}
	update_buffs();
}

#endregion


function switch_ship(_num){
	
	// Copy position
	global.team[_num].x = global.team[active_index].x;
	global.team[_num].y = global.team[active_index].y;
	
	// Reset inactive ship
	global.team[active_index].x = x;
	global.team[active_index].y = y;
	
	// Switch active
	global.team[active_index].active = false;
	active_index = _num;
	global.team[_num].active = true;
	
	switch_cd = switch_cd_max;
}

on_ship_death = function(_x, _y){
	var alive = false;
	for (var i = 0; i < 3; i++){
		if (instance_exists(global.team[i]) and (!alive)){
			global.team[i].x = _x;
			global.team[i].y = _y;
			active_index = i;
			global.team[active_index].active = true;
			alive = true;
		}
	}
	if (!alive) instance_destroy();
}

get_active_ship = function(){
	return global.team[active_index];
}