on_click = function(){
	if (file_exists("characters.ini")){
		file_delete("characters.ini");
	}
	game_end();
}