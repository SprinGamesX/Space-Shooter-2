/// @description auto-save


if (global.coins != prev_coins){
	save_coins();
}
prev_coins = global.coins;




