buttons = generate_arrow_buttons(48);
options = ds_map_size(global.ships) - 1;
confirm = generate_confirm_button(32);
index = global.selected_ship;
show_debug_message(string(index) + string(options))