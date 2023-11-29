event_inherited();

on_click = function(){
	
	if (accessable) {
		obj_menu_player.move_to_domain(self);
	}

}

access = function(){
	accessable = true;
}

lock = function(){
	accessable = false;
}

on_select = function(){
	if (selected){
		y = og_y - 1;
	}
	else y = og_y;
}