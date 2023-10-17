follow();
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

