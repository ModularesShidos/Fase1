if (global.game_state == 2) {
	global.dialogo_id = 9;
	global.is_contra = true;
	global.pared_vista = true;
    instance_create_layer(0, 0, "UI", obj_text_box_nube);
}
