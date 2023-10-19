draw_self();
if (locked) draw_sprite_ext(spr_diff, 4, x, y, scale, scale, 0, c_white, 1);
if (selected) scale = 1.5;
else scale = 1;

image_xscale = scale;
image_yscale = scale;