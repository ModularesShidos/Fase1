global.dialogo_activo = true;
esperar_input = false;

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
		text = "Hoy vimos tablas de verdad que sirven para ver todas las combinaciones de verdadero y falso, los operadores lógicos como AND, OR y NOT que conectan proposiciones, y los diagramas de Venn que son círculos para representar cómo se relacionan los conjuntos.";
		global.mission_clear_aux = false;
	break;
	
	case 3: 
		text = "aaaaaaaaaaaaaaaaaaaa";
	break;
	
	case 4: 
		text = "aaaaaaaaaaaaaaaaaaaa";
	break;
	
	default:
		text = "a";
	break;
}

// 🔎 Nuevo log para saber exactamente qué texto quedó
show_debug_message(">>> [Textbox] class_state=" + string(global.class_state) + " | Texto asignado=" + string(text));


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

