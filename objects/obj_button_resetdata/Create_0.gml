on_click = function(){
	if (file_exists("characters.ini")){
		file_delete("characters.ini");
	}
	if (file_exists("data.ini")){
		file_delete("data.ini");
	}
	game_end();
}