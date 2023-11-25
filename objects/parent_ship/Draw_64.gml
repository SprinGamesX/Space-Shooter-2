var _skill_cd_progress = 100 - ((skill_cd/max_skill_cd) * 100)
var _ult_cd_progress = 100 - ((ult_cd/max_ult_cd) * 100)
var _xx = 0;
draw_sprite_ext(spr_skill_background, 0, _xx, global.screen_height - bar_height * 2, bar_scale, bar_scale, 0, c_white, 1);
draw_sprite_stretched_ext(spr_skill_energy, 0, _xx + bar_scale, global.screen_height - bar_height * 2,(bar_width * _skill_cd_progress / 100) - (bar_scale*2), bar_height, skill_bar_color, 1);
draw_sprite_ext(spr_skill_bar, 0, _xx, global.screen_height - bar_height * 2, bar_scale, bar_scale, 0, c_white, 1);

draw_sprite_ext(spr_skill_background, 0, _xx, global.screen_height - bar_height , bar_scale, bar_scale, 0, c_white, 1);
draw_sprite_stretched_ext(spr_skill_energy, 0, _xx + bar_scale, global.screen_height - bar_height,(bar_width * _ult_cd_progress / 100) - (bar_scale*2), bar_height, ult_bar_color, 1);
draw_sprite_ext(spr_skill_bar, 0, _xx, global.screen_height - bar_height , bar_scale, bar_scale, 0, c_white, 1);

draw_set(fnt_boss, fa_left, fa_bottom);
var _t = "HP: " + string(round(hp)) + "/" + string(max_hp);
if (hp < max_hp / 10) _t = "[scale, 2][shake]" + _t;
draw_text_scribble(_xx, global.screen_height - bar_height * 2, _t);