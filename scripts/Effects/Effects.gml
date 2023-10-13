// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function screenshake(_time, _magnitude, _fade){
	if (!instance_exists(obj_screenshake)){
		instance_create_depth(-10, -10, 9999, obj_screenshake);
	}
	with (obj_screenshake){
		shake = true;
		shake_time = _time;
		shake_magnitude = _magnitude;
		shake_fade = _fade;
	}
}