// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_for_highest_hit(_dmg){
	global.highest_hit = max(_dmg, global.highest_hit);
}