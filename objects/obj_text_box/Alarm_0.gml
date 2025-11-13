if (page >= array_length(pages)) {
    exit;
}


if (text_on_display != pages[page]) {
	//Linea para debug
	var next_char = string_char_at(pages[page], string_length(text_on_display) + 1);
    text_on_display += string_char_at(pages[page], string_length(text_on_display) + 1);
	show_debug_message("Alarm0 -> Añadiendo char: '" + next_char + "' | ahora: \"" + text_on_display + "\"");
    alarm[0] = 3;
    text_finished = false; 
} else {
    text_finished = true; 
	show_debug_message("Alarm0 -> Página terminada: \"" + pages[page] + "\"");
}

