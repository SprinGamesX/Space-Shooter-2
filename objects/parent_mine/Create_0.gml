attach = function(){
	if (instance_exists(target)){
		x = target.x;
		y = target.y;
	}
}

detonate = function(){
	create_aoe(self, aoe);
	instance_destroy();
}