// Posición inicial del jugador para cambios de room
player_start_position = noone;


// Marca si la clase fue completada (para mostrar al NPC luego)
if (!variable_global_exists("clase_completada")) {
    global.clase_completada = false;
}

// Número de diálogo actual (0 = ninguno)
if (!variable_global_exists("dialogo_id")) {
    global.dialogo_id = 0;
}

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
global.npc_2 = false;
global.npc_3 = false;
global.npc_4 = false;
global.npc_5 = false;


// Estas para que solo se pueda ver la clase 1 vez 
global.clase1_vista = false;
global.clase2_vista = false;
global.clase3_vista = false;
global.clase4_vista = false;
global.clase5_vista = false;

// Dialogo

global.dialogo_cerrado = true;

// Auxiliar mission_clear, para cuando es el final de la clase 2 cuando sale el obj_text_box_nube
global.mission_clear_aux = false;

// Dialogo cerrado para los npc
global.dialogo_cerrado = true;

// Mision terminada 
global.mision_terminada = 0;

// Para cuando se quiera activar el dialogo de olia feo 
global.is_class = true;

// Esta es para seleccionar en la mision 3 el texto de la nube al encontrar la contrasena
global.is_contra = false;
// Ahora este sera para que al activar la pared el npc pueda escojer el dialogo 9 del textbox general
global.pared_vista = false;

// Contador de fuentes
global.fuentes_cont = 0;

// CONTROL DE MISIONES

// en obj_system (Create)
if (!variable_global_exists("game_state")) {
    global.game_state = 0; 
}

if (!variable_global_exists("class_state")) {
    global.class_state = 0; 
}

// Para objeto carta 
global.carta_recogida = false;

// Para objeto Funko
global.funko_recogido = false;

// Para solucionar bug del dialogo de la pared 
global.pared_dialogo_mostrado = false;

// Para la batalla final
global.contacto_profe_usado = false;