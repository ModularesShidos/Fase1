global.dialogo_activo = true;

var comentarios_posibles = [];

// MÉTODO ALTERNATIVO - push cada elemento
if (global.clase1_gusta) {
    array_push(comentarios_posibles, "¿Viste esos diagramas de flujo? Son como mapas del tesoro para programar");
    array_push(comentarios_posibles, "Los IDEs hacen la programación mucho más fácil, ¿no crees?");
    array_push(comentarios_posibles, "Todo programador empieza con un 'Hola Mundo'");
    array_push(comentarios_posibles, "Me encanta cómo los diagramas muestran todo el flujo del programa");
}

if (global.clase2_gusta) {
    array_push(comentarios_posibles, "Los inputs y outputs son la base de cualquier programa");
    array_push(comentarios_posibles, "Las variables son como cajitas mágicas que guardan datos");
    array_push(comentarios_posibles, "Sin tipos de datos, no podríamos programar nada útil");
    array_push(comentarios_posibles, "¿Ya dominaste lo de nombrar variables correctamente?");
}

if (global.clase3_gusta) {
    array_push(comentarios_posibles, "Las tablas de verdad son fascinantes, ¿no?");
    array_push(comentarios_posibles, "AND, OR, NOT... con eso se construye toda la lógica");
    array_push(comentarios_posibles, "Los diagramas de Venn me ayudan a entender conjuntos");
    array_push(comentarios_posibles, "La lógica booleana está en todo lo digital");
}

if (global.clase4_gusta) {
    array_push(comentarios_posibles, "Los condicionales if son super útiles");
    array_push(comentarios_posibles, "¿Ya probaste hacer un switch complex?");
    array_push(comentarios_posibles, "Los ciclos while y for ahorran mucho trabajo");
    array_push(comentarios_posibles, "Las funciones hacen el código más limpio");
}

if (global.clase5_gusta) {
    array_push(comentarios_posibles, "La recursividad es como un loop elegante");
    array_push(comentarios_posibles, "Pilas y colas son estructuras fundamentales");
    array_push(comentarios_posibles, "El ordenamiento burbuja es lento pero educativo");
    array_push(comentarios_posibles, "Quicksort es mágico cuando lo entiendes");
}

// COMENTARIOS GENERALES (siempre disponibles)
array_push(comentarios_posibles, "¡Qué bonito día en CUCEI!");
array_push(comentarios_posibles, "Este campus es enorme, ¿verdad?");
array_push(comentarios_posibles, "No te pierdas en los pasillos");
array_push(comentarios_posibles, "¿Ya visitaste la biblioteca?");
array_push(comentarios_posibles, "La comida del globo está buena");

// Elegir comentario aleatorio
if (array_length(comentarios_posibles) > 0) {
    var comentario_elegido = comentarios_posibles[irandom(array_length(comentarios_posibles) - 1)];
    text = comentario_elegido;
    text_on_display = text;
} else {
    text = "¡Hola!";
    text_on_display = text;
}