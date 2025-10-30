if (!respuesta_recibida) {
    if (keyboard_check_pressed(ord("S"))) { // SÍ
        guardarGustoClase(clase_actual, true);
        respuesta_recibida = true;
        instance_create_layer(0, 0, "UI", obj_respuesta_rapida);
		 instance_destroy();
    }
    if (keyboard_check_pressed(ord("N"))) { // NO
        guardarGustoClase(clase_actual, false);
        respuesta_recibida = true;
        instance_create_layer(0, 0, "UI", obj_respuesta_rapida);
		 instance_destroy();
    }
}