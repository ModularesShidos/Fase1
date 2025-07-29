// 📌 Posición inicial del jugador para cambios de room
player_start_position = noone;

// ✅ BANDERAS DE CONTROL DE HISTORIA

// Muestra la intro de CUCEI solo una vez
global.visto_intro_cucei = false;

// El jugador solo puede hablar una vez con el NPC programador
global.hablo_con_npc_programador = false;

// Bandera para que solo se muestre el primer diálogo de clase una vez
if (!variable_global_exists("visto_dialogo_clase")) {
    global.visto_dialogo_clase = false;
}

// ✅ NUEVA BANDERA: controla si hay un diálogo activo en pantalla
if (!variable_global_exists("dialogo_activo")) {
    global.dialogo_activo = false;
}

// ✅ NUEVA BANDERA: marca si la clase fue completada (para mostrar al NPC luego)
if (!variable_global_exists("clase_completada")) {
    global.clase_completada = false;
}

// ✅ FUENTE PARA EL TEXTBOX
global.textbox_font = font_add_sprite_ext(
    spr_textbox_font,
    "ABCDEFGHIJKLMNÑOPQRSTUVWXYZÁÉÍÓÚabcdefghijklmnñopqrstuvwxyzáéíóú0123456789¡!¿?()\"'.,-/ü|",
    true, 0
);

// ✅ AJUSTE DE GUI
display_set_gui_size(480, 490);
