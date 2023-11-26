event_inherited();
if(!layer_exists("UI")) layer_create(-500, "UI");
self.layer = layer_get_id("UI");
slider = 0;
cost = 5000;
text = "Would you like to buy " + string(slider) + " [rainbow] upgrade point [/rainbow] with [c_yellow] " + string(cost) + " GOLD[c_white]? \n [c_green]Y[c_white]/[c_red]N";
generate_slider(0, 50, floor(global.coins / cost), true);

update = function(){
	cost = 5000 * slider;
	text = "Would you like to buy " + string(slider) + " [rainbow] upgrade point [/rainbow] with [c_yellow] " + string(cost) + " GOLD[c_white]? \n [c_green]Y[c_white]/[c_red]N";
}