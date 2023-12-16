/// @description Collision
var _collision = instance_place(x, y, parent_ship)
if (_collision == noone) _collision = instance_place(x, y, parent_deployable); 
if (_collision != noone){
	_collision.on_hit(dmg);
	instance_destroy(self);
	if (object_is_ancestor(_collision.object_index, parent_ship))
		screenshake(seconds(0.5), 1, 0.25);
}

if (instance_place(x, y, obj_lightning_laser1)){
	instance_destroy();
}






