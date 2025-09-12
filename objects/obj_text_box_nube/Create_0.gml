global.dialogo_activo = true;
esperar_input = false;

switch (global.class_state) {

	case 0: 
		text = "Wow que buena clase, hasta se me quedo grabado que un diagrama de flujo es como un dibujo con flechas que muestra los pasos para realizar un programa. Tambien me enseñaron que un IDE es un programa donde escribres y pruebas código y que para instalarlo solo necesitas descargarlo de su página e instalarlo. Y un Hola Mundo es el programa más simple que imprime esas palabras en consola para principiantes.";
		global.class_state = 1;
	break;
	
	case 1: 
		if (global.is_class){	
			text = "Hoy vimos lo básico de programación: los inputs son lo que el usuario mete al programa, los outputs lo que el programa muestra. Las variables son como cajitas donde guardamos datos, y hay distintos tipos de datos según lo que quieras guardar: números enteros, decimales, texto, verdadero/falso… básicamente eso.";
		} else {
			text = "Como que olia medio raro";
			global.mission_clear_aux = true;
			global.class_state = 2;
		}
	break;
	
	case 2: 
		if(!global.is_contra){
			text = "Hoy vimos tablas de verdad que sirven para ver todas las combinaciones de verdadero y falso, los operadores lógicos como AND, OR y NOT que conectan proposiciones, y los diagramas de Venn que son círculos para representar cómo se relacionan los conjuntos.";
			global.mission_clear_aux = false;
		} else {
			text = "Esto no tiene sentido.";
			global.class_state = 3;
		}// Aqui poner la frase para cuando encuentre la contrasena
	break;
	
	case 3: 
		text = "Hoy vimos condicionales que son decisiones tipo si pasa esto hago esto y para realizar esas condicionales se utilizan las palabras reservadas if, despues la condicion y el switch que tiene las condiciones predefinidas para cuando ocurra un caso especifico ya esperado por el usuario. Y tambien vimos los ciclos que repiten instrucciones varias veces mientras se cumpla una condición, y funciones que son como bloques de código reutilizables para no estar repitiendo lo mismo. Existen 3, while, do while y for.";
	break;
	
	case 4: 
		text = "Hoy vimos recursividad que es cuando una función se llama a sí misma para resolver un problema, pilas que son estructuras tipo último en entrar primero en salir, colas que son primero en entrar primero en salir, y métodos de ordenamiento que son formas de acomodar datos como burbuja o quicksort";
		global.class_state = 5;
	break;
	
	case 5: 

		switch (global.fuentes_cont) {
	        case 1:
	            text = "Bien, primera fuente";
	        break;

	        case 2:
	            text = "Segunda fuente encontrada";
	        break;

	        case 3:
	            text = "Pense que seria mas interesante esta investiacion.";
				global.game_state = 5;
	        break;

	        default:
	            text = "Creo que me equivoque en algo"; 
	        break;
		}
	break;
	
	default:
		text = "a";
	break;
}


if (variable_instance_exists(id, "text")) {
    pages = scr_split_text_into_pages(text, global.textbox_font, 20, 394, 100);
    show_debug_message("Paginas generadas: " + string(array_length(pages)));
} else {
    show_debug_message("⚠️ Ningún texto asignado en CREATE -> destruyendo objeto");
    instance_destroy();
    exit;
}
page = 0;
text_on_display = "";
text_finished = false;
alarm[0] = 3;

