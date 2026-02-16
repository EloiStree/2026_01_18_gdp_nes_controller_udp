class_name NesFrJouer10SecondsNinja
extends Node

@export var nes_francais:FrancaisFacadeNesToUdp

@export var address_ip:String = "127.0.0.1"
@export var address_port:String = "7073"
@export var address_player:String = "1"

@export var debug_label:Label
@export var utiliser_des_prints_pour_debugger:=true
@export var utiliser_une_boucle_infinie_au_demarrage:=true
@export var test_des_methodes_au_demarrage: bool = false

@export_group("Touches du Ninja")
@export var touche_epee:=KeyboardControllerToInt.KeyboardCommandInt.X  
@export var touche_shuriken:=KeyboardControllerToInt.KeyboardCommandInt.Z
@export var touche_sauter:=KeyboardControllerToInt.KeyboardCommandInt.Up
@export var redemarrer_niveau:=KeyboardControllerToInt.KeyboardCommandInt.R
@export var aller_droite:=KeyboardControllerToInt.KeyboardCommandInt.Right
@export var aller_gauche:=KeyboardControllerToInt.KeyboardCommandInt.Left


@export_group("Touches pour du menu")
@export var menu_select:=KeyboardControllerToInt.KeyboardCommandInt.X
@export var menu_annuler:=KeyboardControllerToInt.KeyboardCommandInt.Z
@export var menu_option:=KeyboardControllerToInt.KeyboardCommandInt.C


@export_group("Touches pour le jeu")
@export var touche_gauche:=KeyboardControllerToInt.KeyboardCommandInt.Left
@export var touche_droite:=KeyboardControllerToInt.KeyboardCommandInt.Right
@export var touche_haut:=KeyboardControllerToInt.KeyboardCommandInt.Up
@export var touche_bas:=KeyboardControllerToInt.KeyboardCommandInt.Down
@export var touche_x:=KeyboardControllerToInt.KeyboardCommandInt.X
@export var touche_c:=KeyboardControllerToInt.KeyboardCommandInt.C
@export var touche_z:=KeyboardControllerToInt.KeyboardCommandInt.Z
@export var touche_escape:=KeyboardControllerToInt.KeyboardCommandInt.Escape
@export var touche_enter:=KeyboardControllerToInt.KeyboardCommandInt.Enter




func _quand_un_entier_est_envoyer_l_afficher(valeur:int):
	if debug_label:
		debug_label.text=str(valeur)

func _ready() -> void:
	
	nes_francais.recuperer_le_signal_quand_un_entier_est_envoye_a_la_cible().connect(_quand_un_entier_est_envoyer_l_afficher)
	nes_francais.definir_l_adresse_ip_de_la_cible(address_ip)
	nes_francais.definir_le_port_de_la_cible(address_port)
	nes_francais.definir_l_index_du_joueur_de_la_cible(address_player)	
	# pas necessaire a l exercice mais peut etre utiliser dans un autre exercice utilisant les touches de la nes
	nes_francais.changer_toutes_les_touches_de_la_nes_avec_le_clavier(touche_gauche, touche_droite, touche_haut, touche_bas, touche_epee, touche_shuriken, touche_escape, redemarrer_niveau)

	if test_des_methodes_au_demarrage:
		tester_les_methodes()
	if utiliser_une_boucle_infinie_au_demarrage:
		boucle_infinie()




func envoyer_shuriken():
	if utiliser_des_prints_pour_debugger:
		print("envoyer_shuriken")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(touche_shuriken, 100)
	
func coup_d_epee():
	if utiliser_des_prints_pour_debugger:
		print("coup_d_epee")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(touche_epee, 100)

@export var sauter_legerement_milliseconds:int = 100
@export var sauter_moyenement_milliseconds:int = 400
@export var sauter_maximum_milliseconds:int = 1000


func redemarrer_le_niveau():
	if utiliser_des_prints_pour_debugger:
		print("redemarrer_le_niveau")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(redemarrer_niveau, 100)

func passer_niveau_suivant():
	if utiliser_des_prints_pour_debugger:
		print("passer_niveau_suivant")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(touche_enter, 100)

func retourner_au_menu_principal():
	if utiliser_des_prints_pour_debugger:
		print("retourner_au_menu_principal")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(touche_escape, 100)


func sauter_legerement():
	if utiliser_des_prints_pour_debugger:
		print("sauter_legerement")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(touche_sauter, 100)

func sauter_moyenement():
	if utiliser_des_prints_pour_debugger:
		print("sauter_moyenement")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(touche_sauter, 400)

func sauter_maximum():
	if utiliser_des_prints_pour_debugger:
		print("sauter_maximum")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(touche_sauter, 1000)

func sauter_pendant_n_seconds(seconds:float):
	if utiliser_des_prints_pour_debugger:
		print("sauter_pendant_n_seconds: " + str(seconds) + " s")
	nes_francais.clavier_frapper_une_touche_pour_des_secondes(touche_sauter, seconds)

func sauter_pendant_n_milliseconds(milliseconds:int):
	if utiliser_des_prints_pour_debugger:
		print("sauter_pendant_n_milliseconds: " + str(milliseconds) + " ms")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(touche_sauter, milliseconds)


func commencer_a_sauter():
	if utiliser_des_prints_pour_debugger:
		print("commencer_a_sauter")
	nes_francais.clavier_appuyer_sur_une_touche(touche_sauter)

func arreter_de_sauter():
	if utiliser_des_prints_pour_debugger:
		print("arreter_de_sauter")
	nes_francais.clavier_relacher_une_touche(touche_sauter)

func commencer_aller_a_gauche():
	if utiliser_des_prints_pour_debugger:
		print("commencer_aller_a_gauche")
	nes_francais.clavier_appuyer_sur_une_touche(touche_gauche)

func commencer_aller_a_droite():
	if utiliser_des_prints_pour_debugger:
		print("commencer_aller_a_droite")
	nes_francais.clavier_appuyer_sur_une_touche(touche_droite)

func commencer_aller_en_haut():
	if utiliser_des_prints_pour_debugger:
		print("commencer_aller_en_haut")
	nes_francais.clavier_appuyer_sur_une_touche(touche_haut)

func commencer_aller_en_bas():
	if utiliser_des_prints_pour_debugger:
		print("commencer_aller_en_bas")
	nes_francais.clavier_appuyer_sur_une_touche(touche_bas)

func arreter_aller_a_gauche():
	if utiliser_des_prints_pour_debugger:
		print("arreter_aller_a_gauche")
	nes_francais.clavier_relacher_une_touche(touche_gauche)

func arreter_aller_a_droite():
	if utiliser_des_prints_pour_debugger:
		print("arreter_aller_a_droite") 
	nes_francais.clavier_relacher_une_touche(touche_droite)
	
func arreter_aller_en_haut():
	if utiliser_des_prints_pour_debugger:
		print("arreter_aller_en_haut")
	nes_francais.clavier_relacher_une_touche(touche_haut)

func arreter_aller_en_bas():
	if utiliser_des_prints_pour_debugger:
		print("arreter_aller_en_bas")
	nes_francais.clavier_relacher_une_touche(touche_bas)

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
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(touche_gauche, delay_milliseconds)

func aller_a_droite_pendant_des_millisecondes(delay_milliseconds:int):
	if utiliser_des_prints_pour_debugger:
		print("aller_a_droite_pendant_des_millisecondes: " + str(delay_milliseconds) + " ms")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(touche_droite, delay_milliseconds)

func aller_en_haut_pendant_des_millisecondes(delay_milliseconds:int):
	if utiliser_des_prints_pour_debugger:
		print("aller_en_haut_pendant_des_millisecondes: " + str(delay_milliseconds) + " ms")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(touche_haut, delay_milliseconds)

func aller_en_bas_pendant_des_millisecondes(delay_milliseconds:int):
	if utiliser_des_prints_pour_debugger:
		print("aller_en_bas_pendant_des_millisecondes: " + str(delay_milliseconds) + " ms")
	nes_francais.clavier_frapper_une_touche_pour_des_millisecondes(touche_bas, delay_milliseconds)


func aller_a_gauche_pendant_des_secondes(seconds:float):
	if utiliser_des_prints_pour_debugger:
		print("aller_a_gauche_pendant_des_secondes: " + str(seconds) + " s")
	nes_francais.clavier_frapper_une_touche_pour_des_secondes(touche_gauche, seconds)


func aller_a_droite_pendant_des_secondes(seconds:float):
	if utiliser_des_prints_pour_debugger:
		print("aller_a_droite_pendant_des_secondes: " + str(seconds) + " s")
	nes_francais.clavier_frapper_une_touche_pour_des_secondes(touche_droite, seconds)

func aller_en_haut_pendant_des_secondes(seconds:float):
	if utiliser_des_prints_pour_debugger:
		print("aller_en_haut_pendant_des_secondes: " + str(seconds) + " s")
	nes_francais.clavier_frapper_une_touche_pour_des_secondes(touche_haut, seconds)
	
func aller_en_bas_pendant_des_secondes(seconds:float):
	if utiliser_des_prints_pour_debugger:
		print("aller_en_bas_pendant_des_secondes: " + str(seconds) + " s")
	nes_francais.clavier_frapper_une_touche_pour_des_secondes(touche_bas, seconds)


func attendre_des_seconds(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func attendre_des_milliseconds(milliseconds: int) -> void:
	await get_tree().create_timer(milliseconds / 1000.0).timeout

func attendre_une_seconde() -> void:
	await attendre_des_seconds(1.0)


func tester_les_methodes():

	redemarrer_le_niveau()
	await attendre_des_seconds(3.0)
	redemarrer_le_niveau()
	await attendre_des_seconds(0.5)

	coup_d_epee()
	await attendre_des_seconds(1)
	envoyer_shuriken()
	await attendre_des_seconds(1)
	commencer_aller_a_droite()
	await attendre_des_seconds(1)
	arreter_aller_a_droite()
	commencer_aller_a_gauche()
	await attendre_des_seconds(1)
	arreter_aller_a_gauche()

	commencer_aller_en_haut()
	await attendre_des_seconds(1)
	arreter_aller_en_haut()

	await attendre_des_seconds(1)
	sauter_legerement()
	await attendre_des_seconds(1)
	sauter_moyenement()
	await attendre_des_seconds(1)
	


func boucle_infinie():
	while true:
		await attendre_des_seconds(1.0)
		redemarrer_le_niveau()
		arreter_de_bouger()
		await attendre_une_seconde()
		redemarrer_le_niveau()
		await attendre_une_seconde()

		commencer_aller_a_droite()
		await attendre_des_milliseconds(500)
		arreter_aller_a_droite()
		await attendre_une_seconde()

		sauter_pendant_n_milliseconds(200)
		commencer_aller_a_gauche()
		await attendre_des_milliseconds(300)
		sauter_pendant_n_seconds(400)
		await attendre_des_milliseconds(500)
		arreter_aller_a_gauche()


		await attendre_des_milliseconds(500)
		aller_a_droite_pendant_des_secondes(0.2)
		coup_d_epee()
		await attendre_des_milliseconds(500)
		coup_d_epee()
		await attendre_des_milliseconds(500)
		coup_d_epee()
		await attendre_des_milliseconds(500)


   
