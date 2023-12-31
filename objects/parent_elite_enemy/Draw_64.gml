///@desc Healthbar
draw_sprite_stretched(spr_boss_healthbar, 1,(global.screen_width / 2) - hp_bar_width / 2, 32, hp_bar_width, hp_bar_height);
draw_sprite_stretched_ext(spr_boss_energy, 0, (global.screen_width / 2) - hp_bar_width / 2 + (hp_bar_offset), 32, hp_bar_width * (hp / maxhp) - (hp_bar_offset*2), hp_bar_height, c_red, 1);
draw_sprite_stretched(spr_boss_healthbar, 0,(global.screen_width / 2) - hp_bar_width / 2, 32, hp_bar_width, hp_bar_height);
draw_set(fnt_boss,,,c_red);
draw_text_scribble(global.screen_width / 2, 110, "[scale,1.2]" + string(round(hp)));
draw_set(fnt_boss, fa_left, fa_bottom,c_red);
draw_text_transformed((global.screen_width / 2) - hp_bar_width / 2 + 3, 32,name + " - lvl: "+ string(lv), 1, 0.8, 0);
// status
var _existing_status = 0;
var _yy = 30;
var _scale = 5;
if (freeze > 0){
	draw_sprite_ext(spr_icon_ice, 0, global.screen_width / 2 + hp_bar_width / 2 , _yy, _scale, _scale, 0, c_white, (freeze / 20));
	//draw_set(fnt_status_effects_boss, fa_right, fa_bottom, c_white);
	//draw_text_scribble(room_width / 2 + hp_bar_width / 2, _yy, string(freeze));
	_existing_status++; 
	shader_set(sh_frozen);
	shader_set_uniform_f(uni_freeze, 0.01 * freeze);
}
if (poison > 0){
	draw_sprite_ext(spr_icon_venom, 0, global.screen_width / 2 + hp_bar_width / 2 -(_existing_status * _yy) , _yy, _scale, _scale, 0, c_white, (poison / 15));
	//draw_set(fnt_status_effects_boss, fa_left, fa_bottom, c_purple);
	//draw_text_scribble(room_width / 2 + hp_bar_width / 2 -(_existing_status * _yy), _yy, string(poison));
	_existing_status++;
}
if (life_ripe > 0){
	draw_sprite_ext(spr_icon_life, 0, global.screen_width / 2 + hp_bar_width / 2 -(_existing_status * _yy) , _yy, _scale, _scale, 0, c_white, (life_ripe / 10));
	//draw_set(fnt_status_effects_boss, fa_left, fa_bottom, c_lime);
	//draw_text_scribble(room_width / 2 + hp_bar_width / 2 -(_existing_status * _yy), _yy, string(life_ripe));
	_existing_status++;
}
if (shocked){
	draw_sprite_ext(spr_icon_lightning, 0, global.screen_width / 2 + hp_bar_width / 2 -(_existing_status * _yy) , _yy, _scale, _scale, 0, c_white, 1);
	//draw_set(fnt_status_effects_boss, fa_left, fa_bottom, c_lime);
	//draw_text_scribble(room_width / 2 + hp_bar_width / 2 -(_existing_status * _yy), _yy, string(life_ripe));
	_existing_status++;
}
shader_reset();