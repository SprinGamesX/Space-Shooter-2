enum TRAIL_LENGTH{
	SHORT,
	MID,
	LONG
}



function create_dmg_indicator(_x,_y,_dmg, _additional_text = "", _element = ELEMENTS.ICE){
	var _inst = instance_create_layer(_x, _y - 30,"SpecialEffects", obj_dmg_indicator);
	color = c_white;
	switch(_element){
		case ELEMENTS.ICE: color = c_aqua; break;
		case ELEMENTS.FIRE: color = c_orange; break;
		case ELEMENTS.LIFE: color = c_green; break;
		case ELEMENTS.VENOM: color = c_purple; break;
		case ELEMENTS.LIGHTNING: color = c_yellow; break;
		case ELEMENTS.HEALING: color = c_lime; 
	}
	_inst.set(_dmg, color, _additional_text);
}

function create_status_indicator(_x,_y,_text, _magnitude, _color = c_white){
	var _inst = instance_create_layer(_x, _y - 30,"SpecialEffects", obj_status_indicator);
	var txt = _text;
	if (_magnitude > 0){
		txt += " +" + string(_magnitude * 100) + "%";
	}
	_inst.set(txt, _color);
}

function make_echo(_length = ECHO.SHORT, _scale = 1, _sprite = sprite_index){
	var _part = part_type_create();
	part_type_sprite(_part, _sprite, 0, 0, 0);
	part_type_alpha2(_part, 0.25, 0);
	part_type_scale(_part, _scale, _scale);
	switch(_length){
		case ECHO.SHORT:
			part_type_life(_part, seconds(0.15), seconds(0.15));
			break;
		case ECHO.MID:
			part_type_life(_part, seconds(0.3), seconds(0.3));
			break;
		case ECHO.LONG:
			part_type_life(_part, seconds(0.5), seconds(0.5));
			break;
	}
	return _part;
}

function make_fragment(){
	var _part = part_type_create();
	part_type_sprite(_part, sprite_index, 0, 0, 0);
	part_type_alpha2(_part, 0.75, 0);
	part_type_life(_part, seconds(0.25), seconds(0.75));
	part_type_speed(_part, 0.5, 2, 0, 0);
	part_type_size(_part, 0.1, 0.2, -0.001, 0);
	part_type_direction(_part, 0, 360, 0, 0);
	return _part;
}

function make_star(){
	var _part = part_type_create();
	part_type_sprite(_part, spr_pixel, 0, 0, 0);
	part_type_alpha2(_part, 0.5, 0.5);
	part_type_life(_part, seconds(15), seconds(15));
	part_type_speed(_part, 2, 3, 0, 0);
	part_type_size(_part, 1, 1.2, 0, 0.01);
	part_type_direction(_part, 175, 185, 0, 0);
	return _part;
}
function draw_echo(_echo, _echo_system = global.echo_system){
	part_type_orientation(_echo, self.image_angle, self.image_angle, 0, 0, false);
	part_particles_create(_echo_system, x,y,_echo, 1)
}

function draw_fragments(_fragment, _intensity = FRAG_AMOUNT.SMALL){
	part_particles_create(global.trail_system, x, y, _fragment, _intensity);
}

function draw_ice_hit(){
	instance_create_layer(x,y,"SpecialEffects",obj_icehit);
}

function screen_flash(){
	if (!layer_exists("effects")) layer_create(-9999, "effects");
	layer_sequence_create("effects", 0, 0, seq_flash);
}

function c_rainbow(divider){
	randomize();
	var rainbow = make_color_hsv ((current_time / divider) mod 255,255,255);
	return rainbow;
}

function make_trail(_spd, _element){
	var _part = part_type_create();
	switch(_element){
		case ELEMENTS.FIRE:
			part_type_sprite(_part, spr_pixel, 0, 0, 0);
			part_type_alpha2(_part, 1, 0.1);
			part_type_life(_part, seconds(1), seconds(1));
			part_type_speed(_part, 0.5, 1, 0, 0);
			part_type_size(_part, 1, 1.2, -0.02, 0);
			part_type_color1(_part, color_for_element(_element));
		break;
		case ELEMENTS.LIFE:
			part_type_sprite(_part, spr_pixel, 0, 0, 0);
			part_type_alpha2(_part, 1, 0.1);
			part_type_life(_part, seconds(0.2), seconds(0.2));
			part_type_speed(_part, 0.2, 0.3, 0, 0);
			part_type_size(_part, 0.5, 0.7, -0.01, 0);
			part_type_color1(_part, color_for_element(_element));
			
		break;
	}
	return _part;
}


function draw_trail(_trail, _element = ELEMENTS.FIRE){
	if (_element == ELEMENTS.FIRE){
		part_type_direction(_trail, direction + 160, direction + 200, 0, 0);
		part_particles_create(global.trail_system, x + random_range(-2, 2), y + random_range(-2, 2), _trail, 1);
	}
	if (_element == ELEMENTS.LIFE){
		part_type_direction(_trail, direction + 175, direction + 185, 0, 0);
		part_particles_create(global.trail_system, x + random_range(-2, 2), y + random_range(-2, 2), _trail, 1);
	}
	
}
function draw_trail_random(_trail){
	part_type_direction(_trail, 0, 359, 0, 0);
	part_particles_create(global.trail_system, x, y, _trail, 1);
}

function draw_lightning_slash(_dir, _x, _y, _scale = 1){
	var _s = instance_create_layer(_x, _y, "Projectiles", obj_lightning_slash);
	_s.direction = _dir;
	_s.image_angle = _dir;
	_s.image_xscale = _scale;
	_s.image_yscale = _scale;
}

function make_trail_meteor(_length = TRAIL_LENGTH.SHORT, _scale = 1, _sprite = sprite_index){
	var _part = part_type_create();
	part_type_sprite(_part, _sprite, 0, 0, 0);
	part_type_alpha2(_part, 0.1, 0);
	part_type_size(_part, _scale, _scale, -0.05, 0);
	switch(_length){
		case TRAIL_LENGTH.SHORT:
			part_type_life(_part, seconds(0.3), seconds(0.3));
			break;
		case TRAIL_LENGTH.MID:
			part_type_life(_part, seconds(0.7), seconds(0.7));
			break;
		case TRAIL_LENGTH.LONG:
			part_type_life(_part, seconds(1), seconds(1));
			break;
	}
	return _part;
}

function draw_trail_meteor(_part, _echo_system = global.echo_system){
	part_type_orientation(_part, self.image_angle, self.image_angle, 0, 0, false);
	part_particles_create(_echo_system, x, y, _part, 1)
}

function make_charge_particle(_xx, _yy,_element, _dis){
	var _inst = instance_create_layer(0, 0, "ECHOS", obj_charge_particle);
	_inst.on_create(_xx, _yy,_element, _dis);
}