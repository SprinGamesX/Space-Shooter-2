draw_sprite(spr_life_windmaker, 2, x, y);
draw_sprite_ext(spr_life_windmaker, 1, x, y, 1, 1, rot, c_white, 1);
draw_sprite(spr_life_windmaker, 0, x, y);
rot -= 5;
draw_echo(echo);

// health bar
draw_sprite_stretched_ext(spr_skill_energy, 0, x - hp_bar_width / 2, y - 20 , hp_bar_width * (hp / maxhp), hp_bar_height, c_lime, 1);
draw_sprite_stretched_ext(spr_health_bar, 0,x - hp_bar_width / 2, y - 20, hp_bar_width, hp_bar_height, c_green, 1);





