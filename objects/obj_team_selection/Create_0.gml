options = ds_map_size(global.ships) - 1;
confirm = generate_confirm_button(48);
index = global.selected_ship;

var _xoff = 48;
var _x = x - _xoff;

for (var i = 0; i < 3; i++){
	var _b = instance_create_depth(_x, y, depth - 300, obj_team_member_selection);
	_b.index = i;
	_x += _xoff;
}