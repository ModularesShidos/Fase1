audio_play_sound(Snd_PeleaProfe, 1, true);

// Vida del jugador
player_hp = 100;

// Estado del juego
state = "question"; // otros: "feedback", "end"

// Índice de la pregunta actual
question_index = 0;

// Respuesta seleccionada
selected_answer = -1;

// Objetos de ayuda (solo se pueden usar una vez)
item_call_used = false;   // Llamar al profe (elimina 2 opciones malas)

item_cheat_used = false;  // Acordeón (muestra la correcta) | muestra si ya se uso o no
item_cheat_active = false // Esta activo en la pregunta actual
item_cheat_question = -1 // indice de la pregunta donde se activo

// Preguntas (texto, opciones[], índiceCorrecto)
questions = [
    ["¿Que es un diagrama de flujo y para que sirve?", 
        ["Un editor de texto", "Un lenguaje de programacion", "Es un dibujo con flechas que muestra los pasos de un programa", "Un compilador"], 2],

    ["¿Que es un IDE y cual es su funcion principal?", 
        ["Es un programa donde escribes y pruebas codigo", "Un sistema operativo", "Un editor de imagenes", "Un motor grafico"], 0],

    ["¿Cual es el programa mas simple que todo principiante hace?", 
        ["Una calculadora cientifica", "Un videojuego completo", "Un compilador", "El Hola Mundo"], 3],

    ["¿Que son los inputs en programacion?", 
        ["Son los resultados del programa", "Son los datos que mete el usuario al programa", "Un error en el codigo", "Un tipo de variable"], 1],

    ["¿Que son los outputs en programacion?", 
        ["Los datos que se meten al programa", "Un tipo de ciclo", "Son los resultados que el programa muestra", "Un error de compilacion"], 2],

    ["¿Que es una variable?", 
        ["Un ciclo repetitivo", "Una cajita donde se guardan datos", "Un sistema operativo", "Un compilador"], 1],

    ["Menciona un tipo de dato que se puede guardar en una variable.", 
        ["Entero, decimal, texto o verdadero/falso", "Videojuegos", "Usuarios de internet", "Conexiones de red"], 0],

    ["¿Para que sirven las tablas de verdad?", 
        ["Para compilar codigo", "Para ver todas las combinaciones de verdadero y falso", "Para crear diagramas de flujo", "Para dibujar interfaces"], 1],

    ["Escribe dos operadores logicos basicos.", 
        ["SUMA y RESTA", "IGUAL y DIFERENTE", "IF y ELSE", "AND (∧) y OR (∨)"], 3],

    ["¿Que representan los diagramas de Venn?", 
        ["Flujos de datos", "Arboles binarios", "Clases de programacion", "Conjuntos y sus relaciones (uniones, intersecciones)"], 3],

    ["¿Que es un condicional en programacion?", 
        ["Un ciclo repetitivo", "Un tipo de variable", "Una decision: si pasa algo, se ejecuta algo", "Un sistema operativo"], 2],

    ["Menciona dos ciclos que se usan para repetir instrucciones.", 
        ["while y for", "if y else", "switch y case", "try y catch"], 0],

    ["¿Que es una funcion y para que se usa?", 
        ["Un archivo de texto", "Un sistema operativo", "Un compilador", "Un bloque de codigo reutilizable"], 3],

    ["Explica brevemente que es la recursividad.", 
        ["Un error en el codigo", "Es cuando una función se llama a si misma", "Un ciclo for", "Una variable global"], 1],

    ["¿Cual es la diferencia entre una pila y una cola?", 
        ["Ambas son iguales", "Pila: se usa en redes, Cola: en graficos", "Pila: ultimo en entrar, primero en salir. Cola: primero en entrar, primero en salir", "No hay diferencia"], 2]
];

// Cantidad total de preguntas
max_questions = array_length(questions);



// Sprites normales
sprite_student_normal = 1;
sprite_teacher_normal = 3;

// Sprites de reacción
sprite_student_happy = 3;
sprite_student_sad   = 2;
sprite_teacher_happy = 1;
sprite_teacher_sad   = 2;

// Sprites actuales
current_sprite_student = 1;
current_sprite_teacher = 3;

// Feedback de respuesta
feedback_text = "";
feedback_color = c_white;
feedback_timer = 0;      // Contador para mostrar el mensaje temporal
feedback_duration = 60;  // Frames que dura el mensaje (~1 segundo a 60 FPS)
