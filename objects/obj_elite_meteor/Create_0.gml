/// @description Insert description here
event_inherited();
randomize();
scale = 2;
image_xscale = scale;
image_yscale = scale;
trail = make_trail_meteor(TRAIL_LENGTH.LONG, scale);
rot = 0;
angle = 0;

// entrance
base_x = room_width - 120;
base_y = room_height / 2;
entrance_dir = 330;
x = base_x - lengthdir_x(500, entrance_dir);
y = base_y - lengthdir_y(500, entrance_dir);
ult_cd = seconds(5);
frag = make_fragment();

// movement
radius = 0;
radius_max = 64;
spd = 2;
bounces = 4;

// ability
charge_mode = false;
charging = seconds(2);
charge_speed = 5;

// ult
ult_mode = false;
ult_bounces = 5;
ult_speed = 10;
ult_preparing = false;
ult_ending = false;


reset_to_base = function(){
	x = base_x - lengthdir_x(500, entrance_dir);
	y = base_y - lengthdir_y(500, entrance_dir);
	charge_mode = false;
	speed = 0;
	entrance_animation_ongoing = true;
	bounces = 4;
	spd = 2;
	radius = 0;
	charging = seconds(2);
}


basic_atk = function(){
	summon_enemy(obj_enemy_meteor, lv, random_range(room_width / 2, room_width - 1), random_range(1, 16), 230, 4);
}

skill = function(){
	if (!ult_mode)	{
		charge_mode = true;
	}
	else skill_cd = seconds(1);
}

ult = function(){
	if (!charge_mode){
		ult_mode = true;
		ult_preparing = true;
		ult_bounces = 5;
		ult_ending = false;
	}
	else ult_cd = seconds(1);
}

special_movement = function(){
	// write special movement pattern if there is one
	if (charge_mode){
		if (charging) {
			charging--;
			angle-=spd;
			spd+= 0.1;
			direction = irandom_range(135, 225);
		}
		else{
			speed = charge_speed;
			var b = bounces;
			bounces = bounce_on_edge(direction, bounces);
			if (b != bounces) screenshake(seconds(0.5), 0.5, 0.05);
			if (bounces <= 0){
				reset_to_base();
				screen_flash();
				charge_speed++;
			}
			summon_enemy_fire(x + random_range(-16, 16), y + random_range(-16, 16), dmg, random_range(direction - 190, direction - 170), 5);
		}
		
	}
	else if (ult_mode){
		
		if (ult_preparing){
			if (radius < radius_max) radius += 1;
			rot+=spd;
			angle-= spd;
			x = base_x + lengthdir_x(radius, rot);
			y = base_y + lengthdir_y(radius, rot);
			if (round(x) == base_x){
				ult_preparing = false;
				direction = 90;
				
			}
			
		}
		else {
			speed = ult_speed;
			var _b = ult_bounces;
			ult_bounces = bounce_on_edge(direction, ult_bounces);
			if (_b != ult_bounces){
				screenshake(seconds(0.5), 1, 0.1);
				show_debug_message(ult_bounces);
				for (var i = 0; i < 360; i += 15){
					var yy = 0;
					if (y > room_height / 2) yy = room_height;
					summon_enemy_fire(x, yy, dmg, i, 4);
				}
			}
			if (ult_bounces <= 0) and (!ult_ending) {
				ult_ending = true;
			}
			if (ult_ending){
				speed -= 0.01;
				scale -= 0.02;
				
				if (scale == 0){
					ult_mode = false;
					radius = 0;
					x = base_x;
					y = base_y;
					speed = 0;
					scale = 2;
					screen_flash();
				}
			}
			
		}
	}
	else {
		if (radius < radius_max) radius += 1;
		rot+=spd;
		angle-= spd;
		x = base_x + lengthdir_x(radius, rot);
		y = base_y + lengthdir_y(radius, rot);
	}
	image_angle = angle;
	
	image_xscale = scale;
	image_yscale = scale;
	trail = make_trail_meteor(TRAIL_LENGTH.LONG, scale);
	draw_trail_meteor(trail);
		
}

entrance_animation = function(){
	// write entrance script
	speed = 4;
	angle-=spd;
	direction = entrance_dir;
	draw_trail_meteor(trail);
	if (round(x) == base_x) and (round(y) == base_y){
		entrance_animation_ongoing = false;
		screen_flash();
		screenshake(seconds(1), 1, 0.05);
		speed = 0;
		for (var i = 0; i < 360; i += 5)
			summon_enemy(obj_enemy_small, lv, x, y, i, 4);
	}
	angle = rot;
	image_angle = angle;
}

death_animation = function(){
	if (!ult_mode) and (!charge_mode){
		rot+=spd;
		angle-= spd;
		x = base_x + lengthdir_x(radius, rot);
		y = base_y + lengthdir_y(radius, rot);
		radius--;
		spd+= 0.2;
		if (scale > 0)
			scale -= 0.02;
		image_xscale = scale;
		image_yscale = scale;
		trail = make_trail_meteor(TRAIL_LENGTH.LONG, scale);
		draw_trail_meteor(trail);
		if (scale <= 0){
			instance_destroy();
			draw_fragments(frag, FRAG_AMOUNT.MASSIVE);
		}
	}
	
}



