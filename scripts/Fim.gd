extends Control

export (NodePath) var placarPath

onready var Placar = get_node(placarPath)

func _ready():
	Placar.set_text(" Pontuação : "+str(global.score))

func _on_Reiniciar_pressed():
	$FadeIn.show()
	$FadeIn.fade_in()

func _on_FadeIn_fade_finished():
	get_tree().change_scene('res://cenas/TitleScreen.tscn')


