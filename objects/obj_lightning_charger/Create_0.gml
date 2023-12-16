event_inherited();
image_speed = 0;
index = 0;
cd2 = 0;

animation = function(){
	if (cd2 != max_cd / 5) cd2 = max_cd /5;
	if (cd % cd2 == 0) and (index < 5) index++;
	image_index = index;
}
skill = function(){
	create_projectile_laser(obj_lightning_laser1, scaling, self, 10, seconds(0.05), 700, 6,,,,0);
	index = 0;
}