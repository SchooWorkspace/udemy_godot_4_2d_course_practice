extends ParallaxBackground

@export var bg_texture: CompressedTexture2D = preload("res://assets/textures/bg/Blue.png")

@export var scroll_speed = 30

@onready var sprite = $ParallaxLayer/Sprite2D

func _ready():
	sprite.texture = bg_texture

func _process(delta):
	sprite.region_rect.position += delta * Vector2(scroll_speed, scroll_speed)
	if(sprite.region_rect.position >= Vector2(64, 64)):
		sprite.region_rect.position = Vector2.ZERO
