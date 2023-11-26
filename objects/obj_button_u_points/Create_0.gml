event_inherited();
image_xscale = 2;
image_yscale = 2;

on_click = function(){
	if(!instance_exists(obj_popup_upgrade_ship)){
		generate_pop_up(obj_popup_upgrade_points, 900, 200);
	}
}