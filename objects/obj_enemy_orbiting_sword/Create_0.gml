orbited_x = 0;
orbited_y = 0;
orbited_dis = 0;
orbited_dis_target = 0;
angle = 0;
spin_speed = 0;
scale = 0;
ready = false;
echo = make_echo();

set_orbit = function(_x, _y, _dis, _angle, _spin_speed){
	orbited_x = _x;
	orbited_y = _y;
	orbited_dis_target = _dis;
	angle = _angle;
	spin_speed = _spin_speed;
}