event_inherited();

update_price = function(){
	price = 0;
	switch(obj_ship.rarity){
		case RARITY.R: price = 10000; break;
		case RARITY.SR: price = 25000; break;
		case RARITY.SSR: price = 100000; break;
	}
	text = "Would you like to unlock [c_orange]" + string(obj_ship.ship_name) + "[c_white] for [c_yellow]" + string(price) + " GOLD[c_white]? \n [c_green]Y[c_white]/[c_red]N";
}
update_price();