// Evento Async - HTTP
var _async_load = async_load;

if (ds_map_exists(_async_load, "id")) {
    var status  = ds_map_find_value(_async_load, "status");
    var response = ds_map_find_value(_async_load, "result");
    var url     = ds_map_find_value(_async_load, "url");

    show_debug_message("🔔 Async Event - URL: " + string(url) + " | Status: " + string(status));
	
	// =====================================================
	// 4. ELIMINAR
	// =====================================================
	if (ds_map_exists(_async_load, "method") && string_pos("/api/partida/", url) > 0 && string_pos("DELETE", _async_load[? "method"]) > 0) {
	    if (status == 200 || status == 0) {
	        show_debug_message("✅ Partida eliminada correctamente: " + string(url));
			 global.partida_eliminada = true; // bandera
	    } else {
	        show_debug_message("❌ Error eliminando partida: " + string(status));
			global.partida_eliminada = false;
	    }
	}
	
	else if (string_pos("/api/partida/actualizar/", url) > 0 && (status == 200 || status == 0)) {
		
		show_debug_message("🔄 Partida actualizada correctamente en el servidor");
	
	}
	
	 // 🔹 Verificar existencia de partida
    if ((status == 200 || status == 0) && string_pos("/api/partida/existe/", url) > 0) {
        if (string_length(response) > 0) {
            var datos = json_parse(response);
            global.partida_existe = datos.existe;
            global.esperando_verificacion = false;

            show_debug_message("✅ Verificación completada - partida_existe: " + string(global.partida_existe));

            // 🔹 Si no existe, ir a crear/guardar partida automáticamente
            if (!global.partida_existe) {
                show_debug_message("⚠️ No existe partida, se creará nueva");
                // Aquí llamas tu función de guardar partida
				inicializar_variables_juego();
                guardar_partida_servidor(); // <--- tu script de POST /api/partida/guardar
            } else {
                // Si existe, puedes cargarla
                cargar_partida_servidor(); // <--- tu script de GET /api/partida/cargar/:id
            }
        } else {
            show_debug_message("❌ Respuesta vacía al verificar existencia de partida");
        }
    }

    // =====================================================
    // 1. RESPUESTA DE CARGA DE PARTIDA
    // =====================================================
    if (string_pos("/api/partida/cargar/", url) > 0 && (status == 200 || status == 0)) {
        if (string_length(response) > 10) {
            try {
                var datos = json_parse(response);

                // 🔄 Restaurar progreso
                var p = datos.progreso;
                global.game_state          = p.game_state;
				global.dialogo_activo      = p.dialogo_activo;
				global.dialogo_cerrado     = p.dialogo_cerrado;
                global.class_state         = p.class_state;
                global.mision_terminada    = p.mision_terminada;
                global.fuentes_cont        = p.fuentes_cont;
                global.dialogo_id          = p.dialogo_id;
                global.textbox_visto       = (p.textbox_visto == 1);
                global.is_class            = (p.is_class == 1);
                global.is_contra           = (p.is_contra == 1);
                global.mission_clear_aux   = (p.mission_clear_aux == 1);
				global.pared_dialogo_mostrado = (p.pared_dialogo_mostrado == 1);
				global.textbox_cerrado_manualmente = (p.textbox_cerrado_manualmente == 1);
				


                // 🔄 Restaurar NPCs
                for (var i = 0; i < array_length(datos.npcs); i++) {
                    var npc = datos.npcs[i];
                    var npc_id = npc.npc_id;
                    var ya_hablo = (npc.ya_hablo == 1);

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

                // 🔄 Restaurar Inventario
                for (var i = 0; i < array_length(datos.inventario); i++) {
                    var item = datos.inventario[i];
                    var item_id = item.item_id;
                    var cantidad = (item.cantidad == 1);

                    switch (item_id) {
                        case 1: global.carta_recogida = cantidad; break;
                        case 2: global.funko_recogido = cantidad; break;
                        case 3: global.contacto_obtenido = cantidad; break;
                        case 4: global.contacto_profe_usado = cantidad; break;
                    }
                }

                // 🔄 Restaurar Clases
                for (var i = 0; i < array_length(datos.clases); i++) {
                    var clase = datos.clases[i];
                    var clase_id = clase.clase_id;
                    var completada = (clase.completada == 1);

                    switch (clase_id) {
                        case 1: global.clase1_vista = completada; break;
                        case 2: global.clase2_vista = completada; break;
                        case 3: global.clase3_vista = completada; break;
                        case 4: global.clase4_vista = completada; break;
                        case 5: global.clase5_vista = completada; break;
                    }
                }

                show_debug_message("✅ Partida cargada exitosamente (slot 1)");
				global.esperando_verificacion = false; 
				show_debug_message("✅ Verificación completada - partida_existe: " + string(global.partida_existe));
				room_goto(Entrada_Revolucion);

            } catch (e) {
                show_debug_message("❌ Error cargando partida: " + string(e));
            }
        } else {
            show_debug_message("❌ Respuesta vacía al cargar partida");
        }
    }

    // =====================================================
    // 2. RESPUESTA DE GUARDADO
    // =====================================================
    else if (string_pos("/api/partida/guardar", url) > 0 && (status == 200 || status == 0)) {
        if (string_length(response) > 10) {
            try {
                var respuesta = json_parse(response);
                global.id_partida = respuesta.id_partida;
                global.partida_existe = true; // ✅ ahora sí existe

                show_debug_message("✅ Partida guardada (ID " + string(global.id_partida) + ")");
                room_goto(Sala_aceptado);

            } catch (e) {
                show_debug_message("⚠️ Guardado completado, pero error parseando respuesta");
                room_goto(Sala_aceptado);
            }
        } else {
            show_debug_message("✅ Guardado completado (respuesta mínima)");
            global.partida_existe = true;
        }
    }




    // =====================================================
    // 4. RESPUESTA NO RECONOCIDA
    // =====================================================
    else {
        show_debug_message("❓ Respuesta no manejada: " + string(url));
		show_debug_message("📡 Status recibido: " + string(status));
    }


}