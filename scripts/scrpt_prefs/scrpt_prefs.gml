// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum PRESET_KEYS{
	SEQ = 0,
	MOUSE = 1,
	JKL = 2
}

enum ATTACK_TYPES{
	NORMAL = 0,
	SKILL = 1,
	ULT = 2
}

global.keybinds = [vk_space, ord("E"), ord("Q")];
global.keys = PRESET_KEYS.SEQ;

function change_keybinds(_index){
	global.keys = _index;
	switch(_index){
		case PRESET_KEYS.SEQ: global.keybinds = [vk_space, ord("E"), ord("Q")]; break;
		case PRESET_KEYS.MOUSE: global.keybinds = [mb_left, mb_right, ord("Q")]; break;
		case PRESET_KEYS.JKL: global.keybinds = [ord("J"), ord("K"), ord("L")]; break;
	}
	save_keybinds();
}

function attack_by_key(_attack_type){
	switch(_attack_type){
		case ATTACK_TYPES.NORMAL: 
			if (global.keys != PRESET_KEYS.MOUSE){
				return keyboard_check(global.keybinds[0]);
			}
			else {
				return mouse_check_button(global.keybinds[0]);
			}
		case ATTACK_TYPES.SKILL:
			if (global.keys != PRESET_KEYS.MOUSE){
				return keyboard_check(global.keybinds[1]);
			}
			else {
				return mouse_check_button(global.keybinds[1]);
			}
		case ATTACK_TYPES.ULT:
			return keyboard_check(global.keybinds[2]);
	}
	return 0;
}

function save_keybinds(){
	ini_open("prefs.ini");
	ini_write_real("keybinds", "skills", global.keys);
	ini_close();
}

function load_keybinds(){
	ini_open("prefs.ini");
	global.keys = ini_read_real("keybinds", "skills", PRESET_KEYS.SEQ);
	ini_close();
	change_keybinds(global.keys);
}