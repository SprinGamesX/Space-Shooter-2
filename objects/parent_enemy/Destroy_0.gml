if (explosive){
	var _ship = instance_nearest(x,y,parent_ship);
	for (var _i = 0; _i < 360; _i += 45)
		create_projectile(obj_fireball1, _ship.atk_scale, _i, _ship, 5)
}
//var _h = ds_list_find_index(global.enemy_list, self.id)
//ds_list_delete(global.enemy_list, _h)