// Level properties
num_of_floors = 5;
floor_distance = 64;
domain_per_floor = 3;
border = 70;
max_distance = room_height - (border * 2)
global.lvl = 5;
global.current_domain_type = DOMAIN_TYPE.COMBAT;

domains = ds_list_create();

initialize = function(){
	global.currentfloor = 0;
	global.currentpos = (domain_per_floor + 1) / 2;
	player = instance_create_layer(global.currentfloor * floor_distance + floor_distance, global.currentpos * (max_distance / (domain_per_floor + 1)) + border, "Player", obj_menu_player);
	for(var _i = 2; _i < num_of_floors; _i++){
			var _dis = max_distance / (domain_per_floor + 1);
			for(var _j = 1; _j < domain_per_floor + 1; _j ++){
				var _domain = create_random_domain(floor_distance * _i, _j * _dis + border, _i - 1, _j);
				ds_list_add(domains, _domain);
			}
		}
		var _boss_domain = create_domain(num_of_floors * floor_distance, max_distance / 2 + border, num_of_floors - 1, (domain_per_floor + 1) / 2, obj_domain_boss);
		ds_list_add(domains, _boss_domain);
	set_available(domains);
}

reset = function(){
	for (var _i = 0; _i < ds_list_size(domains); _i++){
		instance_destroy(domains[|_i]);
	}
	ds_list_empty(global.domains);
	ds_list_empty(domains);
	instance_destroy(player);
	initialize();
}


if (global.currentpos == -10)
	global.currentpos = (domain_per_floor + 1) / 2;
randomize();
if (ds_list_size(global.domains) == 0){
	self.initialize();
}
else {
	player = instance_create_layer(global.currentfloor * floor_distance + floor_distance, global.currentpos * (max_distance / (domain_per_floor + 1)) + border, "Player", obj_menu_player);
	var _index = 0;
	for(var _i = 2; _i < num_of_floors; _i++){
		var _dis = max_distance / (domain_per_floor + 1);
		for(var _j = 1; _j < domain_per_floor + 1; _j ++){
			var _domain = create_domain(floor_distance * _i, _j * _dis + border, _i - 1, _j, global.domains[|_index]);
			_index++;
			ds_list_add(domains, _domain);
		}
	}
	var _boss_domain = create_domain(num_of_floors * floor_distance, max_distance / 2 + border, num_of_floors - 1, (domain_per_floor + 1) / 2, obj_domain_boss);
	ds_list_add(domains, _boss_domain);
}
set_available(domains);

advance = function(_pos){
	global.currentfloor += 1;
	global.currentpos = _pos;
	set_available(domains);
}

enum DOMAIN_TYPE{
	COMBAT,
	ELITE,
	TIME,
	DEFENSE,
	BOSS
}
if (global.game_lost) {
	reset();
	global.game_lost = false;	
}

