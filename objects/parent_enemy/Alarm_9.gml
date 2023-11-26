/// @description apply venom effect
alarm[9] = (seconds(0.5 - poison_amp / 4));
var _ship = instance_nearest(x,y,parent_ship);
if (poison > 0) and (_ship != noone) and (instance_exists(_ship)){	
	var _dmg = poison * parent_ship.atk * global.dot_scale;
	show_debug_message(string(poison) + " \ " + string(parent_ship.atk) + " \ " + string(global.dot_scale))
	_dmg += _dmg * poison_amp;
	
	if (chance(_ship.ex)) _dmg *= 3;
	hp -= _dmg;
	create_dmg_indicator(x, y, _dmg, "POISON", ELEMENTS.VENOM);
	poison--;
}


