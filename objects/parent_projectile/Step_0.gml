image_angle = direction;
if (pierce > 0){
	if (ds_list_size(hit_list) > pierce) instance_destroy();
}
projectile_collision(self, hit_list, aoe);

kill_outside_bounds();
draw_echo(echo);

if (!instance_exists(parent_ship)){
	instance_destroy(self);
}