// Posición inicial del jugador para cambios de room
player_start_position = noone;

// FUENTE PARA EL TEXTBOX
if (!variable_global_exists("textbox_font") || !font_exists(global.textbox_font)) {
    global.textbox_font = font_add_sprite_ext(
        spr_textbox_font,
        "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚabcdefghijklmnñopqrstuvwxyzáéíóú0123456789¡!¿?()\"'.,-/ü|",
        true, 0
    );
}

// AJUSTE DE GUI

display_set_gui_size(480, 490);


// INVENTARIO

// Macros e inicialización de inventario
initMacros();

// Lista de definiciones de ítems
global.items = array_create(8); // tenemos 8 ítems definidos por macro

// Lista del inventario (lista global)
global.inventory = ds_list_create();

// Inicializar ítems
initItem();


