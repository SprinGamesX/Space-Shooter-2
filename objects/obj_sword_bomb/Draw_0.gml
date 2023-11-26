image_xscale = scale;
image_yscale = scale;
event_inherited();
// health bar
draw_sprite_stretched_ext(spr_skill_energy, 0, x - hp_bar_width / 2, y - 16 , hp_bar_width * (hp / maxhp), hp_bar_height, c_red, 1);
draw_sprite_stretched_ext(spr_health_bar, 0,x - hp_bar_width / 2, y - 16, hp_bar_width, hp_bar_height, c_maroon, 1);

