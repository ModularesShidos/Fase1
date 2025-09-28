// script: inicializar_variables_juego
function inicializar_variables_juego() {
    // *******BANDERAS DE CONTROL DE HISTORIA*******
    global.dialogo_activo = false;
    global.textbox_visto = false;
	global.dialogo_id = 0;
    global.npc_1 = false;
    global.npc_2 = false;
    global.npc_3 = false;
    global.npc_4 = false;
    global.npc_5 = false;
    global.clase1_vista = false;
    global.clase2_vista = false;
    global.clase3_vista = false;
    global.clase4_vista = false;
    global.clase5_vista = false;
    global.dialogo_cerrado = true;
    global.mission_clear_aux = false;
    global.mision_terminada = 0;
    global.is_class = true;
    global.is_contra = false;
    global.pared_vista = false;
    global.fuentes_cont = 0;
    global.pared_dialogo_mostrado = false;
    global.textbox_cerrado_manualmente = false;

    // CONTROL DE MISIONES Y ESTADOS
    global.game_state = 0;
    global.class_state = 0;

    // OBJETOS Y COLECCIONABLES
    global.carta_recogida = false;
    global.funko_recogido = false;
    global.contacto_obtenido = true;
    global.contacto_profe_usado = false;
    
    // ID de partida se manejará por separado
    global.id_partida = 0; 
    
    show_debug_message("✔️ Variables de juego reseteadas para una nueva partida.");
	show_debug_message("✔️ Variables reseteadas. ID partida: " + string(global.id_partida));
}

//textbox_cerrado_manualmente