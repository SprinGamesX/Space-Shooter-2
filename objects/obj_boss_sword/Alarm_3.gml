alarm[3] = seconds(50);
if (instance_exists(parent_ship)){
	summon_enemy_orbiting_sword(parent_ship.x, parent_ship.y, dmg, 12, 128, 3, seconds(10));
}