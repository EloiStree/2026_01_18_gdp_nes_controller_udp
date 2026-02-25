class_name UiLineEditNesButtonsToFacade
extends Node


@export var nes_facade:FacadeNesToUdp

@export var line_editor_arrow_up:LineEdit
@export var line_editor_arrow_right:LineEdit
@export var line_editor_arrow_down:LineEdit
@export var line_editor_arrow_left:LineEdit
@export var line_editor_button_a:LineEdit
@export var line_editor_button_b:LineEdit
@export var line_editor_button_menu_left:LineEdit
@export var line_editor_button_menu_right:LineEdit



func update_line_editor_from_nes_facade():
	
	line_editor_arrow_up.text =str(nes_facade.get_nes_button_arrow_up_as_int())
	line_editor_arrow_right.text =str( nes_facade.get_nes_button_arrow_right_as_int())
	line_editor_arrow_down.text = str(nes_facade.get_nes_button_arrow_down_as_int())
	line_editor_arrow_left.text = str(nes_facade.get_nes_button_arrow_left_as_int())
	line_editor_button_a.text =str( nes_facade.get_nes_button_a_as_int())
	line_editor_button_b.text =str( nes_facade.get_nes_button_b_as_int())
	line_editor_button_menu_left.text = str(nes_facade.get_nes_button_menu_left_as_int())	
	line_editor_button_menu_right.text = str(nes_facade.get_nes_button_menu_right_as_int())
	
	
func update_nes_facade_from_line_editor():
	nes_facade.override_all_nes_buttons_from_text( 
		line_editor_arrow_left.text,
		line_editor_arrow_right.text,
		line_editor_arrow_up.text,
		line_editor_arrow_down.text,
		line_editor_button_a.text,
		line_editor_button_b.text,
		line_editor_button_menu_left.text,
		line_editor_button_menu_right.text
		)
		
	
	

func set_with_nes_resource_int(resource: NesableGameMappingInt):
	nes_facade.nes_override_buttons_with_resource_int(resource)
	update_line_editor_from_nes_facade()

func set_with_nes_resource_xbox(resource: NesableGameMappingXboxBasic):
	nes_facade.nes_override_buttons_with_resource_xbox(resource)
	update_line_editor_from_nes_facade()

func set_with_nes_resource_keyboard(resource: NesableGameMappingKeyboard):
	nes_facade.nes_override_buttons_with_resource_keyboard(resource)
	update_line_editor_from_nes_facade()
