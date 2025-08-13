function removeItem(itemId){
	var item = getItem(itemId);
	
	if (item != noone) {
	
		var pos = ds_list_find_index(global.inventory, item);
		ds_list_delete(global.inventory, pos);
	
	}
	

}