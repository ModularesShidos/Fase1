// Mostrar el nuevo mensaje solo una vez
if (layer_exists("UI")) {
    instance_create_layer(0, 0, "UI", obj_text_box_nube);
} else {
    instance_create_layer(0, 0, "Instances", obj_text_box_nube);
}

fading_out = true; // Inicia el efecto de regreso
