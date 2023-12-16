event_inherited();
dir = 45;
index = 1;

follow = function(){
	
	if (index == -1) and (sprite_index != spr_lightning_wand2) sprite_index = spr_lightning_wand2;
	
	if (instance_exists(source)){
		target = source;
	}
	var _x = target.x + lengthdir_x(dis_x, dir * index);
	var _y = target.y + lengthdir_y(dis_x, dir * index);
	var correction = 5;
	
	var error_x = abs(x - _x) / 10;
	if (x > _x) x -= correction * sqrt(error_x);
	if (x < _x) x += correction * sqrt(error_x);
	// y axis
	var error_y = abs(y - _y) / 10;
	if (y > _y) y -= correction * sqrt(error_y);
	if (y < _y) y += correction * sqrt(error_y);
	
}

animation = function(){
	// animate
}
skill = function(){
	create_projectile(obj_lightning_ball, scaling, direction, source, 6);
	x -= 4;
}

laser = function(_charge){
	create_projectile_laser(obj_lightning_laser1, (source.skill_scale * (_charge / (source.max_skill_cd/50))) / 2, self, _charge / seconds(0.5), seconds(0.25), 700, 6, x+6, y-6);
}