event_inherited();
maxhp = hp;
max_atk_cd = atk_cd;
max_skill_cd = skill_cd;
max_ult_cd = ult_cd;
entrance_animation_ongoing = true;
is_dead = false;
immune = false;

// Health bar
hp_bar_height = 16;
hp_bar_width = 192;
hp_bar_offset = 4;
var bar_scale = 4;
hp_bar_width *= bar_scale;
hp_bar_height *= bar_scale;
hp_bar_offset *= bar_scale;

uni_freeze = shader_get_uniform(sh_frozen, "freeze");

basic_atk = function(){
	// write basic attack
}

skill = function(){
	// write skill
}

ult = function(){
	// write ultimate
}

special_movement = function(){
	// write special movement pattern if there is one
}

entrance_animation = function(){
	// write entrance script
}

death_animation = function(){
	// write death script
}

alarm[9] = seconds(1);