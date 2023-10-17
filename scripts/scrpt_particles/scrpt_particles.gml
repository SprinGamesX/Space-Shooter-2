function create_dmg_indicator(_x,_y,_dmg, _crit = false, _element = ELEMENTS.ICE){
	var _inst = instance_create_layer(_x, _y - 30,"SpecialEffects", obj_dmg_indicator);
	color = c_white;
	switch(_element){
		case ELEMENTS.ICE: color = c_aqua; break;
		case ELEMENTS.FIRE: color = c_orange; break;
		case ELEMENTS.LIFE: color = c_green; break;
		case ELEMENTS.VENOM: color = c_purple; break;
		case ELEMENTS.HEALING: color = c_lime; 
	}
	_inst.set(_dmg, color, _crit);
}

function make_echo(_length = ECHO.SHORT, _scale = 1){
	var _part = part_type_create();
	part_type_sprite(_part, sprite_index, 0, 0, 0);
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
function draw_echo(_echo){
	part_type_orientation(_echo, self.image_angle, self.image_angle, 0, 0, false);
	part_particles_create(global.echo_system, x,y,_echo, 1)
}

function draw_fragments(_fragment, _intensity = FRAG_AMOUNT.SMALL){
	part_particles_create(global.part_system, x, y, _fragment, _intensity);
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