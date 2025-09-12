// Solo si no se ha visto antes
if (!global.clase3_vista) {
	global.clase3_vista = true;
	global.dialogo_id = 6;
	show_debug_message("CLASE VISTAAAAA = " + string(global.clase3_vista));
    instance_create_layer(0, 0, "UI", obj_fade_black);
}

