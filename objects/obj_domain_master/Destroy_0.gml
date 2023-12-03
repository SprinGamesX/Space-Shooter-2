ds_list_destroy(global.enemylist);
instance_destroy(parent_enemy)
part_system_clear(global.trail_system);
part_system_clear(global.part_system);
part_system_clear(global.menu_part_system);
global.highest_hit = 0;
