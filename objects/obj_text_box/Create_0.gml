global.dialogo_activo = true;

switch (global.game_state) {
    case 0:
       text = "Bienvenido a CUCEI nuevo estudiante!!!. Esperamos que tengas un gran día, tenemos el honor de anunciarte que tu primer clase de ingeniería informática comienza en 5 minutos en el edificio X salón número 7, apurate para llegar a tiempo. Buena ssuerte!!!";
	   break;

    case 1:
        text = "Apresurate, tienes una clase de programación en 5 minutos en el edificio X salon número 12.";
		break;
		
	case 2: 
		text = "Felicidades terminaste tus clases de programación básica. Ahora podras comenzar con tus clases de métodos matemáticos. Esas clases son el edificio Q salon numero 8, apresurate!!!";
		break;
		
	case 3: 
		text = "Felicidades ahora si veras lo que es la programacion. Date prisa y ve al edificio X al salon numero 2 para tu proxima clase!!!";
		break;
		
	case 4: 
		text = "Necesitaras suerte hoy, veras por fin la importancia de las estructuras de datos simples en el edificio X salon numero 8, apresurate!!!";
		break;
		
	case 5: 
		text = "Rápido tu profesor te espera para tu examen final, tendras que demostrar que pusiste ateniona  todas tus clases, suerte con eso. Busca a tu profesor en el edificio X.";
		break;

    default:
        text = "Sin diálogo definideo.";
        break;
}

text = string_replace_all(text, chr(9), " "); // quita \t 
while (string_pos("  ", text) != 0) { // colapsa espacios dobles
    text = string_replace_all(text, "  ", " ");
}

pages = scr_split_text_into_pages(text, global.textbox_font, 20, 394, 200);
page = 0;
text_on_display = "";

text_finished = false;
alarm[0] = 3;

// Checar que sale mal el text, sale al inicio todo y en negro
