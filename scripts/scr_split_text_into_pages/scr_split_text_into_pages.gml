// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información

/*
 * Esta función dividirá un texto en un array utilizando un ancho y una
 * altura como parametros. Puede ser utilizado para dividir un texto en 
 * multiples páginas en una caja de texto en un juego.
 *
 * @param text: El texto que queremos dividir
 * @param font: que fuente queremos utilizar
 * @param separation: la separación vertical entre linea y linea
 * @param width: Ancho máximo del texto
 * @param height: Alto máximo del texto
 */
function scr_split_text_into_pages(_text, _font, _separation, _width, _height) {
	var _pages = []; // Todas las paginas disponibles
	var _page = ""; // Pagina actual
	
	// Primero dividimos el texto en palabras, así que un texto como "hola mundo" se convierte en un array ["hola", "mundo"]
	var _words = scr_split_text(_text, " ");
	var _length = array_length(_words);

	// Colocamos la fuente con la que queremos medir el texto
	draw_set_font(_font);
	
	// Iteramos por cada una de las palabras
	for (var _i=0;_i<_length;_i++) {
		var _word = _words[_i];
		
		// Si el tamaño vertical de la pagina actual (page) + la palabra (word) es mayor o igual que la altura
		// que le pasamos como parametro a esta función (height)
		if (string_height_ext(_page + " " + _word, _separation, _width) >= _height) {
			// Entonces cerramos la página actual
			_pages[array_length(_pages)] = _page;
			// E iniciamos una nueva pagina con solo la palabra de esta iteración
			_page = _word;
		} else {
			// Si el tamaño vertical es menor entonces añadimos la palabra a la pagina actual
			if (_i > 0) { _page += " "; }
			_page += _word;
		}
	}
	
	// Luego de iterar por todas las palabras igual nos sobra una pagina, así que la añadimos a el total de paginas
	_pages[array_length(_pages)] = _page;
	
	// Retornamos todas las paginas
	return _pages;
}