seek_closest_player(10);
draw_echo(echo);
image_angle = direction;

var _s = instance_place(x, y, parent_ship);
if (_s != noone){
	if (_s.hp + heal > _s.max_hp) _s.hp = _s.max_hp;
	else _s.hp += heal;
	create_dmg_indicator(x,y,"+" + string(heal),"HEALING", ELEMENTS.HEALING);
	instance_destroy();
}