if (!global.mid_transition){
var _ship_stats = ds_list_find_value(datalist, index);
var _ship = ds_list_find_value(global.ship_datas, index)
var _current_skill_scale = 0;
var _current_skill_hp_scale = 0;
var _current_skill_cd = 0;
var _selected_skill = "";
var _stats = stringify_stats(_ship_stats);
var _lvl = ds_map_find_value(_ship, "level");
var _color = c_white;
var _element = ds_map_find_value(_ship_stats, "element");
var _icon;
cost = _lvl * 100;
switch (display_description){
	case DESC_DISPLAY.BASIC_ATTACK:
		_current_skill_scale = ds_map_find_value(_ship_stats, "atk scale");
		_current_skill_cd = ds_map_find_value(_ship_stats, "atk cd");
		_current_skill_hp_scale = ds_map_find_value(_ship_stats, "atk hp scale");
		_selected_skill = "Basic attack"
		break;
	case DESC_DISPLAY.SKILL:
		_current_skill_scale = ds_map_find_value(_ship_stats, "skill scale");
		_current_skill_cd = ds_map_find_value(_ship_stats, "skill cd") * 2;
		_current_skill_hp_scale = ds_map_find_value(_ship_stats, "skill hp scale");
		_selected_skill = "Skill"
		break;
	case DESC_DISPLAY.ULT:
		_current_skill_scale = ds_map_find_value(_ship_stats, "ult scale");
		_current_skill_cd = (ds_map_find_value(_ship_stats, "ult cd")) * 2;
		_current_skill_hp_scale = ds_map_find_value(_ship_stats, "ult hp scale");
		_selected_skill = "Ultimate"
		break;
}
switch(_element){
	case ELEMENTS.ICE:
		_color = c_teal;
		_icon = spr_icon_ice;
		break;
	case ELEMENTS.FIRE:
		_color = c_maroon;
		_icon = spr_icon_fire;
		break;
	case ELEMENTS.LIFE:
		_color = c_green;
		_icon = spr_icon_life;
		break;
	case ELEMENTS.VENOM:
		_color = c_purple;
		_icon = spr_icon_venom;
		break;
}

var _skill_desc = "";
if (_current_skill_hp_scale != undefined)
	_skill_desc = string_desc_for_id(index, display_description, _current_skill_scale, _current_skill_cd ,_current_skill_hp_scale);
else _skill_desc = string_desc_for_id(index, display_description, _current_skill_scale, _current_skill_cd);

draw_set(fnt_ship_desc, fa_left, fa_top);
draw_sprite_ext(_icon, 0, text_x + 50, 80, 10, 10, 0, c_white, 1);
draw_set(fnt_ship_desc2, fa_left, fa_top);
draw_text_scribble(text_x + 60, 50, "[rainbow]Level: " + string(_lvl) + "/100");
draw_set(fnt_ship_desc, fa_left, fa_top);
draw_bg_box(10, 10, 500, 70, _color);
draw_text_scribble(20, 20, ds_map_find_value(_ship, "name"));

draw_text_scribble(text_x, 450, _selected_skill);

draw_set(fnt_ship_desc2, fa_left, fa_top);
draw_bg_box(text_x - 10, 500, 620, 300, _color);
draw_text_scribble_ext(text_x, 520, _skill_desc, 600);

draw_bg_box(text_x - 10, 115, 620, 190, c_grey);
draw_text_scribble(text_x, 120, _stats);
}
