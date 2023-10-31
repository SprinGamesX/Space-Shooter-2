image_angle = direction + 45;

if (pierce > 0){
	if (ds_list_size(hit_list) > pierce) instance_destroy();
}
projectile_collision(self, hit_list, aoe);

kill_outside_bounds();

draw_trail(trail);

if (!instance_exists(parent_ship)){
	instance_destroy(self);
}