global.dialogo_activo = true;

if (!global.mision_1) {
	text = "Bienvenido a CUCEI nuevo estudiante!!!. Esperamos que tengas un gran día, tenemos el honor de anunciarte que tu primer clase de ingeniería informática comienza en 5 minutos en el edificio X salón número 7, apurate para llegar a tiempo. Buena ssuerte!!!";
} 
else if (global.mission_2) {
	text = "Apresurate, tienes una clase de programación en 5 minutos en el edificio X salon número 12.";
}
else if (global.mission_3) {
	text = "Felicidades terminaste tus clases de programación básica. Ahora podras comenzar con tus clases de métodos matemáticos. Esas clases son el edificio Q salon numero 8, apresurate!!!";
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