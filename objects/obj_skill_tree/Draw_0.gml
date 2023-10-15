var _color = c_white;
var _color2 = c_white;
var _texts = ["ATK", "HP", "SPD","CR","CRD","EX","EM","ASPD","CD","EHR"];
var _n = 0;

switch(obj_ship.element){
	case ELEMENTS.ICE:
		_color = c_teal;
		_color2 = c_aqua;
		break;
	case ELEMENTS.FIRE:
		_color = make_color_rgb(52, 29, 31);
		_color2 = make_color_rgb(255, 132, 46);
		break;
	case ELEMENTS.LIFE:
		_color = make_color_rgb(105, 71, 33);
		_color2 = c_lime;
		break;
	case ELEMENTS.VENOM:
		_color = c_purple;
		_color2 = c_fuchsia;
		break;
}

for(var _i = 0; _i < 360; _i += (360 / 10)){

	draw_sprite_ext(spr_st_line, 0, x, y, base_line_len, 0.5, _i, _color, 1);
	var _x = scribble(_texts[_n]);
	_x.starting_format("fnt_ship_desc2", c_white);
	_x.align(fa_center, fa_bottom);
	_x.transform(0.3, 0.3, _i - 90);
	_x.draw(x + lengthdir_x(72, _i),y + lengthdir_y(72, _i));
	_n++;
}
var _list = obj_ship.get_bonus_list();
var _dir = 0;
for(var _i = 0; _i < 10; _i ++){
	var _p1 = _i;
	var _p2 = _i+1;
	if (_p2 == 10) _p2 = 0;
	var _x1 = x + lengthdir_x(line_range_min + (_list[_p1] * 2), _dir);
	var _x2 = x + lengthdir_x(line_range_min + (_list[_p2] * 2), _dir + 36);
	var _y1 = y + lengthdir_y(line_range_min + (_list[_p1] * 2), _dir);
	var _y2 = y + lengthdir_y(line_range_min + (_list[_p2] * 2), _dir + 36);
	draw_sprite_ext(spr_st_line, 0, _x1, _y1, point_distance(_x1, _y1, _x2, _y2) / 16, 0.2, point_direction(_x1, _y1, _x2, _y2), _color2, 1);
	draw_sprite_ext(spr_st_base, 0, _x1, _y1, 0.3, 0.3, _dir, _color2, 1);
	_dir += 36; 
}

image_blend = _color2;
draw_self();