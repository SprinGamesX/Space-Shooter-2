if (can_dmg){
	other.on_hit(dmg);
	can_dmg = false;
	alarm[1] = seconds(5);
}
