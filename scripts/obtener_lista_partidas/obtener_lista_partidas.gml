// Script: obtener_lista_partidas
function obtener_lista_partidas() {
    
    var url = "http://localhost:3000/api/partidas";
    var header_map = ds_map_create();
    ds_map_add(header_map, "Content-Type", "application/json");
    
    http_request(url, "GET", header_map, "");
}