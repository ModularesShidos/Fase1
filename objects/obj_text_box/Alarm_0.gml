// Alarma para recorrer un texto cada cierto tiempo

/* 
La funcion string obtiene letra por letra, el primer parametro
   es el texto, el segundo, despues el string_length para obtener 
   la cantidad 
*/
if(text_on_display != pages[page]){
	
	// El +1 es para que empiece desde la sigueinte posicion y no se repita el primer caracter
	text_on_display += string_char_at(pages[page], string_length(text_on_display) + 1);

	//Cada 3 frames se añade un nuevo caracter
	alarm[0] = 3
	
}