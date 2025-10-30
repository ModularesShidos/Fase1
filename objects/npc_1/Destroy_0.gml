// En obj_text_box_comentarios DESTROY:
global.dialogo_activo = false;

// Buscar y actualizar el NPC que habló
with (obj_npc_fondo) {
    if (distance_to_object(other.x, other.y) < 50) {
        dialogo_cerrado = true;
    }
}