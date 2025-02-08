/// @description Moviminetos 
// Puede escribir su código en este editor
if(speed != 0){ 
	distance -= v;
	if(distance <= 0){ 
		speed = 0; 
		distance = 32
	}
}
if(speed == 0 ){ 
	if keyboard_check(vk_right) && place_free(x+1,y)
	{ 
		direction = 0; 
		hspeed = v;
	}
if keyboard_check(vk_left) && place_free(x-1,y)
	{ 
		direction = 180;
		hspeed = -v;
	} 
if keyboard_check(vk_up) && place_free(x,y-1)
	{ 
		direction = 90;
		vspeed = -v;
	}
if keyboard_check(vk_down) && place_free(x,y+1)
	{ 
		direction = 270;
		vspeed = v;
	}
}
//verifica direccion y velocidad para cambiar sprite

if speed > 0
	{ 
	image_speed = 1;
	} 
else
	{ 
	image_speed = 0;
	image_index = 0;
	} 

switch(direction)
	{ 
		case 0: 
		sprite_index = Sprite10;
		break;
	
		case 90:
		sprite_index = Sprite12;
		break;
	
		case 180: 
		sprite_index = Sprite11;
		break;
	
		case 270:
		sprite_index = Sprite9;
		break;
	}

if(keyboard_check_pressed(ord("E"))){
	var interactive = scrGetFacingObject();
	
	if(interactive) {
		with (interactive){
			event_user(0);
		}
	}
}