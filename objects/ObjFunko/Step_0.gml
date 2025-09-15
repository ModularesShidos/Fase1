// Comienza oculta si no ha hablado con el NPC o no se cumplió condición
if (!global.clase3_vista) {
    visible = false;
    active = false;
} else {
    visible = true;
    active = true;
}

// Recoger flor con tecla F
if (distance_to_object(Obj_Player_M) < 40 && keyboard_check_pressed(ord("F"))) {
    addItem(ITEM_FUNKO, 1); // Agregar al inventario
    show_message("Has encontrado el increible Funko de Pikachu!!!.");
	global.funko_recogido = true;
    instance_destroy(); // Eliminar de la room
}
