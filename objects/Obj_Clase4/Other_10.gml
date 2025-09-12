// Solo si no se ha visto antes
if (!global.clase4_vista) {
	global.clase4_vista = true;
	global.dialogo_id = 10;
	show_debug_message("CLASE VISTAAAAA = " + string(global.clase4_vista));															
    instance_create_layer(0, 0, "UI", obj_fade_black);
}
