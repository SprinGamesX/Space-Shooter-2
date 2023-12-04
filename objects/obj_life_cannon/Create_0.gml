event_inherited();

frenzy = false;
trail = make_trail(1, ELEMENTS.LIFE);

animation = function(){
	// animate
}
skill = function(){
	create_projectile(obj_lifeball, scaling, 0, source, 6,,,1.5);
}

enter_frenzy = function(){
	frenzy = true;
	alarm[0] = seconds(5);
}