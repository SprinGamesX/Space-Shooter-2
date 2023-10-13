randomize();
var _y = 20;
var _i1 = summon_enemy_bladie(sword_x, _y, dmg, 0,,,random_range(270 - 10, 270 + 10));
var _i2 = summon_enemy_bladie(sword_x, room_height - _y, dmg, 0,,,random_range(90 - 10, 90 + 10));
sword_x += 8;
if (sword_x < room_width){
	alarm[4] = seconds(0.05);
}