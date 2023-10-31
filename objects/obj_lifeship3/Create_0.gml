event_inherited();
turret_list = ds_list_create();
shots = 3;

basic_attack = function(){
	shots = 3;
	alarm[0] = 1;
}

skill = function(){
	if (consume_hp((max_hp / 100) * 15)){
		var dis = 32;
		randomize();
		var dir = random_range(90, 270);
		var _x = lengthdir_x(dis, dir);
		var _y = lengthdir_y(dis, dir);
		var _inst = create_follower(obj_life_cannon, _x, _y, skill_scale, seconds(1), 0);
		ds_list_add(turret_list, _inst);
	}
}

ultimate = function(){
	if (ds_list_size(turret_list) > 0){
		for (var i = 0; i < ds_list_size(turret_list); i++){
			turret_list[|i].enter_frenzy();
		}
		pause_all_enemys();
	}
}

death = function(){
	hp = 0;
	if (ds_list_size(turret_list) > 0){
		for (var i = 0; i < ds_list_size(turret_list); i++){
			instance_destroy(turret_list[|i]);
			hp += max_hp / 10; // heals 10% of HP
		}
		ds_list_clear(turret_list);
	}
	else{
		instance_destroy();
		draw_fragments(frg, FRAG_AMOUNT.BIG);
	}
}

on_hit = function(_dmg){
	hp -= _dmg;
}