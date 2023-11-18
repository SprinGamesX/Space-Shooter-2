var enemylist = ds_list_create();
var n = collision_rectangle_list(0, 0, room_width, room_height, parent_enemy, 0, 0, enemylist, false);

for(var i = 0; i < n; i++){
	var _enemy = enemylist[|i];
	_enemy.on_hit(dmg / 3);
	switch(index){
		case 0:
			apply_status(_enemy, STATUS.DMG_AMP, 1, seconds(2), d_amp);
			break;
		case 1:
			apply_status(_enemy, STATUS.SLOW, 1, seconds(2), slow);
			break;
		case 2:
			apply_status(_enemy, STATUS.POISON_AMP, 1, seconds(2), v_amp);
			break;
		case 3:
			apply_status_elemental(_enemy, STATUS.POISON, 1, 5, true);
			break;
	}
}
switch(index){
	case 0: alarm[0] = seconds(0.1); index++; break;
	case 1: alarm[0] = seconds(0.1); index++; break;
	case 2: alarm[0] = seconds(0.1); index++; break;
	case 3: alarm[0] = cd; index = 0; hits--;
}
if (hits == 0) instance_destroy();

ds_list_destroy(enemylist);