if (text_on_display != pages[page]) {
    text_on_display += string_char_at(pages[page], string_length(text_on_display) + 1);
    alarm[0] = 3;
    text_finished = false; 
} else {
    text_finished = true; 
}
