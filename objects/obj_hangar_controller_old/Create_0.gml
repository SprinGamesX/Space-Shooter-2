enum DESC_DISPLAY{
	BASIC_ATTACK,
	SKILL,
	ULT,
	PASSIVE
}


x = room_width / 4;
y = room_height / 2;
index = 0;
buttons = generate_arrow_buttons(128);
options = ds_list_size(global.ship_datas) - 1;
datalist = ds_list_create();
display_description = DESC_DISPLAY.BASIC_ATTACK;
skill_buttons = generate_skill_buttons(room_width / 2 + 48, 128);
cost = 0;

copy_data(datalist);
text_x = 1920 / 2 + 64;
stat_x = 1920 - 275;

update_level = function(){
	var _s = ds_list_find_value(global.ship_datas, index);
	var _lvl = ds_map_find_value(_s, "level");
	ds_map_set(_s, "level", _lvl + 1);
	save_ship_data(index);
	copy_data(datalist);
}
reduce_level = function(){
	var _s = ds_list_find_value(global.ship_datas, index);
	var _lvl = ds_map_find_value(_s, "level");
	ds_map_set(_s, "level", _lvl - 1);
	save_ship_data(index);
	copy_data(datalist);
}

