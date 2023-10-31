with(create_projectile(obj_iceshard2, source.atk_scale / 5, 0, source, 5,,,,,1)){
	ds_list_add(hit_list, instance_nearest(x, y, parent_enemy));
}
with(create_projectile(obj_iceshard2, source.atk_scale / 5, 5, source, 5,,,,,1)){
	ds_list_add(hit_list, instance_nearest(x, y, parent_enemy));
}
with(create_projectile(obj_iceshard2, source.atk_scale / 5, -5, source, 5,,,,,1)){
	ds_list_add(hit_list, instance_nearest(x, y, parent_enemy));
}