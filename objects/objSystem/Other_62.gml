// 📡 Asynchronous HTTP Event
var _async_load = async_load;

// 🔥 AGREGA ESTA VERIFICACIÓN INICIAL
show_debug_message("=== 🔔 EVENTO ASYNC DISPARADO ===");
show_debug_message("Tipo de async_load: " + string(ds_map_size(_async_load)));

// Verificar que es una respuesta HTTP
if (ds_map_exists(_async_load, "id")) {
    var status   = ds_map_find_value(_async_load, "status");
    var response = ds_map_find_value(_async_load, "result");
    var url      = ds_map_find_value(_async_load, "url");

    show_debug_message("🔔 Respuesta HTTP - Status: " + string(status) + " | URL: " + string(url));
	    // Agrega más debug info
    show_debug_message("🔔 Respuesta HTTP - Status: " + string(status));
    show_debug_message("URL: " + string(url));
    show_debug_message("Respuesta completa: " + string(_async_load));

    // Para status 0, verifica el error
    if (status == 0) {
        show_debug_message("❌ Error de conexión - Posibles causas:");
        show_debug_message("   - Servidor no accesible");
        show_debug_message("   - Bloqueo de CORS");
        show_debug_message("   - URL incorrecta");
        show_debug_message("   - Puerto bloqueado");
    }

    // 📥 RESPUESTA DE GUARDADO (POST)
    if (string_pos("/api/partida/guardar", url) > 0) {
        if (status == 200) {
            var respuesta = json_parse(response); // ds_map
            var id_partida = ds_map_find_value(respuesta, "id_partida");
            show_debug_message("✅ Partida guardada exitosamente en servidor");
            show_debug_message("ID Partida: " + string(id_partida));
			
			// ✅ Si no existía la partida, entrar al juego ahora
		    if (!global.partida_existente) {
		        show_debug_message("🚀 Entrando al juego con nueva partida...");
		        //room_goto(Entrada_Revolucion);
		        global.partida_existente = true; // marcar que ahora sí hay partida
		    }

            ds_map_destroy(respuesta);
        } else {
            show_debug_message("❌ Error al guardar: " + string(status));
            if (status != 0) {
                show_debug_message("Respuesta del servidor: " + string(response));
            }
        }
    }

    // 📤 RESPUESTA DE CARGA (GET)
    else if (string_pos("/api/partida/cargar", url) > 0) {
        if (status == 200) {
			global.partida_existente = true;
            var datos = json_parse(response); // ds_map

            // 🔄 RESTAURAR PROGRESO PRINCIPAL
            var p = ds_map_find_value(datos, "progreso"); // ds_map interno
            global.game_state       = ds_map_find_value(p, "game_state");
            global.class_state      = ds_map_find_value(p, "class_state");
            global.mision_terminada = ds_map_find_value(p, "mision_terminada");
            global.fuentes_cont     = ds_map_find_value(p, "fuentes_cont");
            global.dialogo_id       = ds_map_find_value(p, "dialogo_id");
            global.textbox_visto    = (ds_map_find_value(p, "textbox_visto") == 1);
            global.is_class         = (ds_map_find_value(p, "is_class") == 1);
            global.is_contra        = (ds_map_find_value(p, "is_contra") == 1);
            global.mission_clear_aux = (ds_map_find_value(p, "mission_clear_aux") == 1);

            // 🔄 RESTAURAR NPCS
            var npcs = ds_map_find_value(datos, "npcs"); // ds_list
            for (var i = 0; i < ds_list_size(npcs); i++) {
                var npc = ds_list_find_value(npcs, i); // ds_map
                var npc_id = ds_map_find_value(npc, "npc_id");
                var ya_hablo = (ds_map_find_value(npc, "ya_hablo") == 1);

                switch (npc_id) {
                    case 1: global.npc_1 = ya_hablo; break;
                    case 2: global.npc_2 = ya_hablo; break;
                    case 3: global.npc_3 = ya_hablo; break;
                    case 4: global.npc_4 = ya_hablo; break;
                    case 5: global.npc_5 = ya_hablo; break;
                    case 6: global.pared_vista = ya_hablo; break;
                    case 7: global.pared_dialogo_mostrado = ya_hablo; break;
                }
            }

            // 🔄 RESTAURAR INVENTARIO
            var inventario = ds_map_find_value(datos, "inventario"); // ds_list
            for (var i = 0; i < ds_list_size(inventario); i++) {
                var item = ds_list_find_value(inventario, i); // ds_map
                var item_id = ds_map_find_value(item, "item_id");
                var cantidad = (ds_map_find_value(item, "cantidad") == 1);

                switch (item_id) {
                    case 1: global.carta_recogida = cantidad; break;
                    case 2: global.funko_recogido = cantidad; break;
                    case 3: global.contacto_obtenido = cantidad; break;
                    case 4: global.contacto_profe_usado = cantidad; break;
                }
            }

            // 🔄 RESTAURAR CLASES
            var clases = ds_map_find_value(datos, "clases"); // ds_list
            for (var i = 0; i < ds_list_size(clases); i++) {
                var clase = ds_list_find_value(clases, i); // ds_map
                var clase_id = ds_map_find_value(clase, "clase_id");
                var completada = (ds_map_find_value(clase, "completada") == 1);

                switch (clase_id) {
                    case 1: global.clase1_vista = completada; break;
                    case 2: global.clase2_vista = completada; break;
                    case 3: global.clase3_vista = completada; break;
                    case 4: global.clase4_vista = completada; break;
                    case 5: global.clase5_vista = completada; break;
                }
            }

            show_debug_message("✅ Partida cargada exitosamente");
            show_debug_message("Game State: " + string(global.game_state));
            show_debug_message("Misiones terminadas: " + string(global.mision_terminada));

            ds_map_destroy(datos);
			//room_goto(Entrada_Revolucion);
        }
        else if (status == 404) {
            show_debug_message("⚠️ No hay partidas guardadas, comenzando nueva");
			global.partida_existente = false;
        }
        else {
            show_debug_message("❌ Error al cargar: " + string(status));
        }
    } else if (string_pos("/api/ping", url) > 0) {
        if (status == 200) {
            show_debug_message("✅ ¡PING EXITOSO! Respuesta del servidor: " + response);
        } else {
            show_debug_message("❌ PING FALLÓ con status: " + string(status));
        }
    }
}
