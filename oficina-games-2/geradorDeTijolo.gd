class_name GeradorDeTijolo extends Node2D

@export var cena_tijolo:PackedScene;

func _ready() -> void:
	
	for i in range(9):
		for j in range(4):
			var tijolo = cena_tijolo.instantiate();
			add_child(tijolo);
			tijolo.position.x = i * 150;
			tijolo.position.y = 50 + j * 80;
	pass
