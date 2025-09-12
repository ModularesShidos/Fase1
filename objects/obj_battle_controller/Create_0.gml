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
    ["¿Qué es un diagrama de flujo y para qué sirve?", 
        ["Es un dibujo con flechas que muestra los pasos de un programa", "Un editor de texto", "Un lenguaje de programación", "Un compilador"], 0],

    ["¿Qué es un IDE y cuál es su función principal?", 
        ["Es un programa donde escribes y pruebas código", "Un sistema operativo", "Un editor de imágenes", "Un motor gráfico"], 0],

    ["¿Cuál es el programa más simple que todo principiante hace?", 
        ["El Hola Mundo", "Una calculadora científica", "Un videojuego completo", "Un compilador"], 0],

    ["¿Qué son los inputs en programación?", 
        ["Son los datos que mete el usuario al programa", "Son los resultados del programa", "Un error en el código", "Un tipo de variable"], 0],

    ["¿Qué son los outputs en programación?", 
        ["Son los resultados que el programa muestra", "Los datos que se meten al programa", "Un tipo de ciclo", "Un error de compilación"], 0],

    ["¿Qué es una variable?", 
        ["Una cajita donde se guardan datos", "Un ciclo repetitivo", "Un sistema operativo", "Un compilador"], 0],

    ["Menciona un tipo de dato que se puede guardar en una variable.", 
        ["Entero, decimal, texto o verdadero/falso", "Videojuegos", "Usuarios de internet", "Conexiones de red"], 0],

    ["¿Para qué sirven las tablas de verdad?", 
        ["Para ver todas las combinaciones de verdadero y falso", "Para compilar código", "Para crear diagramas de flujo", "Para dibujar interfaces"], 0],

    ["Escribe dos operadores lógicos básicos.", 
        ["AND (∧) y OR (∨)", "SUMA y RESTA", "IGUAL y DIFERENTE", "IF y ELSE"], 0],

    ["¿Qué representan los diagramas de Venn?", 
        ["Conjuntos y sus relaciones (uniones, intersecciones)", "Flujos de datos", "Árboles binarios", "Clases de programación"], 0],

    ["¿Qué es un condicional en programación?", 
        ["Una decisión: si pasa algo, se ejecuta algo", "Un ciclo repetitivo", "Un tipo de variable", "Un sistema operativo"], 0],

    ["Menciona dos ciclos que se usan para repetir instrucciones.", 
        ["while y for", "if y else", "switch y case", "try y catch"], 0],

    ["¿Qué es una función y para qué se usa?", 
        ["Un bloque de código reutilizable", "Un archivo de texto", "Un sistema operativo", "Un compilador"], 0],

    ["Explica brevemente qué es la recursividad.", 
        ["Es cuando una función se llama a sí misma", "Un error en el código", "Un ciclo for", "Una variable global"], 0],

    ["¿Cuál es la diferencia entre una pila y una cola?", 
        ["Pila: último en entrar, primero en salir. Cola: primero en entrar, primero en salir", "Ambas son iguales", "Pila: se usa en redes, Cola: en gráficos", "No hay diferencia"], 0]
];

// Cantidad total de preguntas
max_questions = array_length(questions);



// Sprites normales
sprite_student_normal = 1;
sprite_teacher_normal = 1;

// Sprites de reacción
sprite_student_happy = 3;
sprite_student_sad   = 2;
sprite_teacher_happy = 1;
sprite_teacher_sad   = 2;

// Sprites actuales
current_sprite_student = 1;
current_sprite_teacher = 1;

// Feedback de respuesta
feedback_text = "";
feedback_color = c_white;
feedback_timer = 0;      // Contador para mostrar el mensaje temporal
feedback_duration = 60;  // Frames que dura el mensaje (~1 segundo a 60 FPS)
