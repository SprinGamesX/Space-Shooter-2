event_inherited();
draw_sprite_ext(sprite_index, 2, x, y, layer3_scale, layer3_scale, layer3rot, c_white, 1);
draw_sprite_ext(sprite_index, 1, x, y, layer2_scale, layer2_scale, layer2rot, c_white, 1);
draw_sprite_ext(sprite_index, 0, x, y, layer1_scale, layer1_scale, layer1rot, c_white, 1);


shader_reset();