if(fade_out != noone){
	layer_sequence_create("Disolve", room_width / 2, room_height / 2, fade_out);
	fade_out = noone;
}