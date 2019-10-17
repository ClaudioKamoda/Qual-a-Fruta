extends Control

export (NodePath) var placarPath
export (NodePath) var videoFrutaPath
export (NodePath) var fruta1Path 
export (NodePath) var fruta2Path
export (NodePath) var perguntasFaceisPath
export (NodePath) var timerPath

onready var placar = get_node(placarPath)
onready var video = get_node(videoFrutaPath)
onready var fruta1 = get_node(fruta1Path)
onready var fruta2 = get_node(fruta2Path)
onready var perguntasFaceis = get_node(perguntasFaceisPath)
onready var timer = get_node(timerPath)

var score = 0
var acabou = false
var fruta1Text
var fruta2Text
var videoText
var resposta
var penalty = 0

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
		videoText = perguntaAtual.video
		fruta1.set_texture(load('res://imagens/'+fruta1Text+'.png'))
		fruta2.set_texture(load('res://imagens/'+fruta2Text+'.png'))
		video.set_stream(load('res://videos/'+videoText+'.ogv'))
		video.play()
		resposta = perguntaAtual.resposta
	else:
		acabou = true
		print("Acabou")
	
	if perguntaAtual != null:
		perguntasFaceis.remove_child(perguntaAtual)
	

func _on_Fruta_1_button_up():
	if fruta1Text == resposta:
		score = score + 100 - penalty
		penalty = 0
		print("Você acertou, "+fruta1Text+" "+str(score))
		placar.set_text(" Pontuação : "+str(score))
		timer.start()
	else:
		penalty += 10
		print("Você errou, "+fruta1Text+" "+str(score))
		placar.set_text(" Pontuação : "+str(score))
	

func _on_Fruta_2_button_up():
	if fruta2Text == resposta:
		score = score + 100 - penalty
		penalty = 0
		print("Você acertou, "+fruta2Text+" "+str(score))
		placar.set_text(" Pontuação : "+str(score))
		timer.start()
	else:
		penalty += 10
		print("Você errou, "+fruta2Text+" "+str(score))
		placar.set_text(" Pontuação : "+str(score))
	

func _on_timer_timeout():
	set_Pergunta()

func _on_VideoFruta_finished():
	video.play()
