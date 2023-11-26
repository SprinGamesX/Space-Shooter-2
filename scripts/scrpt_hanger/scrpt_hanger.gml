function print_ds_map(_map){
	var _next = ds_map_find_first( _map );
	var _count = 0;
	while ( !is_undefined( _next ) ) {
	  var _string = string( _next ) + " :" + string( _map[? _next ] );
	  
 
	  _next = ds_map_find_next( _map, _next );
	  _count++;
	}
}

function generate_skill_buttons(_x, _y){
	var _buttons;
	_buttons[0] = instance_create_layer(_x, _y, "Skills", obj_button_basic_attack);
	_buttons[1] = instance_create_layer(_x + 24 * 2, _y, "Skills", obj_button_skill);
	_buttons[2] = instance_create_layer(_x + 48 * 2, _y, "Skills", obj_button_ult);
	_buttons[3] = instance_create_layer(_x + 72 * 2, _y, "Skills", obj_button_passive);
	return _buttons;
}

function generate_plus_buttons(_x,_y,_amount, _len){
	var _buttons;
	var _index = 0;
	for(var _i = 0; _i < 360; _i += (360 / _amount)){
		var _b = instance_create_layer(_x + lengthdir_x(_len, _i), _y + lengthdir_y(_len, _i), "Skills", obj_button_plus)
			_b.index = _index;
			_b.parent = self;
			_b.direction = _i;
			_b.image_angle = _i;
		_buttons[_i] = _b;
		_index++;
	}
	return _buttons;
}

function generate_pop_up(_obj, _lenx = 900, _leny = 200){
	with(instance_create_depth(1920 / 2, 1080 / 2, 0, _obj)){
		lenx = _lenx;
		leny = _leny;
	}
}

function generate_slider(_x_offset, _y_offset, _max, _draw_on_gui = false,_obj = self){
	var xx = _obj.x - 32;
	if (_draw_on_gui) xx -= 32 * 2;
	with(instance_create_depth(xx + _x_offset, _obj.y + _y_offset, _obj.depth - 1, obj_slider)){
		parent = _obj;
		max_amount = min(_max, 49);
		draw_on_gui = _draw_on_gui;
	}
}

function control_arrow_buttons(_buttons, _index, _options){
	if (_index == 0){
		_buttons[1].active = false;
	}
	else _buttons[1].active = true;

	if (_index == _options - 1){
		_buttons[0].active = false;
	}
	else _buttons[0].active = true;
}
