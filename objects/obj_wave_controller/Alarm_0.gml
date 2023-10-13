/// @description
if (5 > wave > 0)
	ds_list_add(global.enemy_list, summon_enemy(obj_enemy1, wave, room_width + 20, random_range(50, room_height - 50)));
if (wave == 5){
	summon_enemy(obj_boss_red_diamond, wave, room_width + 100, room_height / 2);
	wave = 5.1;
}
if (wave == 6) transition_start(rm_domain_selection, seq_fade_out, seq_fade_in);

alarm[0] = summon_time;

