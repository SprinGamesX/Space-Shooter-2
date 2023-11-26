event_inherited();
on_click = function(){
	show_debug_message("Clicked");
}

access = function(){
	accessable = true;
}

lock = function(){
	accessable = false;
}

on_select = function(){
	if (selected){
		y = og_y - 1;
	}
	else y = og_y;
}