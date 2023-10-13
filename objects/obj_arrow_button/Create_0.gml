set_button = function(_parent, _positive){
	parent = _parent;
	positive = _positive;
	active = true;
}

activate = function(){
	active = true;
}
deactivate = function(){
	active = false;
}

click = function(){
	if (active){
		if (positive){
			parent.index ++;
		}
		else parent.index --;
	}
}