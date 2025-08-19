// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información

/*
 * Esta función divide un texto utilizando un delimitador, por ejemplo,
 * si le pasamos el texto "hola mundo" y decimos que el delimitador es un espacio vacio " "
 * entonces nos retornará un array con dos palabras ["hola", "mundo"]
 * 
 * El delimitador puede ser cualquier caracter, no solamente espacios vacios, por ejemplo
 * si tenemos el texto "A:B:C:D:E:F:G" y utilizamos el delimitador ":" la respuesta será
 * ["A", "B", "C", "D", "E", "F", "G"]
 * 
 * @param text: El texto que queremos dividir
 * @param delimiter: Caracter que queremos utilizar como delimitador
 */
function scr_split_text(_text, _delimiter) {
    var _words = [];

    show_debug_message("=== scr_split_text INICIO ===");
    show_debug_message("Texto recibido: " + _text);
    show_debug_message("Delimitador usado: '" + _delimiter + "'");

    var _i1 = 1;
    var _i2 = string_pos_ext(_delimiter, _text, _i1);

    while (_i2 != 0) {
        var _word = string_replace(string_copy(_text, _i1, _i2 - _i1), _delimiter, "");
        if (string_length(_word) > 0) { // ← Ignorar palabras vacías
            _words[array_length(_words)] = _word;
        }
        _i1 = _i2 + 1;
        _i2 = string_pos_ext(_delimiter, _text, _i1);
    }

    if (_i1 <= string_length(_text)) {
        var _last_word = string_replace(string_copy(_text, _i1 + 1, string_length(_text)), _delimiter, "");
        if (string_length(_last_word) > 0) {
            _words[array_length(_words)] = _last_word;
        }
    }

    show_debug_message("scr_split_text -> Palabras encontradas: " + string(array_length(_words)));
    for (var i = 0; i < array_length(_words); i++) {
        show_debug_message("Palabra " + string(i) + ": " + _words[i]);
    }
    show_debug_message("=== scr_split_text FIN ===");

    return _words;
}
