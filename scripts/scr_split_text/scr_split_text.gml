// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información

/*
 * Esta función divide un texto utilizando un delimitador, por ejemplo,
 * si le pasamos el texto "hola mundo" y decimos que el delimitador es un espacio vacio " "
 * entonces nos retornará un array con dos palabras ["hola", "mundo"]
 * 
 * El delimitador puede ser cualquier caracter, no solamente espacios vacios, por ejemplo
 * si tenemos el texto "A:B:C:D:E:F:G y utilizamos el delimitador ":" la respuesta será
 * ["A", "B", "C", "D", "E", "F", "G"]
 * 
 * @param text: El texto que queremos dividir
 * @param delimiter: Caracter que queremos utilizar como delimitador
 */
function scr_split_text(_text, _delimiter) {
	var _words = []; // Todas las palabras a retornar
	
	// Estas dos variables nos ayudarán a buscar las palabras utilizando indices de busqueda
	var _i1 = 1;
	var _i2 = string_pos_ext(_delimiter, _text, _i1);
	
	// Si i2 no es igual a 0 es porque encontramos un delimitador 
	while (_i2 != 0) {
		// Si es así entonces copiamos la palabra utilizando los indices i1 y i2 y borramos cualquier rastro
		// del delimitador que haya quedado
		var _word = string_replace(string_copy(_text, _i1, _i2 - _i1), _delimiter, "");
		// Añadimos la palabra a la lista de palabras
		_words[array_length(_words)] = _word;
		// El i1 se comvierte en i2 y buscamos un nuevo i2
		_i1 = _i2 + 1;
		_i2 = string_pos_ext(_delimiter, _text, _i1);
	}
	
	// Si nos sobró una palabra al final lo añadimos al array de palabras
	if (_i1 <= string_length(_text)) {
		var _last_word = string_replace(string_copy(_text, _i1 + 1, string_length(_text)), _delimiter, "");
		_words[array_length(_words)] = _last_word;
	}
	
	// Regresamos la lista de palabras
	return _words;
}