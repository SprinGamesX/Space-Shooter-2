image_xscale = length;
image_yscale = height/6 + random_range(-0.2, 0.2);
image_alpha = alpha;
switch(element){
	case ELEMENTS.ICE: image_index = 0; break;
	case ELEMENTS.VENOM: image_index = 1; break;
	case ELEMENTS.LIGHTNING: image_index = 2; break;
}
draw_self();
var _s = 1 + random_range(-0.1, 0.1);
draw_sprite_ext(spr_elemental_laser_o, image_index, x, y, _s, _s, 0, c_white, alpha);