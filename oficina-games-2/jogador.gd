class_name Jogador extends Area2D

var velocidade:float = 500

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_RIGHT) or Input.is_key_pressed(KEY_D):
		self.position.x += velocidade * delta;
	if Input.is_key_pressed(KEY_LEFT) or Input.is_key_pressed(KEY_A):
		self.position.x -= velocidade * delta;
