enum ELEMENTS{
	
	ICE,
	FIRE,
	LIFE,
	VENOM,
	LIGHTNING,
	HEALING
	
}
hit_list = -1;
if (pierce > 0){
	hit_list = ds_list_create();
}
echo = make_echo();
trail = make_trail(speed, element);

on_hit = function(_enemy){
	// What happens when projectile hits enemy
}