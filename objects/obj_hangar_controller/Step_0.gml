if (index == 0){
	buttons[1].deactivate();
}
else buttons[1].activate();

if (index == options - 1){
	buttons[0].deactivate();
}
else buttons[0].activate();

obj_ship.update_index(index);




