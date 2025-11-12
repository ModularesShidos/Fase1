global.dialogo_activo = true;

var comentarios_posibles = [];

if (global.clase1_gusta) {
    array_push(comentarios_posibles, "Un diagrama de flujo bien hecho te ahorra muchos errores.");
	array_push(comentarios_posibles, "El 'Hola Mundo' es como el primer paso para entrar al mundo real de la programación.");
	array_push(comentarios_posibles, "Un IDE te ayuda a concentrarte en programar y no en pelearte con la consola.");
	array_push(comentarios_posibles, "¿Te fijaste que los símbolos del diagrama tienen significados específicos?");
	array_push(comentarios_posibles, "Si entiendes el flujo, entiendes el programa.");
	array_push(comentarios_posibles, "La primera vez que compila sin errores se siente como magia.");
}

if (global.clase2_gusta) {
    array_push(comentarios_posibles, "Nombrar variables bien evita dolores de cabeza después.");
	array_push(comentarios_posibles, "Los tipos de datos son como reglas del mundo del programa.");
	array_push(comentarios_posibles, "El input es lo que entra, el output es lo que sale. Fácil, pero esencial.");
	array_push(comentarios_posibles, "Una variable puede cambiar, pero su tipo define qué tan lejos puede llegar.");
	array_push(comentarios_posibles, "Muchos errores son solo variables mal escritas.");
	array_push(comentarios_posibles, "Guardar y manejar datos es el corazón de cualquier aplicación.");

}

if (global.clase3_gusta) {
    array_push(comentarios_posibles, "La lógica booleana define si algo pasa o no en el programa.");
	array_push(comentarios_posibles, "Las tablas de verdad muestran todas las posibilidades de una condición.");
	array_push(comentarios_posibles, "Los diagramas de Venn ayudan a visualizar relaciones complicadas.");
	array_push(comentarios_posibles, "AND requiere que todo sea verdadero, OR con que uno sea verdadero basta.");
	array_push(comentarios_posibles, "NOT invierte el valor, así de simple y poderoso.");
	array_push(comentarios_posibles, "Toda computadora al final piensa con verdadero y falso.");

}

if (global.clase4_gusta) {
    array_push(comentarios_posibles, "Una condición puede cambiar por completo el flujo del programa.");
	array_push(comentarios_posibles, "Los ciclos son claves para automatizar tareas repetitivas.");
	array_push(comentarios_posibles, "Las funciones te permiten no repetir código.");
	array_push(comentarios_posibles, "Un switch bien usado evita un montón de if anidados.");
	array_push(comentarios_posibles, "El while sigue hasta que dejas de cumplir la condición.");
	array_push(comentarios_posibles, "El for es ideal cuando sabes cuántas veces quieres repetir algo.");

}

if (global.clase5_gusta) {
    array_push(comentarios_posibles, "La recursividad es como una función que se mira a sí misma en el espejo.");
	array_push(comentarios_posibles, "Las pilas funcionan como cuando apilas platos en una torre.");
	array_push(comentarios_posibles, "Las colas funcionan como hacer fila en una tienda.");
	array_push(comentarios_posibles, "Algunos algoritmos de ordenamiento son simples, pero muy lentos.");
	array_push(comentarios_posibles, "Quicksort divide el problema en partes pequeñas. Elegante y rápido.");
	array_push(comentarios_posibles, "Elegir la estructura de datos correcta hace la diferencia.");

}

// COMENTARIOS GENERALES 
array_push(comentarios_posibles, "¡Qué bonito día en CUCEI!");
array_push(comentarios_posibles, "Este campus es enorme, ¿verdad?");
array_push(comentarios_posibles, "No te pierdas en los pasillos");
array_push(comentarios_posibles, "¿Ya visitaste la biblioteca?");
array_push(comentarios_posibles, "La comida del globo está buena");
array_push(comentarios_posibles, "¿Ya fuiste por café? Aquí se vive de cafeína.");
array_push(comentarios_posibles, "Dicen que CUCEI crece cada vez que te pierdes.");
array_push(comentarios_posibles, "La biblioteca es grande, pero el silencio da sueño.");
array_push(comentarios_posibles, "Hay días en que CUCEI está lleno de gatos.");
array_push(comentarios_posibles, "Si ves a alguien corriendo, es porque va tarde a clase.");
array_push(comentarios_posibles, "Los pasillos tienen su propio laberinto interno.");

// Elegir comentario aleatorio
if (array_length(comentarios_posibles) > 0) {
    var comentario_elegido = comentarios_posibles[irandom(array_length(comentarios_posibles) - 1)];
    text = comentario_elegido;
    text_on_display = text;
} else {
    text = "¡Hola!";
    text_on_display = text;
}