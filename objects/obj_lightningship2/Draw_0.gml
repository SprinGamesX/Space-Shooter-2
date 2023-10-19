draw_self();
if (target != noone) and (instance_exists(target))
	draw_sprite_ext(spr_lightning_target, crosshair_index, target.x, target.y, crosshair_scale, crosshair_scale, 0, c_white, crosshair_alpha);