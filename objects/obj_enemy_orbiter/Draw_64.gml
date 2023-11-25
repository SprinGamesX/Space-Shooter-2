/// @description Insert description here
// You can write your code in this editor
var _x;
var _x2;
var _x3;

if (num == 1){
	_x = (global.screen_width / 3) - (hp_bar_width / 2);
	_x2 = global.screen_width / 3;
	_x3 = (global.screen_width / 3) + (hp_bar_width / 2);
}
else{
	_x = ((global.screen_width / 3) * 2) - hp_bar_width / 2;
	_x2 = ((global.screen_width / 3) * 2);
	_x3 = ((global.screen_width / 3) * 2) + (hp_bar_width / 2);
}

draw_sprite_stretched(spr_boss_healthbar, 1,_x , 32, hp_bar_width, hp_bar_height);
draw_sprite_stretched_ext(spr_skill_energy, 0, _x + (hp_bar_offset), 32, hp_bar_width * (hp / maxhp) - (hp_bar_offset*2), hp_bar_height, c_red, 1);
draw_sprite_stretched(spr_boss_healthbar, 0,_x , 32, hp_bar_width, hp_bar_height);
draw_set(fnt_boss,,,c_red);
draw_text_scribble(_x2, 110, string(round(hp)));
draw_set(fnt_boss, fa_left, fa_bottom,c_red);
draw_text_scribble(_x, 32,name + " - lvl: "+ string(lv));
var _existing_status = 0;
var _yy = 30;
var _scale = 5;
if (freeze > 0){
	draw_sprite_ext(spr_icon_ice, 0, _x3 , _yy, 2, 2, 0, c_white, (freeze / 20));
	//draw_set(fnt_status_effects_boss, fa_right, fa_bottom, c_white);
	//draw_text_scribble(room_width / 3 + hp_bar_width / 2, 14, string(freeze));
	_existing_status++; 
	shader_set(sh_frozen);
	shader_set_uniform_f(uni_freeze, 0.01 * freeze);
}
if (poison > 0){
	draw_sprite_ext(spr_icon_venom, 0, _x3 - (_existing_status * 14) , _yy, 2, 2, 0, c_white, (poison / 15));
	//draw_set(fnt_status_effects_boss, fa_left, fa_bottom, c_purple);
	//draw_text_transformed(room_width / 3 + hp_bar_width / 2 -(_existing_status * 14), 14, string(poison), 1, 1, 0);
	_existing_status++;
}
if (life_ripe > 0){
	draw_sprite_ext(spr_icon_life, 0, _x3 -(_existing_status * 14) , _yy, 2, 2, 0, c_white, (life_ripe / 10));
	//draw_set(fnt_status_effects_boss, fa_left, fa_bottom, c_lime);
	//draw_text_transformed(room_width / 3 + hp_bar_width / 2 -(_existing_status * 14), 14, string(life_ripe), 1, 1, 0);
	_existing_status++;
}
if (shocked){
	draw_sprite_ext(spr_icon_lightning, 0, _x3 - (_existing_status * 14) , _yy, 2, 2, 0, c_white, 1);
	//draw_set(fnt_status_effects_boss, fa_left, fa_bottom, c_lime);
	//draw_text_scribble(room_width / 2 + hp_bar_width / 2 -(_existing_status * 14), 14, string(life_ripe));
	_existing_status++;
}
shader_reset();