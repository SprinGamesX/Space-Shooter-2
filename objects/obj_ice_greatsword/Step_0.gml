event_inherited();
image_angle = direction - 45;
draw_echo(echo);
draw_trail(trail);

seek_closest_elite();

if (alpha > 1) alpha += 0.1;