global.difficulty = 1;
global.trialtype = 0;
index = 0;
options = 3;
trial_name = "";
subtext = "";

x = room_width / 2;
y = 24;

enum TRIAL{

	BLADE, // red blade boss
	ABUNDANCE, // red diamond
	BALANCE // yin & yang

}
trials = [TRIAL.BLADE, TRIAL.ABUNDANCE, TRIAL.BALANCE];


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
instance_create_layer(room_width / 2, room_height - 64, "Instances", obj_character_selection);
y = 16;
update_level();