global.selected_ship = 8;
global.ships = ds_map_create();

ds_map_add(global.ships, 0, obj_iceship1);
ds_map_add(global.ships, 1, obj_fireship1);
ds_map_add(global.ships, 2, obj_lifeship1);
ds_map_add(global.ships, 3, obj_iceship2);
ds_map_add(global.ships, 4, obj_venomship1);
ds_map_add(global.ships, 5, obj_fireship2);
ds_map_add(global.ships, 6, obj_lifeship2);
ds_map_add(global.ships, 7, obj_lightningship1);
ds_map_add(global.ships, 8, obj_lightningship2);


function generate_arrow_buttons(_offset, _parent = self){
	var _btn1 = instance_create_layer(_parent.x + _offset, _parent.y, "Instances", obj_arrow_button);
	_btn1.set_button(_parent, true);
	var _btn2 = instance_create_layer(_parent.x - _offset, _parent.y, "Instances", obj_arrow_button);
	_btn2.set_button(_parent, false);
	return [_btn1, _btn2];
}

function generate_confirm_button(_offset, _parent = self){
	var _btn = instance_create_layer(_parent.x, _parent.y + _offset, "Instances", obj_button_confirm);
	_btn.set_button(_parent);
	return _btn;
}