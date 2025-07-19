//Variable para manejar la posicion del personaje en el cambio de ROOM
player_start_position = noone;

// Bandera para que solo se muestre el primer textbox una vez cuando se entra en la segunda sala
global.visto_intro_cucei = false;

// Nueva bandera para que solo hable una vez el primer npc
global.hablo_con_npc_programador = false;

// Bandera para que no se tome la misma clase 2 veces
if (!variable_global_exists("visto_dialogo_clase")) {
    global.visto_dialogo_clase = false;
}


//Funcion para cambiar el tamaño de la gui
display_set_gui_size(480, 490);

global.textbox_font = font_add_sprite_ext(spr_textbox_font, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚabcdefghijklmnñopqrstuvwxyzáéíóú0123456789¡!¿?()\"'.,-/ü|", true, 0);


