event_inherited();
fragment = make_fragment();
scale = 0;
echo = make_echo(, scale);
timer = seconds(20);
max_timer = timer;
image_xscale = 1.5;
image_yscale = 1.5;


explode = function(){
	for (var i = 0; i < 360; i+= 45)
		summon_enemy_bladie(x, y, dmg, 0.1, false, 0, i);
	instance_destroy();
}