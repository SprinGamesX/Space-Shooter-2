
if (draw_on_gui){
	image_xscale = 3;
	image_yscale = 3;
	draw_self();

	var knob_amount = amount_current / max_amount;
	var knob_pos_x = x + (sprite_width * knob_amount);

	draw_sprite_ext(spr_slider_knob, 0, knob_pos_x, y, 3, 3, 0, c_white, 1);
}