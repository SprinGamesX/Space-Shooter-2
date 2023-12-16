var key_up = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up);
var key_down = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down);
var key_confirm = keyboard_check_pressed(vk_enter);


pos += key_down - key_up;

if (pos >= op_length) pos = 1;
if (pos < 1) pos = op_length - 1;

if (key_confirm){
	switch(level){
		case 0:
			switch(pos){
				case 0: break;
		
				case 1: 
					level = 1;
					op_length = 5; 
				break;
		
				case 2: 
					instance_destroy();
					fade_out = true;
				break;
				case 3: 
					save_collection();
					save_keybinds();
					game_end();
					fade_out = true;
				break;
				}
		break;
		case 1:
			switch(pos){
				case 0: break;
		
				case 1: 
					change_keybinds(PRESET_KEYS.SEQ);
					level = 0;
					op_length = 4; 
				break;
		
				case 2: 
					change_keybinds(PRESET_KEYS.MOUSE);
					level = 0;
					op_length = 4; 
				break;
				case 3: 
					change_keybinds(PRESET_KEYS.JKL);
					level = 0;
					op_length = 4; 
				break;
				case 4: 
					level = 0;
					op_length = 4; 
				break;
				
				
				}
			break;
	}
}

if (fade_in) and (alpha < 1) alpha += 1/60;
else fade_in = false;

if (fade_out) alpha -= 1/60;