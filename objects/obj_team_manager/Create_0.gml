global.team = [noone, noone, noone];
active_index = 0;

global.team[0] = instance_create_layer(48, 176, "Player", ds_map_find_value(global.ships, global.selected_ship));
global.team[1] = instance_create_layer(x, y, "Player", ds_map_find_value(global.ships, 0));
global.team[2] = instance_create_layer(x, y, "Player", ds_map_find_value(global.ships, 1));

// Switch 
switch_cd = seconds(2);
switch_cd_max = switch_cd;

global.team[0].active = true;

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