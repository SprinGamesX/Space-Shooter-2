enum ECHO{
	SHORT,
	MID,
	LONG
}

enum FRAG_AMOUNT{
	SMALL = 5,
	MID = 10,
	BIG = 25,
	MASSIVE = 100
}
global.overalldmg = 0;
global.part_system = part_system_create();
global.echo_system = part_system_create();
part_system_layer(global.echo_system, layer_get_id("Echos"));

if !layer_exists("particles") layer_create(450, "particles")
part_system_layer(global.part_system, layer_get_id("particles"));
global.screen_width = 1920;
global.screen_height = 1080;
