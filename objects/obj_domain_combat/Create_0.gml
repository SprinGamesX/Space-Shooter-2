event_inherited();
domain_type = DOMAIN_TYPE.COMBAT;
on_click = function(){
	
	//show_debug_message("Clicked on Domain: Combat, " + string(floore) + "," + string(pos));
	if (accessable) {
		obj_menu_player.move_to_domain(self);
	}

}