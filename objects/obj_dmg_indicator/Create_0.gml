alpha = 1;
spd = 0.5;
color = c_white;
crit = false;
text = "";
randomize();
xspeed = random_range(-(spd / 2), spd / 2);

set = function(_dmg ,_color = c_white, _crit = false){
	color = _color;
	if (_crit)
		text = string(_dmg) + "\n" + "Crit";
	else text = string(_dmg);
}
