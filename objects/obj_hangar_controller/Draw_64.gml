var _current_skill_scale = 0;
var _current_skill_hp_scale = 0;
var _current_skill_cd = 0;
var _selected_skill = "";
var _stats = stringify_stats();

var _lvl = obj_ship.lvl;
var _rarity = obj_ship.rarity;
var _color = c_white;
var _element = obj_ship.element;
var _icon;
cost = _lvl * 100;
switch (display_description){
	case DESC_DISPLAY.BASIC_ATTACK:
		_current_skill_scale = obj_ship.scales[0];
		_current_skill_cd = obj_ship.cds[0];
		_selected_skill = "Basic attack"
		break;
	case DESC_DISPLAY.SKILL:
		_current_skill_scale = obj_ship.scales[1];
		_current_skill_cd = obj_ship.cds[1];
		_selected_skill = "Skill"
		break;
	case DESC_DISPLAY.ULT:
		_current_skill_scale = obj_ship.scales[2];
		_current_skill_cd = obj_ship.cds[2];
		_selected_skill = "Ultimate"
		break;
	case DESC_DISPLAY.PASSIVE:
		_current_skill_scale = obj_ship.scales[0];
		_current_skill_cd = obj_ship.cds[0];
		_selected_skill = "Passive"
		break;
}
switch(_element){
	case ELEMENTS.ICE:
		_icon = spr_icon_ice;
		break;
	case ELEMENTS.FIRE:
		_icon = spr_icon_fire;
		break;
	case ELEMENTS.LIFE:
		_icon = spr_icon_life;
		break;
	case ELEMENTS.VENOM:
		_icon = spr_icon_venom;
		break;
	case ELEMENTS.LIGHTNING:
		_icon = spr_icon_lightning;
		break;
}
_color = color_for_element_background(_element);

switch(_rarity){
	case RARITY.R: _rarity = "Rank: R"; break;
	case RARITY.SR: _rarity = "Rank: [c_yellow]SR"; break;
	case RARITY.SSR: _rarity = "Rank: [rainbow]SSR"; break;
}

var _skill_desc = "";
if (_current_skill_hp_scale != undefined)
	_skill_desc = string_desc_for_id(index, display_description, _current_skill_scale, _current_skill_cd ,_current_skill_hp_scale);
else _skill_desc = string_desc_for_id(index, display_description, _current_skill_scale, _current_skill_cd);

draw_set(fnt_ship_desc, fa_left, fa_top,,alpha);
draw_sprite_ext(_icon, 0, text_x + 50, 80, 10, 10, 0, c_white, alpha);
draw_set(fnt_ship_desc2, fa_left, fa_top,,alpha);
draw_text_scribble(text_x + 60, 15, _rarity + "\n[rainbow]Level: " + string(_lvl) + "/100");
draw_set(fnt_ship_desc, fa_left, fa_top,,alpha);
draw_bg_box(10, 10, 500, 70, _color,alpha);
draw_text_scribble(20, 20, obj_ship.ship_name);

if (show_stats){
	draw_text_scribble(text_x, 450, _selected_skill);

	draw_set(fnt_ship_desc2, fa_left, fa_top,,alpha);
	draw_bg_box(text_x - 10, 500, 620, 340, _color,alpha);
	draw_text_scribble_ext(text_x, 520, _skill_desc, 600);

	draw_bg_box(text_x - 10, 115, 620, 190, c_grey,alpha);
	draw_text_scribble(text_x, 120, _stats);
}
else {
	var _bonuses = stringify_bonuses2();
	var _bonuses2 = stringify_bonuses();
	draw_bg_box(text_x - 10, 180, 300, 380, _color);
	draw_set(fnt_ship_desc2, fa_left, fa_top);
	draw_text_scribble(text_x, 190, _bonuses);
	draw_set(fnt_ship_desc2, fa_right, fa_top);
	draw_text_scribble(text_x + 280, 190, _bonuses2);
}


if(global.mid_transition) {
	if (alpha < 1) and (enter) {
		alpha+= (1/60);
	}
	else enter = false;
	if (alpha > 0) and (!enter) alpha -= (1/60);
}

color = _color;