instance_destroy(parent_enemy);

global.enemylist = ds_list_create();
win_condition = self;
win_condition2 = noone;
time = 0;
time_limit = 0;
display_time = false;
lose_condition = instance_create_depth(-100, -100, 999, obj_team_manager);

switch(global.current_domain_type){
	case DOMAIN_TYPE.COMBAT: alarm[0] = seconds(2); break;
	case DOMAIN_TYPE.ELITE: alarm[1] = seconds(2); break;
	case DOMAIN_TYPE.BOSS: alarm[2] = seconds(2); break;
	case DOMAIN_TYPE.TIME: alarm[3] = seconds(2); time = seconds(122); display_time = true; break;
	case DOMAIN_TYPE.TEST: alarm[8] = seconds(2); break;
}
star = make_star();
alarm[11] = seconds(0.05);

// stats
global.highest_hit = 0;
global.time = 0;
global.overalldmg = 0;
dps = 0;
alarm[7] = seconds(1);

global.trail_system = part_system_create();
part_system_layer(global.trail_system, layer_get_id("Echos")); 