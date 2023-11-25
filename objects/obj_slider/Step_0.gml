if (draw_on_gui){
	if (mouse_check_button_pressed(mb_left)) && (position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id)) {
		is_being_dragged = true;
	}
}



if (is_being_dragged){
	var mx = 0;
	if (!draw_on_gui){
		mx = mouse_x;
	}
	else {
		mx = device_mouse_x_to_gui(0);
	
	}
	if (mx > x){
		var xx = abs(x - mx);
		var amount = xx / sprite_width;
	
		amount = clamp(amount, 0, 1);
		amount_current = amount * max_amount;
	}
	else {
		amount_current = 0;
	}
}



