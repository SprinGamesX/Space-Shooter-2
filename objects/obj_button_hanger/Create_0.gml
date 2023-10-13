on_click = function(){
	load_ship_data();
	save_all_ships_datas();
	transition_start(rm_menu_hangar, seq_fade_out, seq_fade_in);
}