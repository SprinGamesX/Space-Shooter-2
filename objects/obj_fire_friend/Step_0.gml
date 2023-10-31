if (og_target == noone){
	og_target = target;
	og_axis = [dis_x, dis_y];
}

if (!kill_spree){
	follow();
	speed = 0;
	direction = 0;
	image_angle = direction;
}
else {
	if (current_target == noone) current_target = instance_nearest(x, y, parent_enemy);
	else {
		target = current_target;
		dis_x = 0;
		dis_y = 0;
		follow();
		direction = point_direction(x, y, current_target.x, current_target.y);
		image_angle = direction;
		if (num_in_range(x, current_target.x - 2, current_target.x + 2)) and (num_in_range(y, current_target.y - 2, current_target.y + 2)){
			show_debug_message("COLLISION");
			create_mine(obj_fire_mine, ship.ult_scale, ship, current_target, 3, 1);
			ds_list_add(hit_list, current_target);
			var e = switch_target();
			if (e == noone) {
				kill_spree = false;
				alarm[1] = seconds(0.5);
				ds_list_clear(hit_list);
				current_target = noone;
				target = og_target;
				dis_x = og_axis[0];
				dis_y = og_axis[1];
			}
			else {
				current_target = e;
			}
		}
	}
}

animation();
