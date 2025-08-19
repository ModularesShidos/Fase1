// Comienza oculta si no ha hablado con el NPC o no se cumplió condición
if (!global.visto_dialogo_clase) {
    visible = false;
    active = false;
} else {
    visible = true;
    active = true;
}

// Recoger flor con tecla F
if (distance_to_object(Obj_Player_M) < 40 && keyboard_check_pressed(ord("F"))) {
    addItem(ITEM_FLOR, 1); // Agregar al inventario
    show_message("Has encontrado la carta de tu compañero en apuros!!!.");
    instance_destroy(); // Eliminar de la room
}
