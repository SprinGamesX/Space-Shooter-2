draw_bg_box(x, y - 24, 200, 48, c_yellow);
draw_set(fnt_coins, fa_left, fa_middle);
draw_text(x + 32, y, string(global.coins));

draw_self();

