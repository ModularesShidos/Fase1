global.dialogo_activo = true;
esperar_input = false;

show_debug_message("=== CREATE obj_text_box_nube ===");
show_debug_message("Bandera mision_1 = " + string(global.mision_1));
show_debug_message("Bandera mission_2 = " + string(global.mission_2));
show_debug_message("Bandera visto_dialogo_clase2 = " + string(global.visto_dialogo_clase2));
show_debug_message("Bandera mission_clear_2 = " + string(global.mission_clear_2));

if (!global.mision_1) {
	text = "Wow que buena clase, hasta se me quedo grabado que un diagrama de flujo es como un dibujo con flechas que muestra los pasos para realizar un programa. Tambien me enseñaron que un IDE es un programa donde escribres y pruebas código y que para instalarlo solo necesitas descargarlo de su página e instalarlo. Y un Hola Mundo es el programa más simple que imprime esas palabras en consola para principiantes.";
	show_debug_message("Texto asignado: CLASE 1");
} 
else if (global.mission_2 && !global.visto_dialogo_clase2) {
	text = "Hoy vimos lo básico de programación: los inputs son lo que el usuario mete al programa, los outputs lo que el programa muestra. Las variables son como cajitas donde guardamos datos, y hay distintos tipos de datos según lo que quieras guardar: números enteros, decimales, texto, verdadero/falso… básicamente eso.";
	//Se pone aqui para que se "Destruya" y no se mande a llamar varias veces desde el fade black
	global.visto_dialogo_clase2 = true;
	show_debug_message("Texto asignado: CLASE 2");
}
else if (global.visto_dialogo_clase2 && !global.mission_clear_2){
	text = "Como que olia medio raro";
	global.terminar_clase2 = true;
	global.mission_clear_2 = true;
	global.mision_terminada = 2;
	global.mission_2 = false;
	global.visto_dialogo_clase3 = true;
}
else if (global.visto_dialogo_clase3 && !global.mission_clear_3){
	text = "aaaaaaaaaaaaaaaaaaaa";
	global.terminar_clase3 = true;
	global.mission_clear_3 = true;
	global.mision_terminada = 3;
	global.mission_3 = false;
}



if (variable_instance_exists(id, "text")) {
    pages = scr_split_text_into_pages(text, global.textbox_font, 20, 394, 100);
    show_debug_message("Paginas generadas: " + string(array_length(pages)));
} else {
    show_debug_message("⚠️ Ningún texto asignado en CREATE -> destruyendo objeto");
    instance_destroy();
    exit;
}
page = 0;
text_on_display = "";
text_finished = false;
alarm[0] = 3;

