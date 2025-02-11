// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function scrGetFacingObject(){
	var tx = x;
	var ty = y;
	
	switch(direction){
		case 270:
		ty += 32;
		break;
		
		case 0:
		tx += 32;
		break;
		
		case 90:
		ty -= 32;
		break;
		
		case 180:
		tx -= 32;
		break;
	}
	
	return instance_place(tx, ty, ObjInteractive);
}