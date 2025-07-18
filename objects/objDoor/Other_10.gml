
//Manda los valores de la nueva posicion al objeto SYSTEM para que ahi los establesca en el juego y aparezcas correcto en la siguiente ROOM
ObjSystem.player_start_position = target_player_position;

//Comando de Game Maker que te manda a una sala diferente. El valor esta establecido en las DOORS
room_goto(target_room);
