if (!file_exists("characters.ini")){
	ini_open("characters.ini");
	// Perfrom initialization
	ini_close();
}
else{
	ini_open("characters.ini");
	// Read all stats from file
	ini_close();
}



