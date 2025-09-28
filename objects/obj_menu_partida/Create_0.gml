// obj_menu_partidas - Evento Crear
global.id_partida = 1;          // Siempre usaremos el slot 1
global.partida_existe = false;  // 🔥 Nueva bandera única
verificar_partida_existente();

show_debug_message("🟢 Menú iniciado. Solo 1 partida posible (ID 1)");
