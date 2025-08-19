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
    var _pages = [];
    var _page = "";

    show_debug_message("=== scr_split_text_into_pages INICIO ===");
    show_debug_message("Texto recibido: " + _text);

    // 1. Limpiar palabras vacías desde el split
    var _words = scr_split_text(_text, " ");
    var _length = array_length(_words);
    show_debug_message("Palabras detectadas: " + string(_length));

    draw_set_font(_font);

    for (var _i = 0; _i < _length; _i++) {
        var _word = _words[_i];

        // Simulamos la altura si agregamos la palabra
        var _altura = string_height_ext((_page == "" ? _word : _page + " " + _word), _separation, _width);
        show_debug_message("Iteración " + string(_i) + " -> palabra: '" + _word + "' / Altura si se añade: " + string(_altura));

        if (_altura > _height) { // ← Usa > para cortar justo cuando se exceda
            show_debug_message("Página completada (" + string(array_length(_pages)) + "): " + _page);
            _pages[array_length(_pages)] = _page;
            _page = _word; // nueva página
        } else {
            if (_page != "") { _page += " "; }
            _page += _word;
        }
    }

    // Añadimos la última página
    if (string_length(_page) > 0) {
        _pages[array_length(_pages)] = _page;
        show_debug_message("Página final añadida (" + string(array_length(_pages)-1) + "): " + _page);
    }

    // Resumen
    show_debug_message("Total de páginas generadas: " + string(array_length(_pages)));
    for (var j = 0; j < array_length(_pages); j++) {
        show_debug_message("Página " + string(j) + ": " + _pages[j]);
    }
    show_debug_message("=== scr_split_text_into_pages FIN ===");

    return _pages;
}
