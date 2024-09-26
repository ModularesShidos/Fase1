/// @description Funcion del boton


if !press exit;


if texto == "Jugar"{
	room_goto(Juanpa);
}

if texto == "Opciones"{
	room_goto(Entrada_BLVRD);
}

if texto == "Salir"{
	game_end();
}