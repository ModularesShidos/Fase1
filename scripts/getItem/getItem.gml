// Busca en todo el inventario si tenemos un item y lo devuelve si lo encuentra o si no existe 
function getItem(itemId){
	
	var _length = ds_list_size(global.inventory);

	for(var i=0; i<_length; i++){

		var item = global.inventory[| i];	
		
		if(item[INVENTORY_ITEM]  == itemId){
			return item;

		}
	}

	return noone;

}