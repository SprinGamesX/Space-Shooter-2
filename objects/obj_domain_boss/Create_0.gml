event_inherited();
domain_type = DOMAIN_TYPE.BOSS;

click = function(){
	show_debug_message("Clicked on Domain: Boss" + string(floore) + "," + string(pos));
	if (accessable) {
		obj_menu_player.move_to_domain(self);
	}
}