// Setup
global.floor_count = 5;
global.domains_per_floor = 3;
include_boss_domain = true;
floor_count = global.floor_count;
domains_per_floor = global.domains_per_floor;

// Drawing
d_border = 72;
var d_length = (room_height - d_border*2) / (domains_per_floor - 1);


if (check_latest_run_file()){
	// if won game override the run before reloading it
	if (global.game_won){
		override_latest_run_file();
		global.game_won = false;
	}
	// Load roadmap
	load_latest_run();
}
else {
	// Create a new array of domains and reset the player values
	// Array
	for (var i = 1; i <= floor_count; i++){
		for (var j = 0; j < domains_per_floor; j++){
			global.domain_roadmap[i, j] = choose(DOMAIN_TYPE.COMBAT, DOMAIN_TYPE.ELITE, DOMAIN_TYPE.TIME);
		}
	}
	if (include_boss_domain){
		for (var i = 0; i <= (domains_per_floor - 1)/2; i++){
			if (i == (domains_per_floor - 1)/2)
				global.domain_roadmap[floor_count + 1, i] = DOMAIN_TYPE.BOSS;
			else global.domain_roadmap[floor_count+1,i] = DOMAIN_TYPE.BLANK;
		}
	}
	
	// Player
	// Reset player pos and floor
	global.currentfloor = 0;
	global.currentpos = (domains_per_floor - 1) / 2;
	
	// Save file
	create_latest_run_file();
}

// Draw domains
for (var i = 0; i < array_length(global.domain_roadmap); i++){
	for (var j = 0; j < array_length(global.domain_roadmap[i]); j++){
		if (global.domain_roadmap[i,j] != noone){  
			var xx = d_border * (i + 1);
			var yy = d_border + d_length * j;
			create_domain_type(xx, yy, i, j, global.domain_roadmap[i,j]);
		}
	}
}

// Summon player
instance_create_layer((global.currentfloor + 1) * d_border, d_border + d_length * global.currentpos, "Player", obj_menu_player);

// Change domain avialability
set_available();







