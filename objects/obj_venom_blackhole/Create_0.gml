cd = seconds(1.5);
dmg = calculate_dmg(parent_ship.atk, 0.25, 0.5, parent_ship.ult_scale);
v_amp = 0.75;
d_amp = 0.25;
slow = 0.5;
index = 0;
hits = 6;

alarm[0] = cd;

// particles
part_sys = part_system_create();
part_system_layer(part_sys, layer_get_id("Echos"));
part = part_type_create();
part_type_sprite(part, spr_pixel, 0, 0, 0);
part_type_color2(part, c_black, c_purple);
part_type_life(part, seconds(2), seconds(2));
part_type_speed(part, 3, 3.25, 0, 0);
part_type_alpha3(part,1, 0.9, 0);
part_type_size(part, 1.5, 2, 0, 0);