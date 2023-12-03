/// @description Domain Boss
switch(global.trialtype){
	case TRIAL.BLADE:
		win_condition = summon_boss_sword(global.lvl);
	break;
	
	case TRIAL.DECIMATION:
		win_condition = summon_boss_spears(global.lvl);
	break;
	
	case TRIAL.BALANCE:
		win_condition = summon_boss_spears(global.lvl);
	break;

}




