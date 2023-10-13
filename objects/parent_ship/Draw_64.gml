var _skill_cd_progress = 100 - ((skill_cd/max_skill_cd) * 100)
var _ult_cd_progress = 100 - ((ult_cd/max_ult_cd) * 100)
draw_sprite_stretched_ext(spr_skill_energy, 0, 10, 10,30 * 5 * _skill_cd_progress / 100, 5*5, skill_bar_color, 1);
draw_sprite_ext(spr_skill_bar, 0, 10, 10, 5, 5, 0, c_white, 1);

draw_sprite_stretched_ext(spr_skill_energy, 0, 10, 35,30 * 5 * _ult_cd_progress / 100, 5*5, ult_bar_color, 1);
draw_sprite_ext(spr_skill_bar, 0, 10, 35, 5, 5, 0, c_white, 1);

draw_set(fnt_boss_hb, fa_left, fa_top);
draw_text_ext_transformed(10, 60, "HP: " + string(hp) + "/" + string(max_hp), 1, 1000, 1.5, 1.5, 0);