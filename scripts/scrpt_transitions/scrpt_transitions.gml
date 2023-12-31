global.mid_transition = false;
global.room_target = -1;
global.alpha = 1;

function transition_place_sequence(_type)
{
	if (layer_exists("transition")) layer_destroy("transition");
	var _lay = layer_create(-9999, "transition");
	layer_sequence_create(_lay, 0, 0, _type);
}

function transition_start(_room_target, _typeout, _typein){
	if (!global.mid_transition){
		global.mid_transition = true;
		global.room_target = _room_target;
		transition_place_sequence(_typeout);
		layer_set_target_room(_room_target);
		transition_place_sequence(_typein);
		layer_reset_target_room();
		return true;
	}
	else return false;
}

function transition_change_room(){
	part_system_clear(global.menu_part_system);
	room_goto(global.room_target);
}

function transition_finish(){
	layer_sequence_destroy(self.elementID);
	global.mid_transition = false;
}

function adjust_gui_alpha(){
	if (global.mid_transition){
		if (global.room_target != room){
			if (global.alpha > 0) global.alpha -= 1 / gamespeed_fps;
		}
		else if (global.alpha < 1) global.alpha += 1 / gamespeed_fps;
	}
}