/// @description auto-save


if (global.coins != prev_coins){
	save_coins();
}
prev_coins = global.coins;

if (!global.mid_transition){
	if (global.reward > 1000){
		global.reward -= 1000;
		global.coins += 1000;
	}
	else if (global.reward > 100){
		global.reward -= 100;
		global.coins += 100;
	}
	else if (global.reward > 10){
		global.reward -= 10;
		global.coins += 10;
	}
	else if (global.reward > 0){
		global.reward--;
		global.coins++;
	}
}



