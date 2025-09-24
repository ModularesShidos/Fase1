global.dialogo_activo = true;

switch (global.game_state) {
    case 0:
       text = "Bienvenido a CUCEI, nuevo estudiante!!! Esperamos que tengas un gran día lleno de retos y aprendizajes. Te notificamos que tu primera clase de Ingeniería Informática comienza en tan solo 5 minutos en el edificio X, salón número 7. ¡Apúrate para llegar a tiempo! Asegúrate de no perderte, este centro universitario es muy grande, pero con el tiempo aprenderás y conocerás lo suficiente para moverte sin problemas. Recuerda que puedes presionar la tecla Q en cualquier momento para revisar tu misión actual, con la tecla E podrás avanzar, continuar o finalizar las conversaciones y notificaciones, y con la tecla F recogerás los objetos que encuentres en tu camino. Permanece siempre atento y no ignores estos mensajes de teléfono, ya que serán clave para orientarte en tu aventura universitaria. Mucha suerte en tu primera misión, eestudiante!!!";
	   break;

    case 1:
        text = "¡Apresúrate! Tienes una clase de Programación en tan solo 5 minutos en el edificio X, salón número 12. No pierdas tiempo, los pasillos del CUCEI pueden ser un verdadero laberinto al inicio, pero con cada recorrido irás conociendo mejor el campus. Mientras tanto, recuerda que puedes presionar la tecla G para revisar tu misión actual y la tecla E para avanzar en estas notificaciones. ¡Sigue el rumbo y no llegues ttarde!";
		break;
		
	case 2: 
		text = "¡Felicidades! Has terminado tus clases de Programación Básica y estás listo para dar el siguiente paso: las clases de Métodos Matemáticos en el edificio Q, salón número 8. Apresúrate para llegar a tiempo y aprovechar cada minuto. Por cierto, sabias que CUCEI cuenta con 22 programas educativos de licenciatura, de los cuales 18 son evaluables. De ellos, 17 están acreditados por un organismo externo. De los 22 programas 20 son presenciales y dos vvirtuales.";
		break;
		
	case 3: 
		text = "Ahora sí vas a experimentar lo que es la programación en serio. Dirígete al edificio X, salón número 2 para tu próxima clase, porque cada minuto cuenta. Mientras caminas, vale la pena recordar que Alan Turing es considerado el padre de la informática y la inteligencia artificial, contribuyó a descifrar los códigos utilizados por los alemanes durante la Segunda Guerra MMundial.";
		break;
		
	case 4: 
		text = "¡Prepárate! Hoy necesitarás toda tu concentración, porque verás la importancia de las estructuras de datos simples en tu clase del edificio X, salón número 8. Apresúrate para no llegar tarde y aprovechar cada minuto. En CUCEI, desde los primeros años de la carrera de Ingeniería Informática, el estudio de estructuras de datos ha sido fundamental para formar estudiantes capaces de organizar información de manera eficiente y resolver problemas complejos en programación. ¡Suerte y sigue aavanzando!";
		break;
		
	case 5: 
		text = "¡Rápido! Tu profesor te espera para tu examen final, y tendrás que demostrar que prestaste atención a todas tus clases. Dirígete cuanto antes al edificio X para no llegar ttarde.";
		break;

    default:
        text = "Sin diálogo definideo.";
        break;
}

text = string_replace_all(text, chr(9), " "); // quita \t 
while (string_pos("  ", text) != 0) { // colapsa espacios dobles
    text = string_replace_all(text, "  ", " ");
}

pages = scr_split_text_into_pages(text, global.textbox_font, 20, 394, 190);
page = 0;
text_on_display = "";

text_finished = false;
alarm[0] = 3;

// Checar que sale mal el text, sale al inicio todo y en negro
