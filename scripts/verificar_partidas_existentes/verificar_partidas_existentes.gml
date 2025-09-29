// Script: verificar_partida_existente
function verificar_partida_existente() {
    show_debug_message("🔍 Verificando si existe partida en slot 1...");

    var url = "http://localhost:3000/api/partida/existe/1"; // 🔥 Nuevo endpoint
    var header_map = ds_map_create();
    ds_map_add(header_map, "Content-Type", "application/json");
    http_request(url, "GET", header_map, "");
}
