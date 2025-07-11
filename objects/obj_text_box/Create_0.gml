//Constantes Cajas de texto   

text = "Hola Mundo, mi nombre es Irving Eduardo, tengo 21 años y tranajo en mi proyecto modular.";
// Aqui se manda a llamar las funciones auxiliares para que se vaya paginando el texto si es muy largo para un solo cuadro de dialogo
if (!variable_global_exists("textbox_font")) {
    show_debug_message("Fuente no inicializada. Abortando texto.");
    exit;
}
pages = scr_split_text_into_pages(text, global.textbox_font, 20, 394, 200);
page = 0;
text_on_display = "";

alarm[0] = 3;