/*Verifica si no es nula la posicion, ya que si no lo es significa que se cambio de ROOM
y debe establecer la nueva posicion del personaje en la ROOM a la cual se cambio
Cuando el personaje ya esta en su posicion deseada, vuelve a igualarse en nulo
*/

if(player_start_position != noone){
	Obj_Player_M.x = player_start_position[0];
	Obj_Player_M.y = player_start_position[1];
	Obj_Player_M.face = player_start_position[2];
	
	player_start_position = noone;
}

// Mostrar textbox solo una vez en la sala correcta
// Checale porque todavia no me sale 
if (room == Sala_pasillo_revolucion && !global.visto_intro_cucei) {
    instance_create_layer(0, 0, "UI", obj_text_box);
}
