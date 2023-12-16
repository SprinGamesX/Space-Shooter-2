if (can_dmg){
	other.on_hit(dmg);
	show_debug_message(dmg);
	can_dmg = false;
	alarm[1] = seconds(5);
}
