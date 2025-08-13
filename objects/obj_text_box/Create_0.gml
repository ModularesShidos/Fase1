global.dialogo_activo = true;

//Constantes Cajas de texto   
text = "Bienvenido a CUCEI nuevo estudiante!!!.         Esperamos que tengas un gran día, tenemos el honor de anunciarte que tu primer clase de ingeniería informática comienza en 5 minutos en el edificio X salón número 7, apurate para llegar a tiempo. Buena ssuerte!!!  AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
// Aqui se manda a llamar las funciones auxiliares para que se vaya paginando el texto si es muy largo para un solo cuadro de dialogo
pages = scr_split_text_into_pages(text, global.textbox_font, 20, 394, 200);
page = 0;
text_on_display = "";

text_finished = false;
alarm[0] = 3;