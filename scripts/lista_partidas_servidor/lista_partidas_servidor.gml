function lista_partidas_servidor(){
	show_debug_message("📋 Solicitando lista de todas las partidas...");
    
    var url = "http://localhost:3000/api/partidas";
    var header_map = ds_map_create();
    ds_map_add(header_map, "Content-Type", "application/json");
    
    http_request(url, "GET", header_map, "");
    
    ds_map_destroy(header_map);

}