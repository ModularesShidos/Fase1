global.dialogo_activo = true;

// Array de comentarios posibles basados en clases que gustaron
var comentarios_posibles = [];

// COMENTARIOS GENERALES (siempre disponibles)
var comentarios_generales = [
    "¡Qué bonito día en CUCEI!",
    "Este campus es enorme, ¿verdad?",
    "No te pierdas en los pasillos",
    "¿Ya visitaste la biblioteca?",
    "La comida del globo está buena"
];

// COMENTARIOS POR CLASE GUSTADA
if (global.clase1_gusta) {
    var comentarios_clase1 = [
        "¿Viste esos diagramas de flujo? Son como mapas del tesoro para programar",
        "Los IDEs hacen la programación mucho más fácil, ¿no crees?",
        "Todo programador empieza con un 'Hola Mundo'",
        "Me encanta cómo los diagramas muestran todo el flujo del programa"
    ];
    comentarios_posibles = comentarios_posibles.concat(comentarios_clase1);
}

if (global.clase2_gusta) {
    var comentarios_clase2 = [
        "Los inputs y outputs son la base de cualquier programa",
        "Las variables son como cajitas mágicas que guardan datos",
        "Sin tipos de datos, no podríamos programar nada útil",
        "¿Ya dominaste lo de nombrar variables correctamente?"
    ];
    comentarios_posibles = comentarios_posibles.concat(comentarios_clase2);
}

if (global.clase3_gusta) {
    var comentarios_clase3 = [
        "Las tablas de verdad son fascinantes, ¿no?",
        "AND, OR, NOT... con eso se construye toda la lógica",
        "Los diagramas de Venn me ayudan a entender conjuntos",
        "La lógica booleana está en todo lo digital"
    ];
    comentarios_posibles = comentarios_posibles.concat(comentarios_clase3);
}

if (global.clase4_gusta) {
    var comentarios_clase4 = [
        "Los condicionales if son super útiles",
        "¿Ya probaste hacer un switch complex?",
        "Los ciclos while y for ahorran mucho trabajo",
        "Las funciones hacen el código más limpio"
    ];
    comentarios_posibles = comentarios_posibles.concat(comentarios_clase4);
}

if (global.clase5_gusta) {
    var comentarios_clase5 = [
        "La recursividad es como un loop elegante",
        "Pilas y colas son estructuras fundamentales",
        "El ordenamiento burbuja es lento pero educativo",
        "Quicksort es mágico cuando lo entiendes"
    ];
    comentarios_posibles = comentarios_posibles.concat(comentarios_clase5);
}

// Si no hay comentarios de clases gustadas, usar solo generales
if (array_length(comentarios_posibles) == 0) {
    comentarios_posibles = comentarios_generales;
} else {
    // Mezclar algunos comentarios generales también
    comentarios_posibles = comentarios_posibles.concat(comentarios_generales);
}

// Elegir comentario aleatorio
var comentario_elegido = comentarios_posibles[irandom(array_length(comentarios_posibles) - 1)];
text = comentario_elegido;

// Lógica de paginado (igual que tus otros textboxes)
pages = scr_split_text_into_pages(text, Font3, 24, 394, 190);
page = 0;
text_on_display = "";
text_finished = false;
alarm[0] = 3;