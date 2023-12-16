event_inherited();

f_1 = create_follower(obj_lightning_wand, 16, 16, atk_scale, max_atk_cd, 0);
f_2 = create_follower(obj_lightning_wand, 16, 16, atk_scale, max_skill_cd, 0);

f_2.index = -1;
basic_index = 1;

skill_active = false;
lasering = false;
laser_time = 0;
charge = 0;

basic_attack = function(){
	switch(basic_index){
		case 1: f_1.skill(); break;
		case -1: f_2.skill(); break;
	}
	basic_index*=-1;
}

skill = function(){
	skill_active = true;
}

ultimate = function(){
	create_follower(obj_lightning_destroyer, 0,0,ult_scale,seconds(5), seconds(7.1));
}

on_hit = function(_dmg){
	if (!immune)
		hp -= _dmg;
}