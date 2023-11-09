if (instance_exists(target)){
	make_ice_sword(target, 1.5, dir);
}
dir += 360 / 10;
ult_num--;
if (ult_num > 0)
	alarm[0] = seconds(0.05);
else resume_all_enemys();