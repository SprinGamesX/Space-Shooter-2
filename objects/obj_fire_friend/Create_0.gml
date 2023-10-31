event_inherited();
hp = 5;
charge = 0;
ship = instance_nearest(x, y, parent_ship);
hit_list = ds_list_create();
kill_spree = false;
trail = make_trail(2, ELEMENTS.FIRE);
current_target = noone;
og_target = noone;
og_axis = [0,0];

skill = function(){
	alarm[0] = seconds(0.1);
}

add_charge = function(_num){
	charge += _num;
	create_dmg_indicator(x, y, "CHARGE +" + string(_num),,ELEMENTS.FIRE);
}

follow = function(){
	if (instance_exists(target)){
		var _x = target.x + dis_x;
		var _y = target.y + dis_y;
		var correction = 2;
		if (kill_spree) correction = 4;
	
		var error_x = abs(x - _x) / 10;
		if (x > _x) x -= correction * sqrt(error_x);
		if (x < _x) x += correction * sqrt(error_x);
		// y axis
		var error_y = abs(y - _y) / 10;
		if (y > _y) y -= correction * sqrt(error_y);
		if (y < _y) y += correction * sqrt(error_y);
	
		if (error_x > 0.1 or error_y > 0.1){
			draw_trail(trail);
		}
	}
}


switch_target = function(){
	var list = ds_list_create();
	var new_target = noone;
	var num = collision_rectangle_list(0, 0, room_width, room_height, parent_enemy, false, true, list, true);
	var i = 0;
	while(new_target == noone){
		show_debug_message("Index: " + string(i) + " Max: " + string(num))
		var enemy = list[|i];
		if (!exists_in_hitlist(hit_list, enemy)){
			new_target = enemy;
		}
		else i++;
		if (i >= num) return noone;
	}
	ds_list_destroy(list);
	return new_target;
}



