extends Control

export (NodePath) var videoFrutaPath
export (NodePath) var fruta1Path 
export (NodePath) var fruta2Path
export (NodePath) var fruta3Path 
export (NodePath) var fruta4Path
export (NodePath) var perguntasMediasPath
export (NodePath) var timerPath

onready var video = get_node(videoFrutaPath)
onready var fruta1 = get_node(fruta1Path)
onready var fruta2 = get_node(fruta2Path)
onready var fruta3 = get_node(fruta3Path)
onready var fruta4 = get_node(fruta4Path)
onready var perguntasMedias = get_node(perguntasMediasPath)
onready var timer = get_node(timerPath)

var score = 0
var acabou = false
var fruta1Text
var fruta2Text
var fruta3Text
var fruta4Text
var videoText
var resposta

func _ready():
	randomize()
	set_Pergunta()
	
func set_Pergunta():
	var numPerguntas = perguntasMedias.get_child_count()
	var perguntaAtual
	
	if numPerguntas > 0:
		perguntaAtual = perguntasMedias.get_child(randi()%numPerguntas)
		fruta1Text = perguntaAtual.fruta1
		fruta2Text = perguntaAtual.fruta2
		fruta3Text = perguntaAtual.fruta3
		fruta4Text = perguntaAtual.fruta4
		videoText = perguntaAtual.video
		fruta1.set_texture(load('res://imagens/'+fruta1Text+'.png'))
		fruta2.set_texture(load('res://imagens/'+fruta2Text+'.png'))
		fruta3.set_texture(load('res://imagens/'+fruta3Text+'.png'))
		fruta4.set_texture(load('res://imagens/'+fruta4Text+'.png'))
		video.set_stream(load('res://videos/'+videoText+'.ogv'))
		video.play()
		resposta = perguntaAtual.resposta
	else:
		acabou = true
		print("Acabou")
	
	if perguntaAtual != null:
		perguntasMedias.remove_child(perguntaAtual)
	


func _on_Fruta1_button_up():
	if fruta1Text == resposta:
		print("Você acertou, "+fruta1Text)
		score += 1
		timer.start()
	else:
		print("Você errou, "+fruta1Text)
		


func _on_Fruta2_button_up():
	if fruta2Text == resposta:
		print("Você acertou, "+fruta2Text)
		score += 1
		timer.start()
	else:
		print("Você errou, "+fruta2Text)


func _on_Fruta3_button_up():
	if fruta3Text == resposta:
		print("Você acertou, "+fruta3Text)
		score += 1
		timer.start()
	else:
		print("Você errou, "+fruta3Text)


func _on_Fruta4_button_up():
	if fruta4Text == resposta:
		print("Você acertou, "+fruta4Text)
		score += 1
		timer.start()
	else:
		print("Você errou, "+fruta4Text)


func _on_Timer_timeout():
	set_Pergunta()


func _on_videoFruta_finished():
	video.play()
