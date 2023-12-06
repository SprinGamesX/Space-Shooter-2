var _x = global.screen_width / 4;
var _y = global.screen_height - 48;

var _o = 128;

var switchable = switch_cd <= 0;
var _a = 0.9;
if (!switchable) _a = 0.5;

for (var i = 0; i < 3; i++){
	var _s = 2;
	if (i == active_index) _s = 3;
	draw_sprite_ext(global.team[i].sprite_index, 0, _x + _o*i, _y, _s, _s, 90, c_white, _a);
	draw_set(fnt_ship_desc2, fa_center, fa_middle);
	draw_text_scribble(_x + _o*i, _y, i+1);
}