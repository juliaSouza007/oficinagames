class_name Bola extends Node2D

@export var adicionador_controle:float = 10;
## Isso é a mesma coisa do de cima:
@export var velocidade:Vector2 = Vector2(0,200);

func _process(delta: float) -> void:
	position += velocidade * delta
	
	if position.y > get_viewport_rect().size.y and velocidade.y > 0:
		velocidade = velocidade.bounce(Vector2.UP);
	if position.y < 0 and velocidade.y < 0:
		velocidade = velocidade.bounce(Vector2.DOWN);
	if position.x > get_viewport_rect().size.x and velocidade.x > 0:
		velocidade = velocidade.bounce(Vector2.LEFT);
	if position.x < 0 and velocidade.x < 0:
		velocidade = velocidade.bounce(Vector2.RIGHT);
	

func _on_area_entered(area: Area2D) -> void:
	velocidade = velocidade.bounce(Vector2.UP);
	
	if area is Jogador:
		var distancia = area.position - self.position;
		velocidade.x -= distancia.x * adicionador_controle;
		
	if area is Tijolo:
		area.queue_free();
	
	print("encostou")
