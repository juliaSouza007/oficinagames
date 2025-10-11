class_name Game extends Node2D 

static var instance:Game;

var ponto:int;

@export var labelPerdeu:Label;
@export var labelPontos:Label;

func _ready() -> void:
	instance = self;
	print("oi game");
	
func _process(_delta: float) -> void:
	if Input.is_key_pressed(KEY_R):
		get_tree().reload_current_scene();

func game_over():
	labelPerdeu.visible = true;

func _on_bola_bateu_num_tijolo() -> void:
	ponto += 1;
	labelPontos.text = "Pontos:" + str(ponto);
