var _existing_status = 0;
if (freeze > 0){
	draw_sprite(spr_icon_ice, 0, x + 12, y - 18);
	//draw_set(fnt_status_effects, fa_left, fa_bottom, c_aqua);
	//draw_text(x + 12 - (_existing_status * 7), y - 18, string(freeze));
	_existing_status++;
	shader_set(sh_frozen);
	shader_set_uniform_f(uni_freeze, 0.01 * freeze);
}
if (poison > 0){
	draw_sprite(spr_icon_venom, 0, x + 12 - (_existing_status * 7), y - 18);
	//draw_set(fnt_status_effects, fa_left, fa_bottom, c_purple);
	//draw_text(x + 12 - (_existing_status * 7), y - 18, string(poison));
	_existing_status++;
}
if (life_ripe > 0){
	draw_sprite(spr_icon_life, 0, x + 12 - (_existing_status * 7), y - 18);
	//draw_set(fnt_status_effects, fa_left, fa_bottom, c_lime);
	//draw_text(x + 12 - (_existing_status * 7), y - 18, string(life_ripe));
	_existing_status++;
}
if (explosive){
	draw_sprite(spr_icon_fire, 0, x + 12 - (_existing_status * 7), y - 18);
	_existing_status++;
}
if (shocked){
	draw_sprite(spr_icon_lightning, 0, x + 12 - (_existing_status * 7), y - 18);
	_existing_status++;
}


draw_self();
shader_reset();