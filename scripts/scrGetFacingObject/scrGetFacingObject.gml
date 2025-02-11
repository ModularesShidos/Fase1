// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información

//Script con funcion que verifica si hay un objeto interactuable enfrente del personaje
//Asi el personaje solo interactua cuando lo tiene enfrente y no en cualquier parte del mapa
function scrGetFacingObject(){
	var tx = x;
	var ty = y;
	
	switch(face){
		case "D":
		ty += 32;
		break;
		
		case "R":
		tx += 32;
		break;
		
		case "U":
		ty -= 32;
		break;
		
		case "L":
		tx -= 32;
		break;
	}
	
	return instance_place(tx, ty, ObjInteractive);
}