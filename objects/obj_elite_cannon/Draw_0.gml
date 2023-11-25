draw_self();

var _xx = x - lengthdir_x(recoil, direction);
var _yy = y - lengthdir_y(recoil, direction);
if (recoil > 0) recoil -= 1;

draw_sprite_ext(spr_elite_cannon, 1, _xx, _yy, scale, scale, direction, c_white, 1);

shader_reset();