event_inherited();
base_x = 0;
base_y = 0;
correction = 2;
base_hp = 750;
base_dmg = 10;
follow_parent = true;
scale = 1.5;
can_dmg = true;
echo = make_echo(,scale);
image_xscale = scale;
image_yscale = scale;
shooting = false;

follow = function(){
	
	// x axis
	var error_x = abs(x - base_x) / 10;
	if (x > base_x) x -= correction * sqrt(error_x);
	if (x < base_x) x += correction * sqrt(error_x);
	// y axis
	var error_y = abs(y - base_y) / 10;
	if (y > base_y) y -= correction * sqrt(error_y);
	if (y < base_y) y += correction * sqrt(error_y);
	
	//x = base_x;
	//y = base_y;
}

set_base = function(_x, _y){
	base_x = _x;
	base_y = _y;
	show_debug_message(string(base_x) + "," + string(base_y))
	show_debug_message(string(x) + "," + string(y))
}

shoot = function(_speed, _direction){
	follow_parent = false;
	speed = _speed;
	direction = _direction;
	shooting = true;
}






