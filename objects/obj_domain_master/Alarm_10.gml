/// @description won battle
randomize();
global.reward += (irandom_range(300, 1000) * global.lvl);
if (global.current_domain_type == DOMAIN_TYPE.ELITE) global.reward *= 2;
if (global.current_domain_type == DOMAIN_TYPE.BOSS)
	global.reward += (irandom_range(3000, 10000) * global.lvl);
transition_start(rm_domain_selection, seq_fade_out, seq_fade_in);


