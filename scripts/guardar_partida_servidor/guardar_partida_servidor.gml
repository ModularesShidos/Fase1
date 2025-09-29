function guardar_partida_servidor() {
    var id_partida = global.id_partida; 
    // Incluir el id_partida en la URL
    var url = "http://localhost:3000/api/partida/guardar";

    var datos = {
        // PROGRESO PRINCIPAL
        id_partida: id_partida,
		
		progreso: {
            game_state: global.game_state,
			dialogo_activo: global.dialogo_activo ? 1 : 0,
			dialogo_cerrado: global.dialogo_cerrado ? 1 : 0,
            class_state: global.class_state,
            mision_terminada: global.mision_terminada,
            fuentes_cont: global.fuentes_cont,
            dialogo_id: global.dialogo_id,
            textbox_visto: global.textbox_visto ? 1 : 0,
            is_class: global.is_class ? 1 : 0,
			pared_vista: global.pared_vista ? 1 : 0,      
            is_contra: global.is_contra ? 1 : 0,
			pared_dialogo_mostrado: global.pared_dialogo_mostrado ? 1 : 0,
            mission_clear_aux: global.mission_clear_aux ? 1 : 0,
			textbox_cerrado_manualmente: global.textbox_cerrado_manualmente ? 1 : 0
        },
        
        // NPCS
        npcs: [
            {id: 1, ya_hablo: global.npc_1 ? 1 : 0},
            {id: 2, ya_hablo: global.npc_2 ? 1 : 0},
            {id: 3, ya_hablo: global.npc_3 ? 1 : 0},
            {id: 4, ya_hablo: global.npc_4 ? 1 : 0},
            {id: 5, ya_hablo: global.npc_5 ? 1 : 0},
            {id: 6, ya_hablo: global.pared_vista ? 1 : 0},
            {id: 7, ya_hablo: global.pared_dialogo_mostrado ? 1 : 0}
        ],
        
        // INVENTARIO
        inventario: [
            {id: 1, cantidad: global.carta_recogida ? 1 : 0},
            {id: 2, cantidad: global.funko_recogido ? 1 : 0},
            {id: 3, cantidad: global.contacto_obtenido ? 1 : 0},
            {id: 4, cantidad: global.contacto_profe_usado ? 1 : 0}
        ],
        
        // CLASES
        clases: [
            {id: 1, completada: global.clase1_vista ? 1 : 0},
            {id: 2, completada: global.clase2_vista ? 1 : 0},
            {id: 3, completada: global.clase3_vista ? 1 : 0},
            {id: 4, completada: global.clase4_vista ? 1 : 0},
            {id: 5, completada: global.clase5_vista ? 1 : 0}
        ]
    };
	
	show_debug_message("📤 Enviando con ID: " + string(id_partida));

    var json_datos = json_stringify(datos);
	
	show_debug_message("📦 JSON que se va a enviar: " + json_datos);

    var header_map = ds_map_create();
    ds_map_add(header_map, "Content-Type", "application/json");

    http_request(url, "POST", header_map, json_datos);

    //ds_map_destroy(header_map);

    show_debug_message("📤 Enviando datos al servidor para la partida ID: " + string(id_partida));
	
	room_goto(Sala_aceptado);

}
