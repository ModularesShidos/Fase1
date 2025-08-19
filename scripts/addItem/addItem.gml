function addItem(itemId, quantity) {
    var item = getItem(itemId);

    if (item != noone) {
        item[INVENTORY_QUANTITY] = clamp(item[INVENTORY_QUANTITY] + quantity, 1, 1);
    } else {
        var newItem = array_create(2); // 0 = INVENTORY_ITEM, 1 = INVENTORY_QUANTITY
        newItem[INVENTORY_ITEM] = itemId;
        newItem[INVENTORY_QUANTITY] = quantity;
        ds_list_add(global.inventory, newItem);
    }
}
