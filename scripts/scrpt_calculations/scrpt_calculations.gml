// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function calculate_dmg(_atk, _critrate, _critdmg, _dmgscale, _maxhp = 0, _hp_scale = 0){
	var _crit = chance(_critrate);
	var _dmg = (_atk * _dmgscale)
	if (_hp_scale != 0) _dmg += (_maxhp * _hp_scale)
	if (_crit){
		return _dmg + _dmg * _critdmg;
	}
	return _dmg;
}

function chance(_var){
	randomize();
	return random(1) < _var;

}

function seconds(_time){
	return _time * game_get_speed(gamespeed_fps);
}

function seconds_to_time(_seconds){
	return _seconds / game_get_speed(gamespeed_fps);
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
