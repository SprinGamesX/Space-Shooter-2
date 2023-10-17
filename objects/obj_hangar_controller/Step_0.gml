if (index == 0){
	buttons[1].deactivate();
}
else buttons[1].activate();

if (index == options - 1){
	buttons[0].deactivate();
}
else buttons[0].activate();

if (instance_exists(parent_pop_up)){
	buttons[0].deactivate();
	buttons[1].deactivate();
}

obj_ship.update_index(index);




