on_click = function(){
	obj_hangar_controller.update_level();
	global.coins -= obj_hangar_controller.cost;
	obj_coins.save_coins();
}