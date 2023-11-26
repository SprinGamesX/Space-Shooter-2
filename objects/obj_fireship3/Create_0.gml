event_inherited();

friend = noone;

basic_attack = function(){
	var i = choose(1, 2);
	switch(i){
		case 1:
			create_projectile(obj_fireball2, atk_scale, 0, self, 5);
		break;
		case 2:
			var _obj = (choose(obj_fire_wiggle_missile, obj_fire_wiggle_missile2))
			create_projectile(_obj, atk_scale, 0, self, 5,,,3);
		break;
	}
}

skill = function(){
	if (friend == noone){
		friend = create_follower(obj_fire_friend, -16, -32, skill_scale, 0, 0);
	}
	else friend.skill();
}

ultimate = function(){
	if (friend != noone){
		friend.kill_spree = true;
		pause_all_enemys();
	}
	else {
		create_projectile(obj_fire_missile, skill_scale, 0, self, 6,,,10,,3);
	}
}

on_hit = function(_dmg){
	if (!immune){
		if (friend == noone)
				hp -= _dmg;
		else {
			hp -= _dmg / 2;
			friend.hp--;
			friend.add_charge(3);
		}
	}
}

