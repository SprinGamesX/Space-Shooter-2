if (explosive){
	var _ship = instance_nearest(x,y,parent_ship);
	if (chance(_ship.ex)){
		for (var _i = 0; _i < 360; _i += 45)
			create_projectile(obj_fire_missile, 0.5, _i, _ship, 5,,,2, 0);
	}
	else {
		for (var _i = 0; _i < 360; _i += 45)
			create_projectile(obj_fireball1, 0.2, _i, _ship, 5,,,,0)
}}
var _n = ds_list_find_index(global.enemylist, self);
ds_list_delete(global.enemylist, _n);
//var _h = ds_list_find_index(global.enemy_list, self.id)
//ds_list_delete(global.enemy_list, _h)