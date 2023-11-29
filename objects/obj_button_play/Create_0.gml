on_click = function(){
	if (check_latest_run_file())
		transition_start(rm_existing_run, seq_fade_out, seq_fade_in);
	else
		transition_start(rm_trial_selection, seq_fade_out, seq_fade_in)
}