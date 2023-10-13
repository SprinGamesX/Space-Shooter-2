// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function rd_attack_1(_boss){
	for (var _i = 180 - 45; _i <= 180 + 45; _i+= 5){
		summon_enemy(obj_enemy1, _boss.lv, x, y, _i);
	}
}

function rd_attack_2(_boss){
	for (var _i = 0; _i < 10; _i++){
		var _y = random_range(y - 200, y + 200)
		var _ship = instance_nearest(x, _y, parent_ship);
		summon_enemy(obj_enemy1, _boss.lv, x, _y, point_direction(x, _y, _ship.x, _ship.y));
	}
}

function rd_attack_3(_boss){
	summon_enemy(obj_enemy_wall, _boss.lv, x, y + random_range(-100, 100), 180);
}





function rd_special_1(_boss){
	summon_enemy(obj_enemy_wall, _boss.lv, x, y, 180);
	summon_enemy(obj_enemy_wall, _boss.lv, x, y + 64, 180);
	summon_enemy(obj_enemy_wall, _boss.lv, x, y - 64, 180);
}