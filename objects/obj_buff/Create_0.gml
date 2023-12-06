/// @description Insert description here
// You can write your code in this editor

setup = function(_type, _dur, _mag){
	type = _type;
	duration = _dur;
	magnitude = _mag;
	if (instance_exists(obj_team_manager)){
		obj_team_manager.add_buff(self);
	}
}






