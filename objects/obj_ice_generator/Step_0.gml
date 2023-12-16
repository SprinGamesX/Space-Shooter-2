if (target != noone) and (instance_exists(target)){
	follow();
}
animation();

if (cd <= 0) and (attack_by_key(ATTACK_TYPES.NORMAL)){
	skill();
	cd = max_cd;
}
else { cd--; }

duration--;
if (duration == 0){
	instance_destroy();
}

