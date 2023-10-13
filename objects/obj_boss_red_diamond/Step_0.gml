// Immune to: Freeze / Explosive
event_inherited();

// Special attaks
// falls below 70%
if (hp < (maxhp / 100) * 70) and (stage < 2) {
	rd_special_1(self);
	stage = 2;
}
if (hp < (maxhp / 100) * 20) and (stage < 3) and (x > room_width / 2) {
	x -= 0.2;
}