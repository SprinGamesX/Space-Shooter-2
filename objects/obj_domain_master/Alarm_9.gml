/// @description Lost battle
global.pending_reset = true;
transition_start(rm_domain_roadmap, seq_fade_out, seq_fade_in);


part_system_clear(global.trail_system);
part_system_clear(global.part_system);
part_system_clear(global.menu_part_system);
instance_destroy(parent_enemy);

