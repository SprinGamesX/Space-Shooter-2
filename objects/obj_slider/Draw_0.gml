if (!draw_on_gui){
	draw_self();

	var knob_amount = amount_current / max_amount;
	var knob_pos_x = x + (sprite_width * knob_amount);

	draw_sprite(spr_slider_knob, 0, knob_pos_x, y);
}
