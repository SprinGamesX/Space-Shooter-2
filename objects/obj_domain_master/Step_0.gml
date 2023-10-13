if (!instance_exists(win_condition)) and (!instance_exists(win_condition2)){
	alarm[10] = seconds(2);
	win_condition = self;
}
if (!instance_exists(lose_condition)){
	alarm[9] = seconds(2);
	lose_condition = self;
}