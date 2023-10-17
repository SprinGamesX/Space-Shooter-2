/// @description apply venom effect
alarm[9] = seconds(0.5);

if (poison > 0){	
	var _dmg = poison * parent_ship.atk * parent_ship.dot_scale;
	var _ship = instance_nearest(x,y,parent_ship);
	if (chance(_ship.ex)) _dmg *= 3;
	hp -= _dmg;
	create_dmg_indicator(x, y, _dmg, false, ELEMENTS.VENOM);
	poison--;
}


