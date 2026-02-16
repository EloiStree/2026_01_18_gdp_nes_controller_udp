class_name NesFrJouerUndertale 
extends Node

@export var nes_francais:FrancaisFacadeNesToUdp

@export var address_ip:String = "127.0.0.1"
@export var address_port:String = "7073"
@export var address_player:String = "0"

@export var debug_label:Label

@export var touche_confirmer:=KeyboardControllerToInt.KeyboardCommandInt.Z   
@export var touche_annuler:=KeyboardControllerToInt.KeyboardCommandInt.X
@export var touche_menu:=KeyboardControllerToInt.KeyboardCommandInt.C
@export var fleche_gauche:=KeyboardControllerToInt.KeyboardCommandInt.Left
@export var fleche_droite:=KeyboardControllerToInt.KeyboardCommandInt.Right
@export var fleche_haut:=KeyboardControllerToInt.KeyboardCommandInt.Up
@export var fleche_bas:=KeyboardControllerToInt.KeyboardCommandInt.Down

@export var test_des_methodes_au_demarrage: bool = true

@export var utiliser_des_prints_pour_debugger:=true

func _quand_un_entier_est_envoyer(valeur:int):
	if debug_label:
		debug_label.text=str(valeur)


func _ready() -> void:
	
	nes_francais.recuperer_le_signal_quand_un_entier_est_envoye_a_la_cible().connect(_quand_un_entier_est_envoyer)
	
	nes_francais.definir_l_adresse_ip_de_la_cible(address_ip)
	nes_francais.definir_le_port_de_la_cible(address_port)
	nes_francais.definir_l_index_du_joueur_de_la_cible(address_player)
	
	# pas necessaire a l exercice mais peut etre utiliser dans un autre exercice utilisant les touches de la nes

	nes_francais.changer_toutes_les_touches_de_la_nes_avec_le_clavier(fleche_gauche, fleche_droite, fleche_haut, fleche_bas, touche_confirmer, touche_annuler, touche_menu, touche_menu)

	if test_des_methodes_au_demarrage:
		tester_les_methodes()

func confirmer():
	if utiliser_des_prints_pour_debugger:
		print("confirmer")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(touche_confirmer, 100)

func annuler():
	if utiliser_des_prints_pour_debugger:
		print("annuler")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(touche_annuler, 100)

func menu():
	if utiliser_des_prints_pour_debugger:
		print("menu")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(touche_menu, 100)

func commencer_aller_a_gauche():
	if utiliser_des_prints_pour_debugger:
		print("commencer_aller_a_gauche")
	nes_francais.clavier_appuyer_sur_une_touche(fleche_gauche)

func commencer_aller_a_droite():
	if utiliser_des_prints_pour_debugger:
		print("commencer_aller_a_droite")
	nes_francais.clavier_appuyer_sur_une_touche(fleche_droite)

func commencer_aller_en_haut():
	if utiliser_des_prints_pour_debugger:
		print("commencer_aller_en_haut")
	nes_francais.clavier_appuyer_sur_une_touche(fleche_haut)

func commencer_aller_en_bas():
	if utiliser_des_prints_pour_debugger:
		print("commencer_aller_en_bas")
	nes_francais.clavier_appuyer_sur_une_touche(fleche_bas)

func arreter_aller_a_gauche():
	if utiliser_des_prints_pour_debugger:
		print("arreter_aller_a_gauche")
	nes_francais.clavier_relacher_une_touche(fleche_gauche)

func arreter_aller_a_droite():
	if utiliser_des_prints_pour_debugger:
		print("arreter_aller_a_droite") 
	nes_francais.clavier_relacher_une_touche(fleche_droite)
	
func arreter_aller_en_haut():
	if utiliser_des_prints_pour_debugger:
		print("arreter_aller_en_haut")
	nes_francais.clavier_relacher_une_touche(fleche_haut)

func arreter_aller_en_bas():
	if utiliser_des_prints_pour_debugger:
		print("arreter_aller_en_bas")
	nes_francais.clavier_relacher_une_touche(fleche_bas)

func arreter_de_bouger():
	if utiliser_des_prints_pour_debugger:
		print("arreter_de_bouger")
	arreter_aller_a_gauche()
	arreter_aller_a_droite()
	arreter_aller_en_haut()
	arreter_aller_en_bas()



func aller_a_gauche_pendant_des_millisecondes(delay_milliseconds:int):
	if utiliser_des_prints_pour_debugger:
		print("aller_a_gauche_pendant_des_millisecondes: " + str(delay_milliseconds) + " ms")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(fleche_gauche, delay_milliseconds)

func aller_a_droite_pendant_des_millisecondes(delay_milliseconds:int):
	if utiliser_des_prints_pour_debugger:
		print("aller_a_droite_pendant_des_millisecondes: " + str(delay_milliseconds) + " ms")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(fleche_droite, delay_milliseconds)

func aller_en_haut_pendant_des_millisecondes(delay_milliseconds:int):
	if utiliser_des_prints_pour_debugger:
		print("aller_en_haut_pendant_des_millisecondes: " + str(delay_milliseconds) + " ms")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(fleche_haut, delay_milliseconds)

func aller_en_bas_pendant_des_millisecondes(delay_milliseconds:int):
	if utiliser_des_prints_pour_debugger:
		print("aller_en_bas_pendant_des_millisecondes: " + str(delay_milliseconds) + " ms")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(fleche_bas, delay_milliseconds)


func aller_a_gauche_pendant_une_seconde(delay_seconds:float):
	aller_a_gauche_pendant_des_millisecondes(int(delay_seconds * 1000.0))

func aller_a_droite_pendant_une_seconde(delay_seconds:float):
	aller_a_droite_pendant_des_millisecondes(int(delay_seconds * 1000.0))

func aller_en_haut_pendant_une_seconde(delay_seconds:float):
	aller_en_haut_pendant_des_millisecondes(int(delay_seconds * 1000.0))
	
func aller_en_bas_pendant_une_seconde(delay_seconds:float):
	aller_en_bas_pendant_des_millisecondes(int(delay_seconds * 1000.0))



func attendre_des_seconds(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
func attendre_des_milliseconds(milliseconds: int) -> void:
	await get_tree().create_timer(milliseconds / 1000.0).timeout

func attendre_une_seconde() -> void:
	await attendre_des_seconds(1.0)




func tester_les_methodes():

	# Le temps d aller dans l application.
	await attendre_des_seconds(3.0)

	commencer_aller_en_bas()
	await attendre_une_seconde()
	arreter_aller_en_bas()
	await attendre_une_seconde()


	commencer_aller_a_droite()
	await attendre_une_seconde()
	arreter_aller_a_droite()
	await attendre_une_seconde()

	commencer_aller_en_haut()
	await attendre_une_seconde()
	arreter_aller_en_haut()
	await attendre_une_seconde()

	commencer_aller_a_gauche()
	await attendre_une_seconde()
	arreter_aller_a_gauche()
	await attendre_une_seconde()


	commencer_aller_a_droite()
	await attendre_une_seconde()
	arreter_de_bouger()

	commencer_aller_a_gauche()
	await attendre_une_seconde()
	arreter_de_bouger()

	commencer_aller_a_droite()
	await attendre_une_seconde()
	arreter_de_bouger()
	
	commencer_aller_en_haut()
	await attendre_une_seconde()
	arreter_de_bouger()

	commencer_aller_en_bas()
	await attendre_une_seconde()
	arreter_de_bouger()

	aller_a_gauche_pendant_une_seconde(1.0)
	await attendre_une_seconde()
	aller_a_droite_pendant_une_seconde(1.0)
	await attendre_une_seconde()
	aller_en_haut_pendant_une_seconde(1.0)
	await attendre_une_seconde()
	aller_en_bas_pendant_une_seconde(1.0)
	await attendre_une_seconde()
	confirmer()
	await attendre_une_seconde()
	annuler()
	await attendre_une_seconde()
	menu()
	await attendre_une_seconde()
   
