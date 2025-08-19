function useItem(){
	
	var invItem = getItem(itemId);
	
	if (invItem != noone) {
		
		var itemDef = global.items[itemId];
		var action = itemDef[ITEM_DEF_ACTION];
	
		action();
	
		invItem[INVENTORY_QUANTITY] -= 1;

		if (invItem[INVENTORY_QUANTITY] <= 0) {
		
			removeItem(itemId);
		
		}
	
	}
	
}