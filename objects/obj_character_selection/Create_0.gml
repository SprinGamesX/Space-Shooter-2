buttons = generate_arrow_buttons(64);
options = ds_map_size(global.ships) - 1;
confirm = generate_confirm_button(64);
index = global.selected_ship;
show_debug_message(string(index) + string(options))