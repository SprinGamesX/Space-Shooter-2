event_inherited();
domain_type = DOMAIN_TYPE.BOSS;

on_click = function(){
	if (accessable) {
		obj_menu_player.move_to_domain(self);
	}
}