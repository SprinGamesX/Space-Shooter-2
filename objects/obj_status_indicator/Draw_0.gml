draw_set_font(fnt_dmg_indicator);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed_color(x,y,text, 0.7, 1, 0, color,color,color,color,alpha);

if (alpha == 0){ 
	instance_destroy(self) 
	}
else alpha -= 0.01;
