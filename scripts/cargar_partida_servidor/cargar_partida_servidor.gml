function cargar_partida_servidor() {
    var id_partida = global.id_partida;
    // Incluir el id_partida en la URL
    var url = "http://localhost:3000/api/partida/cargar/" + string(id_partida);

    // Crear headers
    var header_map = ds_map_create();
    ds_map_add(header_map, "Content-Type", "application/json");

    // Hacer la solicitud HTTP GET
    http_request(url, "GET", header_map, "");

    ds_map_destroy(header_map);
    show_debug_message("📥 Solicitando datos del servidor para la partida ID: " + string(id_partida));
}
