// Bloquea movimiento e interacción si hay diálogo activo
if (variable_global_exists("dialogo_activo") && global.dialogo_activo) {
    speed = 0;
    hspeed = 0;
    vspeed = 0;
    exit;
}

// Bloquea movimiento si está a punto de chocar con un NPC sólido
if (place_meeting(x + hspeed, y, obj_npc_1)) {
    hspeed = 0;
}
if (place_meeting(x, y + vspeed, obj_npc_1)) {
    vspeed = 0;
}


//Verifica cuando se deja de pulsar la tecla y para el movimiento del personaje
if(speed != 0){ 
	distance -= spd;
	if(distance <= 0){ 
		speed = 0; 
		action = "Stand";
	}
}


//Verifica pulsasion de tecla y realiza el movimiento por casilla del personaje
//Action cambia la posicion de parado a en movimiento. Face cambia la direccion del sprite
if (speed == 0){
	if(keyboard_check(ord("D"))){
		hspeed = spd;
		distance = 32;
		action = "Walk";
		face = "R";
	} else if (keyboard_check(ord("A"))){
		hspeed = -spd;
		distance = 32;
		action = "Walk";
		face = "L";
	} else if (keyboard_check(ord("S"))){
		vspeed = spd;
		distance = 32;
		action = "Walk";
		face = "D";
	} else if (keyboard_check(ord("W"))){
		vspeed = -spd;
		distance = 32;
		action = "Walk";
		face = "U";
	}
}

//Pulsacion de la tecla E para comenzar la interaccion con el objeto que tenga enfrente si es que existe
if(keyboard_check_pressed(ord("E"))){
	var interactive = scrGetFacingObject();
	
	if(interactive) {
		with (interactive){
			event_user(0);
		}
	}
}