event_inherited();
if(target == noone) or (!instance_exists(target)) or (target.immune){
	target = instance_nearest(x, y, parent_enemy);
	target_boss = true;
	crosshair_scale = 2;
	crosshair_alpha = 0;
}
if(crosshair_alpha < 1) crosshair_alpha+= 0.05;
if(crosshair_scale > 1) crosshair_scale-= 0.05;

if (ult_ongoing){
	draw_trail_random(trail);
	draw_trail_random(trail);
	draw_trail_random(trail);
}