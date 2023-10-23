paused = !paused;
var _insts = ds_list_create();
var _num = collision_rectangle_list(0, 0, room_width, room_height, parent_enemy, false, false, _insts, false);
if (paused){
	for (var i = 0; i < _num; i++){
		var _inst = ds_list_find_value(_insts, i);
		_inst.stopped = true;
	}
	
}
if (!paused){
	for (var i = 0; i < _num; i++){
		var _inst = ds_list_find_value(_insts, i);
		_inst.stopped = false;
	}
}
ds_list_destroy(_insts);

