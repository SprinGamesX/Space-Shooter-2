
var key_up = keyboard_check_pressed(ord("W"));
var key_down = keyboard_check_pressed(ord("S"));
var key_confirm = keyboard_check_pressed(vk_enter);


pos += key_down - key_up;

if (pos >= op_length) pos = 0;
if (pos < 0) pos = op_length - 1;

if (key_confirm){
	switch(pos){
		case 0: break;
		case 1: break;
		case 2: transition_start(rm_trial_selection, seq_fade_out, seq_fade_in); fade_out = true;
	}
}

if (fade_out) alpha -= 1/60;