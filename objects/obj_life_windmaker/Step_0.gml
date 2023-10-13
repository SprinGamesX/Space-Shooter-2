if (spd > 0){
	spd -= acc;
	x -= spd;
}
if (hp <= 0) instance_destroy();