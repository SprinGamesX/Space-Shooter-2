debuff_cds = [0,0,0];

apply_debuffs = function(){
	if (debuff_cds[0] > 0){
		debuff_cds[0]--;
	}
	if (debuff_cds[0] <= 0){
		dmg_amp = 0;
	}
	if (debuff_cds[1] > 0){
		debuff_cds[1]--;
	}
	if (debuff_cds[1] <= 0){
		slowed = 0;
	}
	if (debuff_cds[2] > 0){
		debuff_cds[2]--;
	}
	if (debuff_cds[2] <= 0){
		poison_amp = 0;
	}
}