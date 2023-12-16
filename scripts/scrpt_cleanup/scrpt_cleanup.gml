// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function clean_battle(){
	instance_destroy(parent_enemy_projectile);
	instance_destroy(parent_enemy);
	instance_destroy(parent_attach_projectile);
	instance_destroy(parent_projectile);
	instance_destroy(parent_ship);
	instance_destroy(obj_team_manager);
	part_system_clear(global.trail_system);
	part_system_clear(global.part_system);
	part_system_clear(global.menu_part_system);
}