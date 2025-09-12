if (global.game_state = 1) {
	global.game_state = 2;
	global.is_class = false;
	global.dialogo_id = 6;
    instance_create_layer(0, 0, "UI", obj_fade_black);
}
