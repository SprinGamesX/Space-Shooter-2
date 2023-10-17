max_cd = 0;

follow = function(){
	x = target.x + dis_x;
	y = target.y + dis_y;
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