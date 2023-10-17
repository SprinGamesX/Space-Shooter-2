draw_bg_box(x, y - 16, 72, 32, c_gray);
draw_set(fnt_coins, fa_left, fa_middle, c_rainbow(10));
draw_text_scribble(x + 24, y, string(global.upgrade_points));

image_blend = c_rainbow(10);
draw_self();

