draw_self();
var _size = 0;
if (charge > 0){
	rot++;
	// max charge
	if (charge >= 300) _size = 3;
	else if (charge >= 200) _size = 2;
	else if (charge >= 100) _size = 1;
	draw_sprite_ext(spr_lightning_charge, _size, x + 12, y, 1, 1, rot, c_white, 1);
}
else rot =0;

// debug
//draw_set(fnt_coins);
//draw_text_scribble(x, y - 30, string(charge));