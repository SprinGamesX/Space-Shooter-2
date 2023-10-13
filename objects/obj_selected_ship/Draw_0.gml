var _scale = 1.5
draw_sprite_ext(object_get_sprite(global.ships[?index]), 0, x, y, _scale, _scale, angle, c_white, 1);
angle += 0.5;
image_xscale = _scale;
image_yscale = _scale;