function guardarGustoClase(clase_id, gusto) {
    switch (clase_id) {
        case 0: global.clase1_gusta = gusto; break;
        case 1: global.clase2_gusta = gusto; break;
        case 2: global.clase3_gusta = gusto; break;
        case 3: global.clase4_gusta = gusto; break;
        case 4: global.clase5_gusta = gusto; break;
    }
    show_debug_message("Clase " + string(clase_id) + " - Gustó: " + string(gusto));
	
	global.clases_que_gustaron = 0;

    if (global.clase1_gusta == true) global.clases_que_gustaron += 1;
    if (global.clase2_gusta == true) global.clases_que_gustaron += 1;
    if (global.clase3_gusta == true) global.clases_que_gustaron += 1;
    if (global.clase4_gusta == true) global.clases_que_gustaron += 1;
    if (global.clase5_gusta == true) global.clases_que_gustaron += 1;
}