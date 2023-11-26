/// @description Insert description here
// You can write your code in this editor

image_angle = direction;

var _collision = instance_place(x, y, parent_ship)
if (_collision != noone){
	_collision.on_hit(dmg);
	instance_destroy(self);
	screenshake(seconds(0.5), 1, 0.25);
}
draw_echo(echo);
kill_outside_bounds();