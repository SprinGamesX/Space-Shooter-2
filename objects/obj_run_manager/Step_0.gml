
var key_up = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up);
var key_down = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down);
var key_confirm = keyboard_check_pressed(vk_enter);


pos += key_down - key_up;

if (pos >= op_length) pos = 1;
if (pos < 1) pos = op_length - 1;

if (key_confirm){
	switch(pos){
		case 0: break;
		
		case 1: 
			load_latest_run();
			transition_start(rm_domain_roadmap, seq_fade_out, seq_fade_in);
			fade_out = true;
		break;
		
		case 2: 
			delete_latest_run_file();  
			transition_start(rm_trial_selection, seq_fade_out, seq_fade_in);
			fade_out = true;
		break;
		
		case 3: transition_start(rm_main_menu, seq_fade_out, seq_fade_in); 
			fade_out = true;
	}
}

if (fade_in) and (alpha < 1) alpha += 1/60;
else fade_in = false;

if (fade_out) alpha -= 1/60;