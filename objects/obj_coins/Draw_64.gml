draw_bg_box(x, y - 16, 200, 32, c_yellow);
draw_set(fnt_coins, fa_left, fa_middle);
draw_text_scribble(x + 32, y, string(global.coins));

draw_self();

