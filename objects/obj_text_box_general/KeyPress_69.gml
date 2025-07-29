if (!text_finished) {
    // Mostrar todo el texto de golpe
    text_on_display = pages[page];
    text_finished = true;
} else {
    // Ya se mostró toda la página actual
    page += 1;

    if (page < array_length(pages)) {
        text_on_display = "";
        text_finished = false;
        alarm[0] = 3;
    } else {
        // Ya terminó todo el texto, destruir textbox
        instance_destroy(); // <--- Aquí desaparece el obj_text_box
    }
}
