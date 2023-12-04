// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.screen_width = 1920;
global.screen_height = 1080;

global.domain_roadmap = [];

function check_latest_run_file(){
	return file_exists("latest.ini");
}

function create_latest_run_file(){
	if (!check_latest_run_file()){
		ini_open("latest.ini");
		// Player data
		ini_write_real("player", "ship", global.selected_ship);
		ini_write_real("player", "floor", global.currentfloor);
		ini_write_real("player", "pos", global.currentpos);
		
		// Domain data
		ini_write_real("domain", "floors", global.floor_count + 1);
		ini_write_real("domain", "count", global.domains_per_floor);
		ini_write_real("domain", "trial", global.trialtype);
		ini_write_real("domain", "lvl", global.lvl);
		for (var i = 0; i < array_length(global.domain_roadmap); i++){
			for (var j = 0; j < array_length(global.domain_roadmap[i]); j++){
				ini_write_real("domain", string(i) + "-" + string(j), global.domain_roadmap[i,j]);
			}
		}
		
		ini_close();
	}
}

function override_latest_run_file(){
		if (file_exists("latest.ini")) file_delete("latest.ini");
		create_latest_run_file();
}

function delete_latest_run_file(){
	if (file_exists("latest.ini")) file_delete("latest.ini");
}

function load_latest_run(){
	if (check_latest_run_file()){
		ini_open("latest.ini");
		global.currentfloor = ini_read_real("player", "floor", 0);
		global.selected_ship = ini_read_real("player", "ship", 0);
		global.currentpos = ini_read_real("player", "pos", 0);
		global.trialtype = ini_read_real("domain", "trial", 1);
		global.lvl = ini_read_real("domain", "lvl", 1);
		var _f = ini_read_real("domain", "floors", 0);
		var _c = ini_read_real("domain", "count", 0);
		for (var i = 1; i <= _f; i++){
			for (var j = 0; j < _c; j++){
				global.domain_roadmap[i,j] = ini_read_real("domain", string(i) + "-" + string(j), -1);
			}
		}
		ini_close();
	}
}