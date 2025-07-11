//Variable para manejar la posicion del personaje en el cambio de ROOM
player_start_position = noone;


//Funcion para cambiar el tamaño de la gui
display_set_gui_size(480, 490);

global.textbox_font = font_add_sprite_ext(spr_textbox_font, "ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyzáéíóú0123456789¡!¿?()\"'.,-/ü|", true, 0);


instance_create_layer(0, 0, "UI", obj_text_box);