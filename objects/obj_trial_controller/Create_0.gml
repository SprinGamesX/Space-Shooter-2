global.difficulty = 1;
global.trialtype = 0;
index = 0;
options = 3;
trial_name = "";
subtext = "";
alarm[0] = seconds(1);
echo_sys = part_system_create();
part_system_layer(echo_sys, layer_get_id("Echos"));

x = room_width / 2;
y = 24;

enum TRIAL{

	BLADE = 1, // red blade boss
	ABUNDANCE = 2, // big tree
	BALANCE = 3, // yin & yang
	DECIMATION = 4, // Spears
	SINGULARITY = 5, // black hole
	SERPENT = 6
	
}
trials = [TRIAL.BLADE, TRIAL.DECIMATION, TRIAL.BALANCE];


set_trial = function(){
	global.trialtype = trials[index];
}

generate_diff_buttons = function(){
	var _x = 32;
	var _y = 64;
	var _y_gap = 56;
	var _list;
	for(var i = 1; i <= 4; i++){
		var _inst = instance_create_layer(_x, _y, "Instances", obj_button_difficulty);
		_inst.setup(i);
		_y += _y_gap;
		if (i == 1) _inst.selected = true;
		_list[i-1] = _inst;
	}
	return _list;
	
}

deselect = function(){
	for (var i = 0; i < array_length(diff_buttons); i++){
		diff_buttons[i].selected = false;
	}
}

update_level = function(){
	switch(global.difficulty){
		case 1: global.lvl = 5; break;
		case 2: global.lvl = 20; break;
		case 3: global.lvl = 50; break;
		case 4: global.lvl = 80; break;
	}
}

boss_card = instance_create_layer(x, 64, "Instances", obj_card_boss);
diff_buttons = generate_diff_buttons();
buttons = generate_arrow_buttons(128);
instance_create_layer(room_width / 2, room_height - 64, "Instances", obj_team_selection);
y = 16;
update_level();

// particle
part = part_type_create();
part_type_life(part, seconds(10), seconds(10));
part_type_color1(part, c_red);
part_type_speed(part, 1, 3, 0, 0);
part_type_size(part, 1, 1.2, 0, 0);
part_type_direction(part, 260, 280, 0, 1);
part_type_sprite(part, spr_pixel, 0, 0, 0);
part_type_alpha1(part, 0.5);