draw_self();
draw_sprite_ext(spr_lightning_ship2_core, 0, x - 6, y, 1, 1, rot, c_white, 1);
rot++;
if (ult_ongoing) rot+= 5;
if (target != noone) and (instance_exists(target) and (active))
	draw_sprite_ext(spr_lightning_target, crosshair_index, target.x, target.y, crosshair_scale, crosshair_scale, 0, c_white, crosshair_alpha);