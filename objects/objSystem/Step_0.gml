// Step de obj_system
if (keyboard_check_pressed(ord("Q")) && !global.dialogo_activo) {
    // Solo crear si no fue cerrado manualmente
	if (variable_global_exists("textbox_cerrado_manualmente")) {
	    if (!global.textbox_cerrado_manualmente && !instance_exists(obj_text_box_ayuda)) {
	        instance_create_layer(0, 0, "UI", obj_text_box_ayuda);
	        global.dialogo_activo = true;
	        global.textbox_cerrado_manualmente = false;
	        show_debug_message("✅ Textbox ayuda creado");
	    } else {
	        global.textbox_cerrado_manualmente = false;
	        show_debug_message("❌ Textbox no creado (fue cerrado manualmente)");
	    }
	} else {
		global.textbox_cerrado_manualmente = true;
	}	

}