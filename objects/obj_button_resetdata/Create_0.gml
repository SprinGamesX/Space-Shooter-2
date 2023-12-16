on_click = function(){
	if (file_exists("characters.ini")){
		file_delete("characters.ini");
	}
	if (file_exists("data.ini")){
		file_delete("data.ini");
	}
	if (file_exists("latest.ini")){
		file_delete("latest.ini");
	}
	if (file_exists("ships")){
		file_delete("ships");
	}
	
	game_end();
}