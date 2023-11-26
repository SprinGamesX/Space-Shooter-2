event_inherited();
og_y = y;
selected = false;

on_select = function(){
	if (selected){
		y = og_y - 4;
	}
	else y = og_y;
}