/// @description apply venom effect
alarm[9] = seconds(0.5);

if (poison > 0){	
	var _dmg = poison * parent_ship.atk * parent_ship.dot_scale;
	hp -= _dmg;
	create_dmg_indicator(x, y, _dmg, false, ELEMENTS.VENOM);
	poison--;
}


