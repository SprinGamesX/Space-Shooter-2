if (can_dmg){
	other.hp -= dmg;
	can_dmg = false;
	alarm[1] = seconds(5);
}
