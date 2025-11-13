// Si ya fue recogido destruye de inmediato este objeto
if (global.carta_recogida) {
    instance_destroy();
    exit; 
}

active = false; 

