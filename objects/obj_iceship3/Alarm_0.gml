
var _offset = 100 - (50 * ult_num);
if (instance_exists(target)){
	var xx = x;
	var yy = y + _offset;
	
	var _dir = point_direction(xx, yy, target.x, target.y);
	create_projectile(obj_ice_greatsword, ult_scale/5, _dir, self, 10, xx, yy,,,5);
}
ult_num--;
if (ult_num > 0)
	alarm[0] = seconds(0.05);
else resume_all_enemys();