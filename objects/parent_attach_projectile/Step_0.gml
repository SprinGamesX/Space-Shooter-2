image_angle = direction;
if (alpha < 1) and (!fade) alpha += 0.05;
if (fade) {
	alpha -= 0.05;
	if (alpha == 0) instance_destroy();
}
else follow();