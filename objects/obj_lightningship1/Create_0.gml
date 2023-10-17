event_inherited();
charge = 0;
skill_dur = 3;
max_skill_dur = skill_dur;
rot = 0;

basic_attack = function(){
	// do basic attack
}

skill = function(){
	skill_dur = max_skill_dur;
}

ultimate = function(){
	var _dis = 16;
	create_follower(obj_lightning_charger, 0, _dis, ult_scale, seconds(5), seconds(23));
	create_follower(obj_lightning_charger, 0, -_dis, ult_scale, seconds(5), seconds(23));
}