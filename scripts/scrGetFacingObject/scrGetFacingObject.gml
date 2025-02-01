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
			ty -= 32;
			break;
	}
	
	return instance_place(tx, ty, ObjInteractive);
}