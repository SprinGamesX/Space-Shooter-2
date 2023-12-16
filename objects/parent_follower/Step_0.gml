if (target != noone) and (instance_exists(target)){
	follow();
}
else target = obj_team_manager.get_active_ship();
animation();

if (cd <= 0){
	skill();
	cd = max_cd;
}
else { cd--; }

duration--;
if (duration == 0){
	instance_destroy();
}

