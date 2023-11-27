// Setup
global.floor_count = 5;
global.domains_per_floor = 5;
include_boss_domain = true;
floor_count = global.floor_count;
domains_per_floor = global.domains_per_floor;

// Drawing
d_border = 72;


if (check_latest_run_file()){
	// Copy the domains into the array
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
	create_latest_run_file();
	// Player
	// Reset player pos and floor
	
	// Save file
}

// Draw domains
for (var i = 0; i < array_length(global.domain_roadmap); i++){
	var d_length = (room_height - d_border*2) / (domains_per_floor - 1);
	for (var j = 0; j < array_length(global.domain_roadmap[i]); j++){
		if (global.domain_roadmap[i,j] != noone){  
			var xx = d_border * (i + 1);
			var yy = d_border + d_length * j;
			create_domain_type(xx, yy, i, j, global.domain_roadmap[i,j]);
		}
	}
}







