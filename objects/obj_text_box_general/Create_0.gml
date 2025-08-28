global.dialogo_activo = true;
global.activar_mision_1 = false;
global.activar_mision_3 = false;

switch (global.dialogo_id) {
    case 1:
        text = "Hola, necesito tu ayuda, acabo de perder una carta muy importante para mi, crees que me puedas ayudar a buscarla por favor, puede que se encuentre cerca del edificio V.";
        break;

    case 2:
        text = "Por favor, ayudame a echar un vistazo en el edificio V, estoy esperando a alguien en este momento.";
        break;
		
	case 3: 
		text = "Te lo agradezco mucho!!. Esta carta fue muy importante para mi el semestre qu comence, quería regalarsela a una amiga para que estudiara pero creo que ella no vendra, te la puedes quedar para que estudies.";
		global.activar_mision_1 = true;
		global.mision_terminada = 1;
		break;
		
	case 4: 
		text = "Hola compañero, veo que no tienes muchos amigos que te puedan decir esto pero te recomiendo mucho que si tienes hambre despues de clases vayas al globo, es una cafeteria circular muy famosa de aqui de CUCEI, me gusto mucho y hay muchas opciones de comida que te podrían gustar, solo asegurate de ir a una buena hora porque luego esta muy lleno. Se encuentra cerca de la entrada de Boulevard despues de los edificios alfa y beta. Suerte encontrandolo!!!";
		break;
		
	case 5: 
		text = "Date prisa que luego se acaba la comida!!!";
		break;
		
	case 6: 
		text = "Hola compañero, veo que no tienes muchos amigos que te puedan decir esto pero te recomiendo mucho que si tienes hambre despues de clases vayas al globo, es una cafeteria circular muy famosa de aqui de CUCEI, me gusto mucho y hay muchas opciones de comida que te podrían gustar, solo asegurate de ir a una buena hora porque luego esta muy lleno. Se encuentra cerca de la entrada de Boulevard despues de los edificios alfa y beta. Suerte encontrandolo!!!";
		break;
		
	case 7: 
		text = "Date prisa!!!";
		break;
		
	case 8: 
	//Maestro agradece por recuperar la contraseña
		text = "Gracias, mira este es mi contacto por si tienes problemas";
		global.activar_mision_3 = true;
		global.mision_terminada = 3;
		break;

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
