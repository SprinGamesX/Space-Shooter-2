if (display_time){
	var d_time = time_to_seconds(time);
	var _seconds = floor(d_time % 60);
	var _minutes =  floor(d_time / 60);
	var _text = "[scale,2]" + string(_minutes) + ":";
	if (_seconds < 10) _text += "0" + string(_seconds);
	else _text += string(_seconds);
	draw_set(fnt_boss_hb, fa_center, fa_middle, c_red);
	if (d_time > 10)
		draw_text_scribble(1920 / 2, 200, _text);
	else 
		draw_text_scribble(1920 / 2, 200, "[shake]" + _text);
}
draw_set(fnt_boss, fa_left, fa_top, c_white);
draw_text_scribble(24, 24, "[scale, 0.75]Total DMG: " + string(round(global.overalldmg)) + 
							"\nHighest DPH: " + string(round(global.highest_hit)) +
							"\nDPS: " + string(dps));