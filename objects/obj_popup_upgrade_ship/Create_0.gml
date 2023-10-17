event_inherited();
if(!layer_exists("UI")) layer_create(-500, "UI");
self.layer = layer_get_id("UI");

update_price = function(){
	price = ((obj_ship.lvl + 1) * (100 * (floor(obj_ship.lvl / 10) + 1)));
	text = "Would you like to upgrade your ship to \nlevel [rainbow]" + string(obj_ship.lvl + 1) + "[/rainbow] for [c_yellow]" + string(price) + " GOLD[c_white]? \n [c_green]Y[c_white]/[c_red]N";
	if (obj_ship.lvl == 100){
		text = "This ship has already reached [rainbow]max level[/rainbow] \n Press ESC to exit";
	}
}
update_price();