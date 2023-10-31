event_inherited();

friend = noone;

basic_attack = function(){
	create_projectile(obj_fireball2, atk_scale, 0, self, 5);
}

skill = function(){
	if (friend == noone){
		friend = create_follower(obj_fire_friend, -16, -32, skill_scale, 0, 0);
	}
	else friend.skill();
}

ultimate = function(){
	pause_all_enemys();
	if (friend != noone){
		friend.kill_spree = true;
	}
}

on_hit = function(_dmg){
	if (friend == noone)
		hp -= _dmg;
	else {
		hp -= _dmg / 4;
		friend.hp--;
		friend.add_charge(3);
	}
}

