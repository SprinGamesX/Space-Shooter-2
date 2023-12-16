if (inactive) image_alpha = 0.5;
else image_alpha = 1;

draw_self();
draw_sprite_ext(object_get_sprite(global.ships[?ship_index]), 0, x + (spr_width/2) , y + (spr_height/2) , 1, 1, 0, c_white, image_alpha);