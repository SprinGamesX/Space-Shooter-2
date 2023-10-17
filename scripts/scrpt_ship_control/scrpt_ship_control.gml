// Base stats
function ini_ship_stats(_id){
	switch(_id){
		case 0:
			with(obj_ship){
				ship_name = "I1";
				cds = [seconds(0.25), seconds(3), seconds(15)];
				scales = [0.1, 0.55, 1.52];
				element = ELEMENTS.ICE;
			}
			break;
		case 1:
			with(obj_ship){
				ship_name = "F1";
				cds = [seconds(0.5), seconds(15), seconds(60)];
				scales = [0.1, 0.3, 0.4];
				element = ELEMENTS.FIRE;
			}
			break;
		case 2:
			with(obj_ship){
				ship_name = "L1";
				cds = [seconds(0.2), seconds(5), seconds(40)];
				scales = [0.1, 0.2, 0.3];
				element = ELEMENTS.LIFE;
			}
			break;
		case 3:
			with(obj_ship){
				ship_name = "I2";
				cds = [seconds(0.5), seconds(10), seconds(30)];
				scales = [0.15, 0.5, 0.75];
				element = ELEMENTS.ICE;
			}
			break;
		case 4:
			with(obj_ship){
				ship_name = "V1";
				cds = [seconds(0.5), seconds(5), seconds(20)];
				scales = [0.1, 0.2, 0.2];
				element = ELEMENTS.VENOM;
			}
			break;
		case 5:
			with(obj_ship){
				ship_name = "F2";
				cds = [seconds(0.75), seconds(20), seconds(30)];
				scales = [0.5, 0.8, 0];
				element = ELEMENTS.FIRE;
			}
			break;
		case 6:
			with(obj_ship){
				ship_name = "L2";
				cds = [seconds(0.3), seconds(20), seconds(40)];
				scales = [0.2, 0.5, 0];
				element = ELEMENTS.LIFE;
			}
			break;
		case 7:
			with(obj_ship){
				ship_name = "Li1";
				cds = [seconds(0.3), seconds(30), seconds(60)];
				scales = [0.2, 0, 1];
				element = ELEMENTS.LIGHTNING;
			}
			break;
	}
	with(obj_ship){
		lvl = 1;
	}
	
}

function base_stats_on_element(_element){
	switch(_element){
		case ELEMENTS.ICE:
			with(obj_ship){
				atk = 55;
				hp = 80;
				spd = 2;
				critrate = 0.1;
				critdmg = 0.5;
			}
			break;
		case ELEMENTS.FIRE:
			with(obj_ship){
				atk = 50;
				hp = 90;
				spd = 2.5;
				critrate = 0.1;
				critdmg = 0.6;
			}
			break;
		case ELEMENTS.LIFE:
			with(obj_ship){
				atk = 40;
				hp = 100;
				spd = 2.5;
				critrate = 0.1;
				critdmg = 0.5;
			}
			break;
		case ELEMENTS.VENOM:
			with(obj_ship){
				atk = 60;
				hp = 90;
				spd = 2.5;
				critrate = 0.1;
				critdmg = 0.5;
				dot_scale = 0.05;
			}
			break;
		case ELEMENTS.LIGHTNING:
			with(obj_ship){
				atk = 50;
				hp = 80;
				spd = 3;
				critrate = 0.1;
				critdmg = 0.5;
			}
			break;
	}
}