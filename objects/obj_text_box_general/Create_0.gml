global.dialogo_activo = true;

show_debug_message("DIALOGOOOOOOOOOOOOOOOOOOOO = " + string(global.dialogo_id));
switch (global.dialogo_id) {
    case 1:
        text = "Hola, necesito tu ayuda, acabo de perder una carta muy importante para mi, crees que me puedas ayudar a buscarla por favor, puede que se encuentre cerca del edificio V.";
        break;

    case 2:
        text = "Por favor, ayudame a echar un vistazo en el edificio V, estoy esperando a alguien en este momento.";
        break;
		
	case 3: 
		text = "Te lo agradezco mucho!!. Esta carta fue muy importante para mi el semestre qu comence, quería regalarsela a una amiga para que estudiara pero creo que ella no vendra, te la puedes quedar para que estudies.";
		global.game_state = 1;
		break;
		
	case 4: 
		text = "Hola compañero, veo que no tienes muchos amigos que te puedan decir esto pero te recomiendo mucho que si tienes hambre despues de clases vayas al globo, es una cafeteria circular muy famosa de aqui de CUCEI, me gusto mucho y hay muchas opciones de comida que te podrían gustar, solo asegurate de ir a una buena hora porque luego esta muy lleno. Se encuentra cerca de la entrada de Boulevard despues de los edificios alfa y beta. Suerte encontrandolo!!!";
		break;
		
	case 5: 
		text = "Date prisa que luego se acaba la comida!!!";
		global.dialogo_id = 6;
		break;
		
	case 6: 
		text = "Soy el maestro ayuda!!!"; // Investigar por que nunca da 6 aunque lo intente
		break;
		
	case 7: 
		text = "Soy el maestro ayuda!!!";
		break;
		
	case 8: 
		text = "Date prisa, pronto comenzara mi próxima clase!!!";
		break;
		
	case 9:
		//Maestro agradece por recuperar la contraseña
		text = "Gracias, mira este es mi contacto por si tienes problemas";
		global.game_state = 3;
		break;
		
	case 10: 
		text = "Que onda amigo, cómo has estado??, cómo te trata la universidad?... Que bueno, oy mira, creo que deje olvidado mi Funko de pikachu en alguna parte del estacionamiento de revolución, podrías ayudarme a ir por el por favor, vi algo que te puede parecer muy divertido por el estacionamiento.";
		break;
		
	case 11: 
		text = "Si también eres otaku te gustara lo qe veras en ese estacionamiento";
		break;
		
	case 12: 
		text = "Muchas gracias amigo. Espero que te haya tocado ver ese auto de pikachu en el estacionamiento, esta increible, cierto?";
		global.game_state = 4;
		global.class_state = 4;
		break;
		
	case 13: 
		text = "Historia de las 3 fuentes";
		break;
		
	case 14: 
		text = "Qué?, quieres que te lo repita o que?, ve y busca las fuentes rapido!!!";
		break;
	// Aq

    default:
        text = "Sin diálogo definido.";
        break;
}

// Aquí parte tu lógica de paginado
pages = scr_split_text_into_pages(text, global.textbox_font, 20, 394, 200);
page = 0;
text_on_display = "";
text_finished = false;
alarm[0] = 3;
