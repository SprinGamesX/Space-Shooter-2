follow();
animation();

if (frenzy){
	draw_trail_random(trail);
}

if (cd <= 0){
	skill();
	if (frenzy) cd = random_range(seconds(0.1), seconds(0.4));
	else cd = max_cd;
}

else { cd--; }
