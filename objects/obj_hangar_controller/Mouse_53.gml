var xx = room_width / 4;
var yy = room_height / 2;
if (num_in_range(mouse_x, xx - 64, xx + 64) and (num_in_range(mouse_y, yy - 64, yy + 64))){
	// Clicked within the area where the ship is drawn
	if (!global.obtained_ships[obj_ship.ship_index]){
		generate_pop_up(obj_popup_unlock_ship, 900, 200);
	}
}