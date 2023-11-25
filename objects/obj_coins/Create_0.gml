save_coins = function(){
	ini_open("data.ini");
	
	ini_write_real("global", "coins", global.coins);
	
	ini_close();
}

load_coins = function(){
	ini_open("data.ini");
	
	global.coins = ini_read_real("global", "coins", 1000);
	
	
	ini_close();
}

load_coins();

prev_coins = global.coins;
image_xscale = 2.5;
image_yscale = 2.5;

x = 1920 - 240;
y = 56;

global.reward = 0;