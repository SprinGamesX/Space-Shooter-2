maxhp = hp;
ds_list_add(global.enemylist, self);


hp_bar_width = 24;
hp_bar_height = 2;

uni_freeze = shader_get_uniform(sh_frozen, "freeze");

alarm[9] = seconds(1);

on_hit = function(_dmg){
	hp -= (_dmg * (1 + dmg_amp)) - (_dmg * def);
}