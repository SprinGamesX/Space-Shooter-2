draw_sprite_stretched_ext(spr_skill_energy, 0, (room_width / 2) - hp_bar_width / 2 + 3, 16, hp_bar_width * (hp / maxhp) - 3, hp_bar_height, c_red, 1);
draw_sprite_stretched(spr_boss_healthbar, 0,(room_width / 2) - hp_bar_width / 2, 16, hp_bar_width, hp_bar_height);
draw_set(fnt_boss_hb,,,c_red);
draw_text_scribble(room_width / 2, 48, string(round(hp)));
draw_set(fnt_boss_hb, fa_left, fa_bottom,c_red);
draw_text_transformed((room_width / 2) - hp_bar_width / 2 + 3, 16,name + " - lvl: "+ string(lv), 1, 0.8, 0);
var _existing_status = 0;
if (freeze > 0){
	draw_sprite_ext(spr_icon_ice, 0, room_width / 2 + hp_bar_width / 2 , 14, 2, 2, 0, c_white, 1);
	draw_set(fnt_status_effects_big, fa_left, fa_bottom, c_aqua);
	draw_text_scribble(room_width / 2 + hp_bar_width / 2, 14, string(freeze));
	_existing_status++; 
	shader_set(sh_frozen);
	shader_set_uniform_f(uni_freeze, 0.01 * freeze);
}
if (poison > 0){
	draw_sprite_ext(spr_icon_venom, 0, room_width / 2 + hp_bar_width / 2 -(_existing_status * 14) , 14, 2, 2, 0, c_white, 1);
	draw_set(fnt_status_effects_big, fa_left, fa_bottom, c_purple);
	draw_text_scribble(room_width / 2 + hp_bar_width / 2 -(_existing_status * 14), 14, string(poison));
	_existing_status++;
}
if (life_ripe > 0){
	draw_sprite_ext(spr_icon_life, 0, room_width / 2 + hp_bar_width / 2 -(_existing_status * 14) , 14, 2, 2, 0, c_white, 1);
	draw_set(fnt_status_effects_big, fa_left, fa_bottom, c_lime);
	draw_text_scribble(room_width / 2 + hp_bar_width / 2 -(_existing_status * 14), 14, string(life_ripe));
	_existing_status++;
}

