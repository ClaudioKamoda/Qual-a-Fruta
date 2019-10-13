extends Control

#export (NodePath) var gifFrutaPath
export (NodePath) var fruta1Path 
export (NodePath) var fruta2Path
export (NodePath) var perguntasFaceisPath

onready var fruta1 = get_node(fruta1Path)
onready var fruta2 = get_node(fruta2Path)
onready var perguntasFaceis = get_node(perguntasFaceisPath)

var score = 0
var acabou = false
var fruta1Text
var fruta2Text
var resposta

func _ready():
	randomize()
	set_Pergunta()
	
func set_Pergunta():
	var numPerguntas = perguntasFaceis.get_child_count()
	var perguntaAtual
	
	if numPerguntas > 0:
		perguntaAtual = perguntasFaceis.get_child(randi()%numPerguntas)
		fruta1Text = perguntaAtual.fruta1
		fruta2Text = perguntaAtual.fruta2
		fruta1.set_texture(load('res://imagens/'+fruta1Text+'.png'))
		fruta2.set_texture(load('res://imagens/'+fruta2Text+'.png'))
		resposta = perguntaAtual.resposta
	else:
		acabou = true
	
	if perguntaAtual != null:
		perguntasFaceis.remove_child(perguntaAtual)
	

func _on_Fruta_1_button_up():
	if fruta1Text == resposta:
		print("Você acertou, "+fruta1Text)
		score += 1
	else:
		print("Você errou"+fruta1Text)
	

func _on_Fruta_2_button_up():
	if fruta2Text == resposta:
		print("Você acertou"+fruta2Text)
		score += 1
	else:
		print("Você errou"+fruta2Text)
	
