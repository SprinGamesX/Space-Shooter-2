image_angle = direction;
if (pierce > 0){
	if (ds_list_size(hit_list) > pierce) instance_destroy();
}
projectile_collision(self, hit_list, aoe);

kill_outside_bounds();
switch(element){
	case ELEMENTS.ICE: draw_echo(echo); break;
	case ELEMENTS.FIRE: draw_trail(trail); break;
	case ELEMENTS.LIFE: draw_trail(trail); break;
	case ELEMENTS.VENOM: draw_trail(trail); break;
	case ELEMENTS.LIGHTNING: draw_echo(echo); break;
}



if (!instance_exists(parent_ship)){
	instance_destroy(self);
}
