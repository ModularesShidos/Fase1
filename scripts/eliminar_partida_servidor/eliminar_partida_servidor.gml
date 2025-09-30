function eliminar_partida_servidor(){
	
	// eliminar_partida_servidor(id_partida)
	var id_partida = argument0;
	show_debug_message("🗑 Eliminando partida ID: " + string(id_partida));

	var url = "http://localhost:3000/api/partida/" + string(id_partida);

	var header_map = ds_map_create();
	ds_map_add(header_map, "Content-Type", "application/json");

	http_request(url, "DELETE", header_map, "");

}