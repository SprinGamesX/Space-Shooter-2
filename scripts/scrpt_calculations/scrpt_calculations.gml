// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information



function chance(_var){
	randomize();
	return random(1) < _var;

}

function seconds(_seconds){
	return _seconds * game_get_speed(gamespeed_fps);
}

function time_to_seconds(_time){
	return _time / game_get_speed(gamespeed_fps);
}

function kill_outside_bounds(_custom_bound = -30){
	if (x < 0 + _custom_bound) or (x > room_width - _custom_bound) or (y > room_height - _custom_bound) or (y < 0 + _custom_bound){
		instance_destroy(self);
	}
}

function draw_set(_fnt, _halign = fa_center, _valign = fa_middle, _color = c_white, _alpha = 1){
	draw_set_font(_fnt);
	draw_set_color(_color);
	draw_set_valign(_valign);
	draw_set_halign(_halign);
	draw_set_alpha(_alpha)
}

function round_to_1_decimal(_num){
	var _n = _num * 10;
	_n = round(_n);
	_n = _n / 10;
	return _n;
}

function color_for_element(_element){
	var _color = c_white;
	if (_element = ELEMENTS.ICE) _color = c_aqua;
	if (_element = ELEMENTS.FIRE) _color = c_orange;
	if (_element = ELEMENTS.LIFE) _color = c_lime;
	if (_element = ELEMENTS.VENOM) _color = c_purple;
	if (_element = ELEMENTS.LIGHTNING) _color = c_yellow;
	return _color;
}

function num_in_range(_num, _min, _max){
	return _max >= _num and _num >= _min; 
}

function bounce_on_edge(_dir, _bounces){
	
	
	var _bounced = false;
	var _b = _bounces;
	if (place_meeting(x, y, obj_movement_barrier_horizontal)){
		direction = 360 - _dir;
		_bounced = true;
		_dir = direction;
	}
	if (place_meeting(x, y, obj_movement_barrier_vertical)){
		direction = 180 - _dir;
		_bounced = true;
	}
	if (_bounced) _b--;
	
	return _b;
}
