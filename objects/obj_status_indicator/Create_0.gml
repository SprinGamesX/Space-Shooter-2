alpha = 1;
spd = 0.5;
color = c_white;
text = "";
randomize();
xspeed = random_range(-(spd / 2), spd / 2);

set = function(_dmg ,_color = c_white){
	color = _color;
	if (is_string(_dmg)) text = _dmg;
	else{
		text = string(round(_dmg));
	}
}
