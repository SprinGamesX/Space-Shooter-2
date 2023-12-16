alpha = 1;
spd = 0.5;
color = c_white;
crit = false;
text = "";
randomize();
xspeed = random_range(-(spd / 2), spd / 2);

set = function(_dmg ,_color = c_white, _additional_text = ""){
	color = _color;
	if (is_string(_dmg)) text = _dmg + "\n" + string(_additional_text);
	else{
		text = string(round(_dmg)) + "\n" + _additional_text;
	}
}
