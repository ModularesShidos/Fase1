if (!text_finished) {
    text_on_display = pages[page];
    text_finished = true;
} else {
    page += 1;

    if (page < array_length(pages)) {
        text_on_display = "";
        text_finished = false;
        alarm[0] = 3;
    } else {
        instance_destroy(); // Destruir al terminar
    }
}
