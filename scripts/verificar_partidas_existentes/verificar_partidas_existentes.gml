// Script: verificar_partida_existente
function verificar_partida_existente() {

    var url = "http://localhost:3000/api/partida/existe/" + string(global.id_partida);

    var header_map = ds_map_create();
    ds_map_add(header_map, "Content-Type", "application/json");
    http_request(url, "GET", header_map, "");
}
