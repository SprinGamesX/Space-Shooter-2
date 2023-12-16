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
options = ds_map_size(global.ships);
skill_buttons = generate_skill_buttons(room_width / 2 + 48, 128);
cost = 0;
display_description = DESC_DISPLAY.BASIC_ATTACK;
show_stats = true;
alpha = 0;
enter = true;
color = c_white;
obj_ship.update_index(index);
last_index = index;

text_x = 1920 / 2 + 64;
stat_x = 1920 - 275;

update_level = function(){
	// upgrade
}
reduce_level = function(){
	// downgrade
}

part_sys = part_system_create();
part_system_layer(part_sys, layer_get_id("Bg"));

part = part_type_create();
part_type_sprite(part, spr_pixel, 0, 0, 0);
part_type_alpha2(part, 1, 0);
part_type_life(part, seconds(1.5), seconds(2));
part_type_speed(part, 3, 4, -0.01, 0);

load_collection();