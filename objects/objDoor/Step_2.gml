if(fade_in != noone && layer_sequence_is_finished(fade_in)){
	room_goto(target_room)
	
	fade_in = noone;
}