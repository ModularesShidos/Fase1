global.dialogo_activo = true;

switch (global.dialogo_id) {
    case 1:
        text = "¡Hola! Ya tomaste tu primera clase. Recuerda que el conocimiento es poder.";
        break;

    case 2:
        text = "¡Te veo motivado! Sigue asistiendo a tus clases.";
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
