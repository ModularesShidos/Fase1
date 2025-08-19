global.dialogo_activo = true;
global.activar_mision_1 = false;

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
