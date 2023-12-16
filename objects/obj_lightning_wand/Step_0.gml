if (target != noone) and (instance_exists(target)){
	follow();
}
animation();
/*
if (cd <= 0){
	skill();
	cd = max_cd;
}
else { cd--; }
*/

if (!instance_exists(source)){
	instance_destroy();
}

