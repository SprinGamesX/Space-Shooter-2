max_cd = 0;

follow = function(){
	if (instance_exists(obj_team_manager)){
		target = obj_team_manager.get_active_ship();
	}
	var _x = target.x + dis_x;
	var _y = target.y + dis_y;
	var correction = 2;
	
	var error_x = abs(x - _x) / 10;
	if (x > _x) x -= correction * sqrt(error_x);
	if (x < _x) x += correction * sqrt(error_x);
	// y axis
	var error_y = abs(y - _y) / 10;
	if (y > _y) y -= correction * sqrt(error_y);
	if (y < _y) y += correction * sqrt(error_y);
	
}

setup = function(_target,_dis_x,_dis_y, _scaling, _cd, _duration){
	target = _target;
	dis_x = _dis_x;
	dis_y = _dis_y;
	scaling = _scaling;
	cd = _cd;
	duration = _duration;
	max_cd = _cd;
	critrate = target.critrate;
	critdmg = target.critdmg;
	atk = target.atk;
	ex = target.ex;
}
animation = function(){
	// animate
}
skill = function(){
	// skill
}