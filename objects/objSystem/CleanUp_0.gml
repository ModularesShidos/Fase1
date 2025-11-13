// Aqui se borra la memoria de la fuente que se crea 

if (!instance_exists(obj_text_box)) {
    if (font_exists(global.textbox_font)) {
        //font_delete(global.textbox_font); 
    }
}