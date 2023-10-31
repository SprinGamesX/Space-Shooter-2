event_inherited();

if (kills >= 1){
	if (friend != noone){
		friend.add_charge(kills);
	}
	kills = 0;
}