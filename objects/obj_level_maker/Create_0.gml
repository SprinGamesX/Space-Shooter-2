// Constants
enum DOMAIN_TYPE{
	COMBAT = 0,
	ELITE = 1,
	TIME = 2,
	DEFENSE = 3,
	BOSS = 4,
	TEST = 5
}

#region Level generation
// Level properties
num_of_floors = 5;
floor_distance = 64;
domain_per_floor = 3;
border = 70;
max_distance = room_height - (border * 2)
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
	create_latest_run_file();
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
if (!check_latest_run_file()){
	self.initialize();
}
else {
	override_latest_run_file();
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
	override_latest_run_file();
	global.currentfloor += 1;
	global.currentpos = _pos;
	set_available(domains);	
}


if (global.pending_reset) {
	reset();
	global.pending_reset = false;	
}

#endregion


// particles
part_sys = part_system_create();
if (!layer_exists("Particles")) layer_create(layer_get_depth(layer_get_id("Background")) - 1, "Particles");
part_system_layer(part_sys, layer_get_id("Particles"));
part = part_type_create();
part_type_sprite(part, spr_pixel, 0, 0, 0);
part_type_color2(part, c_black, c_maroon);
part_type_life(part, seconds(4), seconds(4));
part_type_speed(part, 2, 2.25, 0, 0);
part_type_alpha3(part,1, 0.9, 0);
part_type_size(part, 1.5, 2, 0, 0);