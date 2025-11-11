// obj_text_box_npc - Destroy

global.dialogo_activo = false;

// Si tenemos referencia al NPC, notifícalo para que espere la soltar de E
if (variable_instance_exists(id, "npc_ref")) {
    if (instance_exists(npc_ref)) {
        with (npc_ref) {
            dialogo_cerrado = true;
        }
    }
}
