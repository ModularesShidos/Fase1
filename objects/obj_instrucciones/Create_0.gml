mensaje = 
"   W  - Subir\n" +
"   A  - Izquierda\n" +
"   S  - Bajar\n" +
"   D  - Derecha\n" +
"   E  - Interactuar\n" +
"   F  - Recoger objeto" +
"   TAB - Abrir mini mapa";

if (!variable_global_exists("mostrar_controles_visto")) {
    global.mostrar_controles_visto = false;
}

if (!global.mostrar_controles_visto) {
    global.mostrar_controles = true;
    // 5 segundos a 60 fps → 5 * room_speed
    mostrar_tiempo = room_speed * 8;
} else {
    global.mostrar_controles = false;
}
