var p = count_poisoned_enemys();
atk = og_atk;
atk += (atk / 50) * min(p, 50);
event_inherited();
