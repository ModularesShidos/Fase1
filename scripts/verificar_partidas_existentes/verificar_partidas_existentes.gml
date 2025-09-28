// Script: verificar_partida_existente (versión simplificada)
function verificar_partida_existente() {
    show_debug_message("🔍 Verificando si existe partida en slot 1...");

    var url = "http://localhost:3000/api/partida/cargar/1"; // 🔥 Solo pedimos la partida 1
    var header_map = ds_map_create();
    ds_map_add(header_map, "Content-Type", "application/json");
    http_request(url, "GET", header_map, "");
}
