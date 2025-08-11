global.dialogo_activo = true;
esperar_input = false;
text = "¡Esta es tu primera clase de programación! Asegúrate de prestar atención y hablar con tu profesor. AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";

pages = scr_split_text_into_pages(text, global.textbox_font, 20, 394, 200);
page = 0;
text_on_display = "";
text_finished = false;
alarm[0] = 3;

