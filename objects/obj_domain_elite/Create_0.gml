event_inherited();
domain_type = DOMAIN_TYPE.ELITE;

click = function(){
	
	show_debug_message("Clicked on Domain: Elite, " + string(floore) + "," + string(pos));
	if (accessable) {
		obj_menu_player.move_to_domain(self);
	}

}