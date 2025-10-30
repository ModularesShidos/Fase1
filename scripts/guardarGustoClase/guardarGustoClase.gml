function guardarGustoClase(clase_id, gusto) {
    switch (clase_id) {
        case 0: global.clase1_gusta = gusto; break;
        case 1: global.clase2_gusta = gusto; break;
        case 2: global.clase3_gusta = gusto; break;
        case 3: global.clase4_gusta = gusto; break;
        case 4: global.clase5_gusta = gusto; break;
    }
    show_debug_message("Clase " + string(clase_id + 1) + " - Gustó: " + string(gusto));
}