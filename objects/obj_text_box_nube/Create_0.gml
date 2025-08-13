global.dialogo_activo = true;
esperar_input = false;
text = "Wow que buena clase, hasta se me quedo grabado que un diagrama de flujo es como un \n" +
		"dibujo con flechas que muestra los pasos para realizar un programa. Tambien me enseñaron \n" +
		"que un IDE es un programa donde escribres y pruebas código y que para instalarlo solo \n" +
		"necesitas descargarlo de su página e instalarlo. Y un Hola Mundo es el programa más\n" +
		"simple que imprime esas palabras en consola para principiantes.";

pages = scr_split_text_into_pages(text, global.textbox_font, 20, 394, 200);
page = 0;
text_on_display = "";
text_finished = false;
alarm[0] = 3;

