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
			instance_activate_all();
			resume_all_enemys();
			instance_destroy();
		break;
		
		case 2:
			instance_activate_all();
			resume_all_enemys();
			obj_domain_master.alarm[9] = seconds(1);
			instance_destroy();
		break;
				
	}
}
