switch(ult_hits){
	case 5:
		draw_lightning_slash(45, target.x, target.y, 2);
		create_projectile(obj_lightning_rod2, ult_scale / 10, 0, self, 0, target.x, target.y,,2);
		alarm[1] = seconds(0.1);
		ult_hits--;
		screenshake(seconds(0.25), 0.5, 3);
		break;
	case 4:
		draw_lightning_slash(135, target.x, target.y, 2);
		create_projectile(obj_lightning_rod2, ult_scale / 10, 0, self, 0, target.x, target.y,,0);
		alarm[1] = seconds(0.1);
		ult_hits--;
		screenshake(seconds(0.25), 0.5, 3);
		break;
	
	case 3:
		draw_lightning_slash(0, target.x, target.y, 2);
		create_projectile(obj_lightning_rod2, ult_scale / 5, 0, self, 0, target.x, target.y,,0);
		alarm[1] = seconds(0.5);
		ult_hits--;
		screenshake(seconds(0.25), 0.5, 3);
		break;
	case 2:
		draw_lightning_slash(45, target.x, target.y, 3);
		draw_lightning_slash(135, target.x, target.y, 3);
		create_projectile(obj_lightning_rod2, ult_scale / 3.33, 0, self, 0, target.x, target.y,,0);
		alarm[1] = seconds(0.2);
		ult_hits--;
		screenshake(seconds(0.25), 0.5, 3);
		break;
	case 1:
		draw_lightning_slash(0, target.x, target.y, 3);
		draw_lightning_slash(90, target.x, target.y, 3);
		create_projectile(obj_lightning_rod2, ult_scale / 3.33, 0, self, 0, target.x, target.y,,0);
		ult_hits--;
		alarm[1] = seconds(0.2);
		screenshake(seconds(0.5), 0.5, 3);
		break;
	case 0:
		resume_all_enemys();
		ult_hits = 5;
		ult_ongoing = false;
		break;
}