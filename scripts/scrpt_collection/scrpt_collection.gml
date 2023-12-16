// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.obtained_ships = [1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0];

function save_collection(){
	ini_open("ships");
	for(var i = 0; i < array_length(global.obtained_ships); i++){
		ini_write_real("collection", i, global.obtained_ships[i]);
	}
	ini_close();
}

function load_collection(){
	ini_open("ships");
	for(var i = 0; i < array_length(global.obtained_ships); i++){
		global.obtained_ships[i] = ini_read_real("collection", i, global.obtained_ships[i]);
	}
	ini_close();
}

function obtain_ship(_index){
	global.obtained_ships[_index] = 1;
	save_collection();
}