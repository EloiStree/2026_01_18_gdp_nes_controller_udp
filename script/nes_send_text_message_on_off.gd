# Text is great but it is very heavy on the network.

class_name NesSendTextMessageOnOff extends Node

@export var sent_when_down:String="On Down Message"
@export var sent_when_up:String="On up Message"

#Hey if you want a message you can listen here.
signal on_request_to_send_message(message:String)

# If someone ask me to send a message
func request_to_send_message(on_off_value:bool):
	
	
	# if is true and so on...
	if on_off_value== true:
		# I send what the game designer (you here) asked
		on_request_to_send_message.emit(sent_when_down)
		print("Test A:" +str(sent_when_down))
	elif on_off_value == false:
		# if it is release, then the other message.
		on_request_to_send_message.emit(sent_when_up)
		
	
