save_coins = function(){
	ini_open("data.ini");
	
	ini_write_real("global", "coins", global.coins);
	
	ini_close();
}

load_coins = function(){
	ini_open("data.ini");
	
	global.coins = ini_read_real("global", "coins", 75823);
	
	
	ini_close();
}

load_coins();

image_xscale = 3;
image_yscale = 3;

x = 1920 - 240;
y = 56;