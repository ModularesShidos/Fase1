/// Create Event
addItem(ITEM_CONTACTO_PROFE, 1);
show_message("Has obtenido el Contacto del Profe!!!  Guardalo con cautela, puede que te ayude en tu examen.");
global.contacto_obtenido = true;

with (Obj_Player_M) instance_destroy();
instance_create_layer(x, y, "Instances", obj_mission_clear);
instance_destroy(); // Me destruyo, ya cumplí mi rol