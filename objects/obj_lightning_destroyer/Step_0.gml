animation();

if (cd <= 0){
	skill();
	cd = max_cd;
	shot = true;
	screenshake(seconds(3), 1.5, 0.1);
}
else 
{ 
	if (!shot){
		cd--;
		make_charge_particle(0, room_height/2, ELEMENTS.LIGHTNING, 100);
	}
}

duration--;
if (duration == 0){
	instance_destroy();
}
