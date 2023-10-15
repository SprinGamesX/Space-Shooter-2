
x = room_width / 4;
y = room_height / 2;
index = 0;
buttons = generate_arrow_buttons(128);
options = 7;
skill_buttons = generate_skill_buttons(room_width / 2 + 48, 128);
cost = 0;
display_description = DESC_DISPLAY.BASIC_ATTACK;
show_stats = true;
alpha = 0;
enter = true;

text_x = 1920 / 2 + 64;
stat_x = 1920 - 275;

update_level = function(){
	// upgrade
}
reduce_level = function(){
	// downgrade
}

