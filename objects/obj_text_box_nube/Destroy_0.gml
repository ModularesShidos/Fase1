show_debug_message("=== DESTROY obj_text_box_nube ===");
show_debug_message("Bandera terminar_clase2 = " + string(global.terminar_clase2));
show_debug_message("Bandera visto_dialogo_clase1 = " + string(global.visto_dialogo_clase1));

global.dialogo_activo = false;
global.visto_dialogo_clase1 = true;

if (global.terminar_clase2) {
	show_debug_message("Creando obj_mission_clear");
	instance_create_layer(0, 0, "UI", obj_mission_clear);
}
// que no se cree cuando es la mision 3 y hacer que aparezca el npc3