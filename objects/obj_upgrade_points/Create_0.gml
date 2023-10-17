global.upgrade_points = 0;
prev_coins = global.upgrade_points;

save_coins = function(){
	ini_open("data.ini");
	
	ini_write_real("global", "upoints", global.upgrade_points);
	
	ini_close();
}

load_coins = function(){
	ini_open("data.ini");
	
	global.upgrade_points = ini_read_real("global", "upoints", 0);
	
	
	ini_close();
}

load_coins();

image_xscale = 2.5;
image_yscale = 2.5;

x = 1920 - 112;
y = 112;
