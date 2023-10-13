draw_self();
// health bar
draw_sprite_stretched_ext(spr_skill_energy, 0, x - hp_bar_width / 2, y - 40 , hp_bar_width * (hp / maxhp), hp_bar_height, c_red, 1);
draw_sprite_stretched_ext(spr_health_bar, 0,x - hp_bar_width / 2, y - 40, hp_bar_width, hp_bar_height, c_maroon, 1);
if (life_ripe > 0){
	draw_sprite(spr_icon_life, 0, x - hp_bar_width / 2, y - 40);
	draw_set(fnt_status_effects, fa_left, fa_bottom, c_lime);
	draw_text(x - hp_bar_width / 2, y - 40, string(life_ripe));
}