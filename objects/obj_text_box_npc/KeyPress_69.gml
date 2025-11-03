// obj_text_box_npc - Key Press: E
if (keyboard_check_pressed(ord("E"))) {
    // Destruye este textbox: el evento Destroy se encargará de liberar flags
    instance_destroy();
}
