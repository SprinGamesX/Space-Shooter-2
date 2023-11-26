// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.screen_width = 1920;
global.screen_height = 1080;

function check_latest_run_file(){
	return file_exists("runs.ini");
}

function create_latest_run_file(){
	if (!check_latest_run_file()){
		ini_open("runs.ini");
		var _save = ds_map_create();
		ds_map_add(_save, "domains", global.domains);
		ds_map_add(_save, "difficulty", global.difficulty);
		ds_map_add(_save, "trial", global.trialtype);
		ds_map_add(_save, "floor", global.currentfloor);
		ds_map_add(_save, "pos", global.currentpos);
		ds_map_add(_save, "ship", global.selected_ship);
		ini_write_string("runs", "latest", ds_map_write(_save));
		ini_close();
		ds_map_destroy(_save);
	}
}

function override_latest_run_file(){
		if (file_exists("runs.ini")) file_delete("runs.ini");
		create_latest_run_file();
}

function delete_latest_run_file(){
	if (file_exists("runs.ini")) file_delete("runs.ini");
}

function load_latest_run(){
	if (check_latest_run_file()){
		ini_open("runs.ini");
		var _run = ds_map_create();
		ds_map_read(_run, ini_read_string("runs", "latest", ""));
		global.domains = ds_map_find_value(_run,"domains");
		global.difficulty = ds_map_find_value(_run,"difficulty");
		global.trialtype = ds_map_find_value(_run,"trial");
		global.currentfloor = ds_map_find_value(_run,"floor");
		global.currentpos = ds_map_find_value(_run,"pos");
		global.selected_ship = ds_map_find_value(_run,"ship");
		ini_close();
		ds_map_destroy(_run);
	}
}