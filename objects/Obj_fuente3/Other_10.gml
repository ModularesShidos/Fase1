// En Step del NPC
if (distance_to_object(Obj_Player_M) < 40 && keyboard_check_pressed(ord("E")) && !interactuado) {
    global.fuentes_cont += 1; // Solo una vez
    interactuado = true;                // Marca que ya fue usado
	instance_create_layer(0, 0, "UI", obj_text_box_nube);
    
    if (global.fuentes_cont == 3) {
        global.class_state = 5; // poner la bandera adecuada
        instance_create_layer(0, 0, "UI", obj_text_box_nube);
    }
}
