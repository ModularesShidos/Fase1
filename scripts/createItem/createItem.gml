// Aqui igual se podria poner el maxQuantity pero no es necesario, siemore sera 1
function createItem(name, description, sprite, action){

var item = array_create(4); 

item[ITEM_DEF_NAME] = name
item[ITEM_DEF_DESCRIPTION] = description
item[ITEM_DEF_SPRITE] = sprite
item[ITEM_DEF_ACTION] = action;

return item;


}