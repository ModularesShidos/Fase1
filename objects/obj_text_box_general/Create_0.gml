global.dialogo_activo = true;

switch (global.dialogo_id) {
    case 1:
        text = "Hola, necesito tu ayuda. Acabo de perder una carta muy importante para mí, tiene mucho valor sentimental y no puedo dejarla así nada más. Crees que puedas ayudarme a buscarla, por favor? La última vez que la tuve conmigo estaba cerca del edificio V, así que tal vez se me cayó en esa zona. No sé qué haría si la pierdo para ssiempre...";
        break;

    case 2:
        text = "Por favor, échame una mano y revisa en el edificio V. No puedo moverme mucho ahora porque estoy esperando a alguien, y me sería de gran ayuda que le dieras un vistazo mientras tanto. Te lo agradeceré bbastante.";
        break;
		
	case 3: 
		text = "Te lo agradezco muchísimo!! Esa carta fue muy especial para mí cuando comencé el semestre. Mi idea original era regalársela a una amiga para que tuviera ánimos de estudiar, pero me temo que al final ella no vendrá. Así que, si quieres, puedes quedártela tú. Te servirá como recordatorio de que nunca hay que rendirse en esta aventura uuniversitaria.";
		break;
		
	case 4: 
		text = "Hola compañero. Veo que no tienes muchos amigos que te platiquen estas cosas, así que te paso un buen consejo: si alguna vez terminas clases con hambre, date una vuelta por 'El Globo'. Es una cafetería circular muy famosa aquí en CUCEI, siempre llena de estudiantes. Hay de todo: tortas, chilaquiles, café, y hasta postres. Solo asegúrate de ir en una buena hora porque casi siempre está lleno y toca esperar. Lo encontrarás cerca de la entrada por Boulevard, después de los edificios Alfa y Beta. Créeme, vale la ppena.";
		break;
		
	case 5: 
		text = "Date prisa y lánzate al Globo, que luego se acaba la comida rápido y te quedas con el antojo. No hay nada peor que salir de clase con hambre y ver las vitrinas vacías.";
		global.dialogo_id = 6;
		break;
		
	case 6: 
		text = "Soy el maestro ayuda!!!";
		break;
		
	case 7: 
		text = "¡Oh, qué bueno que te veo por aqui joven! Verás… tengo un pequeño problemita. Una maestra me pidió que le arreglara su laptop, pero resulta que olvidé la contraseña Lo curioso es que me acuerdo que ella misma me contó que la sacó de un grafiti que encontró en el edificio Alfa. ¡Imagínate eso, una contraseña inspirada en un rayón de pared! Jajaja. Hazme un favor: ve a revisar ese edificio, seguro el grafiti todavía está ahí. Cuando lo veas, vuelve y cuéntame cuál es, así podré desbloquear la compu sin que me regañe. ¡Confío en tti!";
		break;
		
	case 8: 
		text = "¡Ah, eres tú otra vez! Mira, date prisa porque la maestra ya casi necesita su laptop y si no se la entrego funcionando me va a colgar de los cables. Ve a ver ese grafiti en el edificio Alfa y regresa cuanto antes. Yo estaré esperando aquí en el mismo lugar para que me digas la contraseña apenas la descubras.";
		break;
		
	case 9:
		//Maestro agradece por recuperar la contraseña
		text = "¡JA! ¡Sabía que podías con esto! Eres más confiable que un pendrive en forma de llavero. La maestra ya puede respirar tranquila gracias a ti. Como muestra de mi gratitud, te daré mi contacto. Úsalo solo en momentos complicados, cuando sientas que una pregunta del examen te quiere mandar directo a extraordinario. ¡Será como tener un comodín de profe a tu llado!";
		break;
		
	case 10: 
		text = "¡Qué onda amigo! ¿Cómo has estado?, ¿cómo te está tratando la universidad? Me alegra verte. Oye, creo que olvidé mi Funko de Pikachu en alguna parte del estacionamiento de Boulevard en la entrada trasera de CUCEI. Podrías darme una mano para buscarlo, por favor? Escuché que hay algo en ese estacionamiento que seguro te llamará la atención y hasta te sacará una ssonrisa.";
		break;
		
	case 11: 
		text = "Si también eres otaku, te va a encantar lo que verás en el estacionamiento. Créeme, no es algo que te encuentres todos los días dentro de un campus universitario.";
		break;
		
	case 12: 
		text = "¡Muchísimas gracias, amigo! Espero que hayas tenido la suerte de ver ese auto de Pikachu en el estacionamiento. Es una verdadera joya, lleno de detalles que lo hacen único. ¿A poco no está increíble?";
		global.class_state = 4;
		break;
		
	case 13: 
		text = "¡Eh, tú! Sí, tú. ¿Has oído la leyenda? Resulta que hace muchos años hubo un director de CUCEI que estaba cansadísimo de que los estudiantes copiaran en los exámenes. Según dicen, estaba tan desesperado que un día decidió hacer algo extremo: encantó las tres fuentes del campus. Su idea era simple pero rara… pensaba que, en lugar de copiar, los alumnos tendrían que ganarse el conocimiento enfrentándose a pruebas mágicas y misteriosas. En su lógica retorcida, sólo aquel que demostrara valor y astucia podría obtener el verdadero saber. Desde entonces, las fuentes dejaron de ser simples adornos de concreto y agua, y se convirtieron en guardianes del conocimiento. La historia cuenta que quien beba de las tres obtiene la llave del conocimiento absoluto, suficiente para transformarse en el mítico 'Ingeniero Dragón', una especie de genio todopoderoso con la habilidad de entender hasta los códigos más horribles escritos en C sin comentarios. Obviamente suena ridículo… ¿o no? Hay quienes juran que intentaron superar las pruebas mágicas que las protegen: pasillos que cambian de forma, bibliotecas embrujadas que no te dejan salir hasta que cites bien todas tus fuentes en formato APA, y aulas donde el tiempo se detiene justo cuando el profe empieza a explicar lo más difícil. ¿Sabes qué es lo mejor? Algunos dicen que si logras beber del agua de las tres fuentes, hasta podrías obtener el conocimiento necesario para pasar tus próximos exámenes sin despeinarte, sin desveladas y, lo más increíble de todo… sin café. Aunque bueno, yo no confiaría demasiado en esa parte… ¿o sí? En fin, yo que tú iba a buscarlas, nunca se sabe. Total, peor que un examen sorpresa no puede ser, ¿no? O quién sabe, igual y solo es un cuento que inventó alguien que reprobó cálculo tres veces seguidas… pero hey, nunca se ssabe.";
		break;
		
	case 14: 
		text = "¿Otra vez aquí? ¿Qué, quieres que te repita el cuento como si fuera clase de repaso? No pierdas tiempo, las fuentes no se van a buscar solas. Dicen que están protegidas por pruebas rarísimas: pasillos que cambian de forma, aulas que parecen eternas y bibliotecas que te miran raro si bostezas. Pocos se han atrevido y ninguno lo ha logrado. Así que muévete, que si logras encontrarlas podrías convertirte en leyenda... o al menos tener una buena anécdota para la ccafetería.";
		break;
	
	case 15: 
		text = "Buena día joven, hoy tendrás tu examen final, con esto sabremos si tus clases te fueron de utilidad y no solo te la pasaste paseando por este centro universitario... Bien te deseo suerte, ccomencemos.";
		break;

    default:
        text = "Sin diálogo definido.";
        break;
}

// Aquí parte tu lógica de paginado
pages = scr_split_text_into_pages(text, Font3, 22, 340, 185);
page = 0;
text_on_display = "";
text_finished = false;
alarm[0] = 3;
