function addItem(itemId, quantity){
	
	var item = getItem(itemId);
	
	if(item != noone){
		//Aqui se tendria que poner el maxQuantity en la ultima linea pero como solo hay 1 item de cada objeto se pone 1
		item[INVENTORY_QUANTITY] = clamp(item[INVENTORY_QUANTITY] + quantity, 1, 1);

	} else {

		item[INVENTORY_ITEM] = itemId;
		item[INVENTORY_QUANTITY] = 1;


		ds_list_add(inventory, item);
	}

}