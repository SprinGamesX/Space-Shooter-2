/// @description Insert description here
current_team = [noone, noone, noone];
var _x = 8;
var _xoff = 64;
var _y = 32;
var _yoff = 72;

// Load obtained ships
load_collection();


// Create all ship buttons
for (var i = 0; i < ds_map_size(global.ships); i++){
	// Create button
	var _b = instance_create_layer(_x, _y, "Buttons", obj_ship_button);
	_b.ship_index = i;
	obj_ship.update_index(i);
	_b.image_blend = color_for_element_background(obj_ship.element);
	
	// Positioning
	_x += _xoff;
	if (_x > room_width){
		_y += _yoff;
		_x = 8;
	}
	_b.activate();
}
