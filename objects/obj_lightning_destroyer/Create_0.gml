event_inherited();
x = 0;
y = room_height/2;
shot = false;
image_alpha = 0;

animation = function(){
	// animate
}
skill = function(){
	create_projectile_laser(obj_lightning_laser1, source.ult_scale, self, 20, seconds(0.1), room_width, room_height/2);
}