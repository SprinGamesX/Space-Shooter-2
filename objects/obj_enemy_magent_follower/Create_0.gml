event_inherited();
base_x = 0;
base_y = 0;
correction = 2;
follow_parent = true;
b_dmg = 10;
b_hp = 750;
scale = 1.5;
can_dmg = true;
echo = make_echo(,scale);
image_xscale = scale;
image_yscale = scale;
shooting = false;
shooting_cd = 0;
shooting_cd_max = seconds(1);

follow = function(){
	
	// x axis
	var error_x = abs(x - base_x) / 10;
	if (x > base_x) x -= correction * sqrt(error_x);
	if (x < base_x) x += correction * sqrt(error_x);
	// y axis
	var error_y = abs(y - base_y) / 10;
	if (y > base_y) y -= correction * sqrt(error_y);
	if (y < base_y) y += correction * sqrt(error_y);
}

set_base = function(_x, _y){
	base_x = _x;
	base_y = _y;
}

shoot = function(_speed, _direction){
	follow_parent = false;
	speed = (_speed - (_speed * slowed));
	direction = _direction;
	shooting = true;
}






