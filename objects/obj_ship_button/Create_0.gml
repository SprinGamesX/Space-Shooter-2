ship_index = 0;
image_xscale = 0.75;
image_yscale = 0.75;
spr_width = 64 * 0.75;
spr_height = 64 * 0.75;
inactive = false;


activate = function(){
	for (var i = 0; i < 3 and !inactive; i++){
		if (global.selected_team[i] == ship_index) or (!global.obtained_ships[ship_index]){
			inactive = true;
		}
		else inactive = false;
	}
}