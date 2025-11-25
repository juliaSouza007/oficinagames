class_name Bola extends Area2D


@export var adicionador_controle:float = 10;
## Isso é a mesma coisa do de cima:
@export var velocidade:Vector2 = Vector2(0,200);

signal bateu_num_tijolo();
signal bateu();

func _process(delta: float) -> void:
	position += velocidade * delta
	
	if position.y > get_viewport_rect().size.y and velocidade.y > 0:
		Game.instance.game_over();
	if position.y < 0 and velocidade.y < 0:
		velocidade = velocidade.bounce(Vector2.DOWN);
	if position.x > get_viewport_rect().size.x and velocidade.x > 0:
		velocidade = velocidade.bounce(Vector2.LEFT);
	if position.x < 0 and velocidade.x < 0:
		velocidade = velocidade.bounce(Vector2.RIGHT);
	


func _on_area_entered(area: Area2D) -> void:
	velocidade = velocidade.bounce(Vector2.UP);
	
	bateu.emit();
	
	if area is Jogador:
		var distancia = area.position - self.position;
		velocidade.x -= distancia.x * adicionador_controle;
		velocidade.x = clampf(velocidade.x, -400, 400);
		
	if area is Tijolo:
		bateu_num_tijolo.emit();
		area.queue_free(); ##Queue_free() é destruir!!
	
	print("encostou em %s" % [area])
