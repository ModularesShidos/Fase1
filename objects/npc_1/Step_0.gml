// Cooldown para evitar spam
if (cooldown > 0) {
    cooldown -= 1;
    exit;
}

// Verificar distancia y tecla E
if (distance_to_object(Obj_Player_M) < 40 && keyboard_check_pressed(ord("E")) && !global.dialogo_activo) {
    
    global.dialogo_activo = true;
    dialogo_cerrado = false;
    cooldown = 60; // 1 segundo de cooldown
    
    // Crear comentario aleatorio
    instance_create_layer(x, y - 32, "Instances", obj_text_box_comentarios);
}