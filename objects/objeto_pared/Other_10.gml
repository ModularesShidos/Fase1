if (global.game_state == 2 && !global.pared_dialogo_mostrado) {
	global.dialogo_id = 9;
	global.is_contra = true;
	global.pared_vista = true;
	global.class_state = 2;
    instance_create_layer(0, 0, "UI", obj_text_box_nube);
	global.pared_dialogo_mostrado = true;
}
