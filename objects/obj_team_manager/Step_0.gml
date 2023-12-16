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

if (grace_time > 0) grace_time--;
if (grace_time < 0) grace_time = 0;
