/// @description CD

if (switch_cd > 0) switch_cd--;

if (switch_cd <= 0){
	if (keyboard_check_pressed(ord("1")) and (active_index != 0) and (instance_exists(global.team[0]))){
		switch_ship(0);
	}
	if (keyboard_check_pressed(ord("2")) and (active_index != 1) and (instance_exists(global.team[1]))){
		switch_ship(1);
	}
	if (keyboard_check_pressed(ord("3")) and (active_index != 2) and (instance_exists(global.team[2]))){
		switch_ship(2);
	}
}

for (var i = 0; i < array_length(global.b_cds); i++){
	if (global.b_cds[i] > 0) global.b_cds[i]--;
	if (global.b_cds[i] < 0) global.b_cds[i] = 0;
	
	if (i == 0){
		if (global.b_cds[0] == 0) global.b_atk = 0;
	}
	else {
		if (global.b_cds[i] == 0) global.b_elem[i-1] = 0;
	}
}


