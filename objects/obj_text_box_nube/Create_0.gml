// Crear
global.dialogo_activo = true;
esperar_input = false;

switch (global.class_state) {

	case 0: 
		text = "Wow, qué buena clase. Hasta se me quedó grabado que un diagrama de flujo es como un dibujo con flechas que muestra paso a paso cómo realizar un programa, desde el inicio hasta el final, incluyendo decisiones y repeticiones. También aprendí que un IDE es un programa donde escribes, pruebas y depuras código, y que instalarlo es muy sencillo: solo lo descargas de su página oficial, lo instalas y listo. Ah, y el famoso 'Hola Mundo', que es el programa más simple que imprime esas palabras en consola, sirve para que los principiantes vean que todo está funcionando correctamente. Incluso nos enseñaron que muchos programadores empiezan siempre con este ejercicio para asegurarse de que entienden cómo se ejecuta un programa bbásico.";
		global.class_state = 1;
	break;
	
	case 1: 
		if (global.is_class){	
			text = "Hoy vimos lo básico de programación: los inputs son lo que el usuario introduce al programa, y los outputs son lo que el programa muestra en respuesta. Las variables son como cajitas donde guardamos datos, y hay distintos tipos según lo que queramos almacenar: números enteros, decimales, texto, booleanos (verdadero/falso)… Básicamente, esto nos permite controlar la información dentro del programa. También hablamos un poco de cómo nombrar variables correctamente y la importancia de la sintaxis para que el código funcione sin eerrores.";
		} else {
			text = "Mmm, no sé, está muy buena la comida pero como que olía medio rraro";
			global.mission_clear_aux = true;
			global.class_state = 2;
		}
	break;
	
	case 2: 
		if(!global.is_contra){
			text = "Hoy vimos tablas de verdad, que sirven para mostrar todas las combinaciones posibles de verdadero y falso, operadores lógicos como AND, OR y NOT que conectan proposiciones, y los diagramas de Venn, que son círculos que representan cómo se relacionan los conjuntos. Es fascinante ver cómo algo tan simple como verdadero/falso puede formar la base de toda la lógica de programación y matemáticas ccomputacionales.";
			global.mission_clear_aux = false;
		} else {
			text = "Esto no tiene sentido… pero parece que al menos encontré la contraseña. ¡Quizá sea parte de un reto del profesor! Bueno de igual forma tengo que ir a bbuscarlo";
			global.class_state = 3;
		}// Aqui poner la frase para cuando encuentre la contrasena
	break;
	
	case 3: 
		text = "Hoy vimos condicionales, que son decisiones tipo 'si pasa esto, hago esto'. Para realizarlas se utilizan las palabras reservadas if, luego la condición a evaluar, y también el switch, que sirve para manejar varios casos predefinidos dependiendo de lo que el usuario haga. Además aprendimos sobre ciclos, que repiten instrucciones mientras se cumpla una condición, y funciones, que son como bloques de código reutilizables para no repetir lo mismo una y otra vez. Existen tres tipos principales de ciclos: while, do while y for, cada uno útil según el tipo de tarea que queramos aautomatizar.";
	break;
	
	case 4: 
		text = "Hoy vimos recursividad que es cuando una función se llama a sí misma para resolver un problema, pilas que son estructuras tipo último en entrar primero en salir, colas que son primero en entrar primero en salir, y métodos de ordenamiento quHoy vimos recursividad, que es cuando una función se llama a sí misma para resolver un problema paso a paso, pilas, que son estructuras tipo 'último en entrar, primero en salir', y colas, que funcionan 'primero en entrar, primero en salir'. También aprendimos métodos de ordenamiento, que son formas de organizar datos dentro de un programa; algunos ejemplos son el método burbuja o quicksort, cada uno con su propia estrategia y eficiencia según la cantidad de ddatos.";
		global.class_state = 5;
	break;
	
	case 5: 

		switch (global.fuentes_cont) {
	        case 1:
	            text = "¡Genial! He encontrado la primera fuente. Se ve increíble, y quién sabe qué secretos guardará. Mejor seguir atento, aún quedan dos más.";
	        break;

	        case 2:
	            text = "Perfecto, segunda fuente localizada. Cada vez se pone más emocionante, esto no es un simple paseo por CUCEI… siento que me estoy acercando a algo grande.";
	        break;

	        case 3:
	            text = "¡Lo logré! La tercera fuente está frente a mí. Pensé que esta investigación sería más aburrida, pero esto ha resultado ser todo un reto. Ahora solo falta ver qué sucede con todo este conocimiento en mi próximo examen…";
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

