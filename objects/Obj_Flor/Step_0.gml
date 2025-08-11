// Recoger flor con tecla R
if (distance_to_object(Obj_Player_M) < 40 && keyboard_check_pressed(ord("F"))) {
    addItem(ITEM_FLOR, 1); // Agregar al inventario
    show_message("Has obtenido una Flor.");
    instance_destroy(); // Eliminar de la room
}
