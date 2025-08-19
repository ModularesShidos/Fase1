// Posición inicial del jugador para cambios de room
player_start_position = noone;

// *******BANDERAS DE CONTROL DE HISTORIA*******

// Controla si hay un diálogo activo en pantalla
if (!variable_global_exists("dialogo_activo")) {
    global.dialogo_activo = false;
}

// Para solo mostrar los textbox una vez
global.textbox_visto = false;

// Para que cuando hable con el NPC solo salga el mensaje principal 1 vez
// las siguientes se usara un mensaje distinto
global.npc_1 = false;

// Para que solo se muestre el primer diálogo de clase una vez
if (!variable_global_exists("visto_dialogo_clase")) {
    global.visto_dialogo_clase = false;
}

// Marca si la clase fue completada (para mostrar al NPC luego)
if (!variable_global_exists("clase_completada")) {
    global.clase_completada = false;
}

// Número de diálogo actual (0 = ninguno)
if (!variable_global_exists("dialogo_id")) {
    global.dialogo_id = 0;
}

// FUENTE PARA EL TEXTBOX
global.textbox_font = font_add_sprite_ext(
    spr_textbox_font,
    "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚabcdefghijklmnñopqrstuvwxyzáéíóú0123456789¡!¿?()\"'.,-/ü|",
    true, 0
);

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


// BANDERAS PARA SEGUIMIENTO DE MISIONES

global.mision_1 = false;

global.mission_2 = false;